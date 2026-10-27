-- ==========================================
-- WAHANA CAFE BALER - SUPABASE DATABASE SETUP
-- ==========================================
-- Run this script in your Supabase SQL Editor:
-- 1. Go to your Supabase Dashboard
-- 2. Click on "SQL Editor" in the left sidebar
-- 3. Click "New Query"
-- 4. Paste this complete script and click "Run"

-- 1. CREATE ORDERS TABLE
CREATE TABLE IF NOT EXISTS public.wahana_orders (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL UNIQUE,
    order_mode VARCHAR(20) NOT NULL CHECK (order_mode IN ('dine-in', 'take-out', 'delivery')),
    customer_details JSONB NOT NULL,
    items JSONB NOT NULL,
    total_price NUMERIC(10, 2) NOT NULL,
    claim_number INT NULL,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'preparing', 'ready', 'completed', 'cancelled')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. CREATE KITCHEN DISPLAY / STAFF ORDERS TABLE
CREATE TABLE IF NOT EXISTS public.wahana_kitchen_display (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    order_ref_id UUID REFERENCES public.wahana_orders(id) ON DELETE CASCADE,
    order_id VARCHAR(20) NOT NULL,
    order_mode VARCHAR(20) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    table_or_claim VARCHAR(100) NULL,
    items_summary TEXT NOT NULL,
    total_items_count INT NOT NULL DEFAULT 1,
    status VARCHAR(20) DEFAULT 'pending',
    placed_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. AUTOMATIC TRIGGER FUNCTION TO POPULATE KITCHEN DISPLAY ON NEW ORDER
CREATE OR REPLACE FUNCTION public.handle_new_wahana_order()
RETURNS TRIGGER AS $$
DECLARE
    item_elem JSONB;
    summary_text TEXT := '';
    total_qty INT := 0;
    cust_name TEXT := 'Guest';
    loc_info TEXT := 'N/A';
BEGIN
    -- Extract customer name & table/claim details from JSONB
    IF NEW.customer_details ? 'name' THEN
        cust_name := NEW.customer_details->>'name';
    END IF;

    IF NEW.order_mode = 'dine-in' AND NEW.customer_details ? 'table_number' THEN
        loc_info := 'Table ' || (NEW.customer_details->>'table_number');
    ELSIF NEW.order_mode = 'take-out' AND NEW.claim_number IS NOT NULL THEN
        loc_info := 'Claim #' || NEW.claim_number::TEXT;
    ELSIF NEW.order_mode = 'delivery' AND NEW.customer_details ? 'address' THEN
        loc_info := NEW.customer_details->>'address';
    END IF;

    -- Format summary text for kitchen/staff display
    FOR item_elem IN SELECT * FROM jsonb_array_elements(NEW.items)
    LOOP
        summary_text := summary_text || (item_elem->>'qty') || 'x ' || (item_elem->>'name') || E'\n';
        total_qty := total_qty + (item_elem->>'qty')::INT;
    END LOOP;

    -- Insert into Kitchen Display table
    INSERT INTO public.wahana_kitchen_display (
        order_ref_id,
        order_id,
        order_mode,
        customer_name,
        table_or_claim,
        items_summary,
        total_items_count,
        status,
        placed_at
    ) VALUES (
        NEW.id,
        NEW.order_id,
        NEW.order_mode,
        cust_name,
        loc_info,
        TRIM(summary_text),
        total_qty,
        NEW.status,
        NEW.created_at
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create Trigger on INSERT
DROP TRIGGER IF EXISTS trg_auto_kitchen_display ON public.wahana_orders;
CREATE TRIGGER trg_auto_kitchen_display
    AFTER INSERT ON public.wahana_orders
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_new_wahana_order();

-- 4. CREATE INDEXES FOR FAST QUERYING
CREATE INDEX IF NOT EXISTS idx_wahana_orders_created_at ON public.wahana_orders(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_wahana_orders_claim_number ON public.wahana_orders(claim_number);
CREATE INDEX IF NOT EXISTS idx_wahana_orders_status ON public.wahana_orders(status);
CREATE INDEX IF NOT EXISTS idx_wahana_kitchen_display_placed ON public.wahana_kitchen_display(placed_at DESC);

-- 5. ENABLE ROW LEVEL SECURITY (RLS)
ALTER TABLE public.wahana_orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.wahana_kitchen_display ENABLE ROW LEVEL SECURITY;

-- 6. RLS POLICIES FOR PUBLIC & KITCHEN ACCESS
CREATE POLICY "Enable insert access for all users" 
ON public.wahana_orders 
FOR INSERT 
TO public 
WITH CHECK (true);

CREATE POLICY "Enable read access for all users" 
ON public.wahana_orders 
FOR SELECT 
TO public 
USING (true);

CREATE POLICY "Enable select on kitchen display for all users" 
ON public.wahana_kitchen_display 
FOR SELECT 
TO public 
USING (true);

-- 7. ENABLE REALTIME SUBSCRIPTIONS FOR BOTH TABLES
ALTER PUBLICATION supabase_realtime ADD TABLE public.wahana_orders;
ALTER PUBLICATION supabase_realtime ADD TABLE public.wahana_kitchen_display;

-- ==========================================
-- SETUP COMPLETE!
-- ==========================================