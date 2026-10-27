-- Business-verified Wahana menu import. Review before running.
-- Official source: https://www.facebook.com/wahanacabin
begin;
update public.menu_items set is_available = false;
insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Milky Way', 'Chocolate stout 5.5%', 150.00, 'Cans', '', ARRAY[]::text[], true, 0)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Chocolate Waffle', '', 140.00, 'Dessert', '', ARRAY[]::text[], true, 1)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Creamy Tuna Pesto', '', 180.00, 'Pasta', '', ARRAY[]::text[], true, 2)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Mushroom Truffle', '', 180.00, 'Pasta', '', ARRAY[]::text[], true, 3)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Shanghai', '', 130.00, 'Rice Meal', '', ARRAY[]::text[], true, 4)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Bacsilog', '', 160.00, 'Rice Meal', '', ARRAY[]::text[], true, 5)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Garlic Longganisa', '', 130.00, 'Rice Meal', '', ARRAY[]::text[], true, 6)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Bistek Tagalog', '', 120.00, 'Rice Meal', '', ARRAY[]::text[], true, 7)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Cheesy Bacon Fries', '', 140.00, 'Snacks', '', ARRAY[]::text[], true, 8)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Wahana Burger', '', 210.00, 'Snacks', '', ARRAY[]::text[], true, 9)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Nachos', '', 200.00, 'Snacks', '', ARRAY[]::text[], true, 10)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Mojos', '', 160.00, 'Snacks', '', ARRAY[]::text[], true, 11)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Lumpiang Shanghai', '', 160.00, 'Snacks', '', ARRAY[]::text[], true, 12)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Cheese Stick', '', 110.00, 'Snacks', '', ARRAY[]::text[], true, 13)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Espresso Shot', '', 30.00, 'Add Ons', '', ARRAY[]::text[], true, 14)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Whipped Cream', '', 30.00, 'Add Ons', '', ARRAY[]::text[], true, 15)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Oat Milk', '', 40.00, 'Add Ons', '', ARRAY[]::text[], true, 16)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Aurora Sunrise', 'Hazy pale ale 5.5%', 130.00, 'Local Aurora Craft Beer', '', ARRAY[]::text[], true, 17)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Wahana Blonde', 'Blonde ale 5.0%', 100.00, 'Local Aurora Craft Beer', '', ARRAY[]::text[], true, 18)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Milky Way', 'Chocolate stout 5.5%', 150.00, 'Local Aurora Craft Beer', '', ARRAY[]::text[], true, 19)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Jambeeree 18 IPA', 'American IPA 6.7%', 180.00, 'Local Aurora Craft Beer', '', ARRAY[]::text[], true, 20)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Roses Are Red', 'Hibiscus raspberry sour 5.5%', 130.00, 'Local Aurora Craft Beer', '', ARRAY[]::text[], true, 21)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Pizza Margherita', '', 250.00, 'Pizza', '', ARRAY[]::text[], true, 22)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Olive & Bacon', '', 280.00, 'Pizza', '', ARRAY[]::text[], true, 23)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Honey Salami', '', 300.00, 'Pizza', '', ARRAY[]::text[], true, 24)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Honey, Truffle, & Cheese', '', 300.00, 'Pizza', '', ARRAY[]::text[], true, 25)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Four Cheese', '', 300.00, 'Pizza', '', ARRAY[]::text[], true, 26)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Pepperoni', '', 300.00, 'Pizza', '', ARRAY[]::text[], true, 27)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), '2 Beers', '', 200.00, 'Hoppy Hour', '', ARRAY[]::text[], true, 28)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Americano', 'One espresso, water', 100.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 29)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Latte', 'One espresso, milk', 130.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 30)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Spanish Latte', 'One espresso, milk, condensed milk', 150.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 31)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Caramel Macchiato', 'One espresso, milk, vanilla syrup, caramel drizzle', 150.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 32)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Hazelnut Mocha', 'One espresso, milk, hazelnut syrup, chocolate drizzle', 150.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 33)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Matcha Espresso Fusion', 'One espresso, milk, pure matcha', 150.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 34)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Salted Caramel', 'One espresso, milk, salted caramel sauce', 150.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 35)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'White Chocolate', 'One espresso, milk, white chocolate sauce', 150.00, 'Espresso Drinks (Hot/Iced)', '', ARRAY[]::text[], true, 36)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Signature Chocolate', 'Dark chocolate sauce, milk', 150.00, 'Non-Coffee (Hot/Iced)', '', ARRAY[]::text[], true, 37)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Matcha Latte', 'Ceremonial matcha, milk', 150.00, 'Non-Coffee (Hot/Iced)', '', ARRAY[]::text[], true, 38)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Strawberry Milk', 'Strawberry purée, milk', 160.00, 'Non-Coffee (Hot/Iced)', '', ARRAY[]::text[], true, 39)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Lychee', '', 99.00, 'Suda', '', ARRAY[]::text[], true, 40)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Mango', '', 99.00, 'Suda', '', ARRAY[]::text[], true, 41)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Green Apple Mango', '', 99.00, 'Suda', '', ARRAY[]::text[], true, 42)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Chocolate Chip Waffle', 'Two slices waffle with chocolate chip, whipped cream, chocolate drizzle', 130.00, 'Pancake And Waffle', '', ARRAY[]::text[], true, 43)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Maple And Butter', 'Two pieces pancake, butter, syrup', 80.00, 'Pancake And Waffle', '', ARRAY[]::text[], true, 44)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Maple & Butter', 'Two-piece pancake, maple syrup, butter', 120.00, 'Pancake', '', ARRAY[]::text[], true, 45)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Chocolate Chip', 'Two-piece pancake with chocolate chip, whipped cream, maple syrup', 110.00, 'Pancake', '', ARRAY[]::text[], true, 46)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Classic Savory', 'Two-piece pancake, scrambled egg, chicken franks, bacon', 110.00, 'Pancake', '', ARRAY[]::text[], true, 47)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Signature Chocolate', 'Dark chocolate sauce, full cream milk', 140.00, 'Milk-Based', '', ARRAY[]::text[], true, 48)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Matcha Latte', 'Ceremonial matcha, culinary matcha, full cream milk', 140.00, 'Milk-Based', '', ARRAY[]::text[], true, 49)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Strawberry Milk', 'Strawberry puree, full cream milk', 160.00, 'Milk-Based', '', ARRAY[]::text[], true, 50)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Drip', 'Medium roast coffee, just black', 90.00, 'Brewed Coffee (Served Hot)', '', ARRAY[]::text[], true, 51)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Sweet Misto', 'Half drip coffee, half steamed milk, syrup', 110.00, 'Brewed Coffee (Served Hot)', '', ARRAY[]::text[], true, 52)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Signature Chocolate', 'Dark chocolate sauce, cocoa powder, milk', 150.00, 'Non-Caffeine (Hot/Iced)', '', ARRAY[]::text[], true, 53)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Matcha Latte', 'Ceremonial matcha, syrup, milk', 140.00, 'Non-Caffeine (Hot/Iced)', '', ARRAY[]::text[], true, 54)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Strawberry Milk', 'Strawberry puree, strawberry jam, milk', 140.00, 'Non-Caffeine (Hot/Iced)', '', ARRAY[]::text[], true, 55)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Roasted Peanuts', '', 90.00, 'Food (New!)', '', ARRAY[]::text[], true, 56)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Nachos', '', 110.00, 'Food (New!)', '', ARRAY[]::text[], true, 57)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Wahana Burger', 'With fries', 200.00, 'Food (New!)', '', ARRAY[]::text[], true, 58)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Dirty Fries', '', 110.00, 'Food (New!)', '', ARRAY[]::text[], true, 59)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

insert into public.menu_items (id, name, description, price, category, image_url, tags, is_available, sort_order)
values (gen_random_uuid(), 'Hello Blondie!', 'Blonde ale 5.5%', 140.00, 'Others', '', ARRAY[]::text[], true, 60)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, tags=excluded.tags, is_available=true, sort_order=excluded.sort_order;

update public.restaurant_settings set logo_url='https://kommodo.ai/i/7rsbDpkHU41qmk3kUivN', logo_verified=true, menu_source_url='https://www.facebook.com/wahanacabin', menu_verified=true, delivery_fee=0.00 where id=1;
commit;
