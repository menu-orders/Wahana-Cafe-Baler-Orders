create table if not exists public.restaurant_settings (
  id integer primary key default 1 check (id = 1),
  name text not null default 'Wahana Café Baler',
  logo_url text not null default '',
  logo_verified boolean not null default false,
  menu_source_url text not null default 'https://www.facebook.com/wahanacabin',
  menu_verified boolean not null default false,
  delivery_fee numeric(12,2) not null default 0 check (delivery_fee >= 0)
);
insert into public.restaurant_settings (id) values (1) on conflict do nothing;

create table if not exists public.menu_items (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(name) between 1 and 120),
  description text not null default '',
  price numeric(12,2) not null check (price > 0),
  category text not null,
  image_url text not null default '',
  tags text[] not null default '{}',
  is_available boolean not null default true,
  sort_order integer not null default 0
);

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  receipt_token uuid not null default gen_random_uuid(),
  order_mode text not null check (order_mode in ('dine-in', 'take-out', 'delivery')),
  customer_details jsonb not null,
  items jsonb not null,
  subtotal numeric(12,2) not null,
  delivery_fee numeric(12,2) not null default 0,
  total numeric(12,2) not null,
  claim_number text unique,
  note text not null default '',
  status text not null default 'pending' check (status in ('pending', 'confirmed', 'preparing', 'ready', 'completed', 'cancelled')),
  created_at timestamptz not null default now()
);

-- Contains no customer details. Read-only access enables live reservation warnings.
create table if not exists public.claim_numbers (
  claim_number text primary key check (claim_number ~ '^[1-9][0-9]{0,5}$'),
  reserved_at timestamptz not null default now()
);

alter table public.restaurant_settings enable row level security;
alter table public.menu_items enable row level security;
alter table public.orders enable row level security;
alter table public.claim_numbers enable row level security;

drop policy if exists public_settings_read on public.restaurant_settings;
create policy public_settings_read on public.restaurant_settings for select to anon, authenticated using (true);
drop policy if exists public_menu_read on public.menu_items;
create policy public_menu_read on public.menu_items for select to anon, authenticated using (is_available = true);
drop policy if exists public_claims_read on public.claim_numbers;
create policy public_claims_read on public.claim_numbers for select to anon, authenticated using (true);

revoke all on public.orders from anon, authenticated;
revoke all on public.restaurant_settings, public.menu_items, public.claim_numbers from anon, authenticated;
grant select on public.restaurant_settings, public.menu_items, public.claim_numbers to anon, authenticated;

create or replace function public.is_claim_available(p_claim_number text)
returns boolean language sql stable security definer set search_path = public, pg_temp as $$
  select p_claim_number ~ '^[1-9][0-9]{0,5}$'
    and not exists (select 1 from public.claim_numbers where claim_number = p_claim_number);
$$;

create or replace function public.place_order(
  p_order_mode text,
  p_customer jsonb,
  p_items jsonb,
  p_claim_number text default null,
  p_note text default ''
) returns jsonb language plpgsql security definer set search_path = public, pg_temp as $$
declare
  settings public.restaurant_settings%rowtype;
  menu_row public.menu_items%rowtype;
  line jsonb;
  qty integer;
  snapshot jsonb := '[]'::jsonb;
  sub numeric(12,2) := 0;
  fee numeric(12,2) := 0;
  new_order public.orders%rowtype;
  customer jsonb;
