CREATE TABLE IF NOT EXISTS customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(150),
    billing_info VARCHAR(150)
);

-- Brand Table Creation
CREATE TABLE IF NOT EXISTS brand(
    seller_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(150),
    contact_number VARCHAR(15),
    address VARCHAR(150)
);

-- Inventory table creation
CREATE TABLE IF NOT EXISTS inventory(
    upc SERIAL PRIMARY KEY,
    product_amount INTEGER
);


-- Order Table Creation
CREATE TABLE IF NOT EXISTS orders(
    order_id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    sub_total NUMERIC(8,2),
    total_cost NUMERIC(10,2),
    upc INTEGER NOT NULL, -- This is known as a constraint. A constraint means that the data has to follow a specific rule. The rule here is that the column cannot be empty
    FOREIGN KEY(upc) REFERENCES inventory(upc) -- This is how can specify foreign keys and create the relationship!
);

-- Product Table Creation
CREATE TABLE IF NOT EXISTS product(
    item_id SERIAL PRIMARY KEY,
    amount NUMERIC(5,2),
    prod_name VARCHAR(100),
    seller_id INTEGER NOT NULL,
    upc INTEGER NOT NULL,
    FOREIGN KEY(seller_id) REFERENCES brand(seller_id),
    FOREIGN KEY(upc) REFERENCES inventory(upc)
);

-- Cart Table Creation
CREATE TABLE IF NOT EXISTS cart(
    cart_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(order_id) REFERENCES orders(order_id)
);