begin
  select * into settings from public.restaurant_settings where id = 1;
  if not found or not settings.menu_verified or length(trim(settings.menu_source_url)) = 0 then
    raise exception 'The official menu has not been verified. Live ordering is paused.';
  end if;
  if not settings.logo_verified or length(trim(settings.logo_url)) = 0 then
    raise exception 'The official business logo must be verified before live orders can be accepted.';
  end if;
  if p_order_mode is null or p_order_mode not in ('dine-in', 'take-out', 'delivery') then
    raise exception 'Choose Dine-In, Take-Out, or Delivery.';
  end if;
  if p_customer is null or jsonb_typeof(p_customer) <> 'object' then
    raise exception 'Customer details are required.';
  end if;
  if p_order_mode = 'dine-in' then
    if length(trim(coalesce(p_customer->>'fullName', ''))) < 2 then
      raise exception 'Your full name is required.';
    end if;
    if length(trim(coalesce(p_customer->>'tableNumber', ''))) = 0 then
      raise exception 'Your assigned table number is required.';
    end if;
  end if;
  if p_order_mode = 'take-out' then
    if p_claim_number is null or p_claim_number !~ '^[1-9][0-9]{0,5}$' then
      raise exception 'Choose a claim number from 1 to 999999, without leading zeros.';
    end if;
  else
    p_claim_number := null;
  end if;
  if p_order_mode = 'delivery' then
    if length(trim(coalesce(p_customer->>'street', ''))) = 0 or
       length(trim(coalesce(p_customer->>'barangay', ''))) = 0 or
       length(trim(coalesce(p_customer->>'city', ''))) = 0 then
      raise exception 'Street, barangay, and city are all required.';
    end if;
    if regexp_replace(coalesce(p_customer->>'contactNumber', ''), '[\s()-]', '', 'g') !~ '^(09|\+639)[0-9]{9}$' then
      raise exception 'Enter a valid Philippine mobile number, starting with 09 or +639.';
    end if;
    fee := settings.delivery_fee;
  end if;
  if length(coalesce(p_note, '')) > 500 or length(p_customer::text) > 4000 then
    raise exception 'Your details or note are too long.';
  end if;
  if p_items is null or jsonb_typeof(p_items) <> 'array' then
    raise exception 'Add at least one menu item.';
  end if;
  if jsonb_array_length(p_items) < 1 or jsonb_array_length(p_items) > 50 then
    raise exception 'An order must contain between 1 and 50 different items.';
  end if;
  if (select count(*) <> count(distinct e->>'id') from jsonb_array_elements(p_items) e) then
    raise exception 'Duplicate menu items are not allowed.';
  end if;
  for line in select * from jsonb_array_elements(p_items) loop
    if coalesce(line->>'quantity', '') !~ '^[1-9][0-9]?$' then
      raise exception 'Item quantities must be between 1 and 99.';
    end if;
    qty := (line->>'quantity')::integer;
    select * into menu_row from public.menu_items where id = (line->>'id')::uuid and is_available for share;
    if not found then raise exception 'An item is no longer available. Please refresh the menu.'; end if;
    sub := sub + menu_row.price * qty;
    snapshot := snapshot || jsonb_build_array(jsonb_build_object(
      'id', menu_row.id, 'name', menu_row.name, 'quantity', qty,
      'unit_price', menu_row.price, 'line_total', menu_row.price * qty
    ));
  end loop;
  customer := jsonb_build_object(
    'fullName', trim(coalesce(p_customer->>'fullName', '')),
    'tableNumber', case when p_order_mode = 'dine-in' then trim(p_customer->>'tableNumber') else '' end,
    'claimNumber', coalesce(p_claim_number, ''),
    'street', case when p_order_mode = 'delivery' then trim(p_customer->>'street') else '' end,
    'barangay', case when p_order_mode = 'delivery' then trim(p_customer->>'barangay') else '' end,
    'city', case when p_order_mode = 'delivery' then trim(p_customer->>'city') else '' end,
    'contactNumber', case when p_order_mode = 'delivery' then regexp_replace(p_customer->>'contactNumber', '[\s()-]', '', 'g') else '' end
  );
  if p_order_mode = 'take-out' then
    insert into public.claim_numbers(claim_number) values (p_claim_number);
  end if;
  insert into public.orders(order_mode, customer_details, items, subtotal, delivery_fee, total, claim_number, note)
  values(p_order_mode, customer, snapshot, sub, fee, sub + fee, p_claim_number, trim(coalesce(p_note, '')))
  returning * into new_order;
  return jsonb_build_object(
    'order_id', new_order.id, 'receipt_token', new_order.receipt_token,
    'status', new_order.status, 'created_at', new_order.created_at,
    'subtotal', sub, 'delivery_fee', fee, 'total', sub + fee, 'items', snapshot
  );
exception when unique_violation then
  raise exception using errcode = '23505', message = 'This claim number is already reserved. Please choose another.';
end;
$$;

create or replace function public.get_order_status(p_order_id uuid, p_receipt_token uuid)
returns jsonb language plpgsql stable security definer set search_path = public, pg_temp as $$
declare result jsonb;
begin
  select jsonb_build_object('status', status, 'total', total, 'created_at', created_at)
  into result from public.orders where id = p_order_id and receipt_token = p_receipt_token;
  if result is null then raise exception 'Order receipt not found.'; end if;
  return result;
end;
$$;

revoke all on function public.is_claim_available(text) from public;
revoke all on function public.place_order(text, jsonb, jsonb, text, text) from public;
revoke all on function public.get_order_status(uuid, uuid) from public;
grant execute on function public.is_claim_available(text) to anon, authenticated;
grant execute on function public.place_order(text, jsonb, jsonb, text, text) to anon, authenticated;
grant execute on function public.get_order_status(uuid, uuid) to anon, authenticated;

-- Confirm orders in the Supabase table editor by changing status from pending to confirmed.
-- Private order data is never published to anonymous realtime subscribers.
do $$ begin
  if exists (select 1 from pg_publication where pubname = 'supabase_realtime')
    and not exists (select 1 from pg_publication_tables where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'claim_numbers') then
    alter publication supabase_realtime add table public.claim_numbers;
  end if;
end $$;
