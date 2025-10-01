/*SmartStore Automated Purchase System (Hard)
SmartShop is a modern retail company that sells electronic gadgets like smartphones, tablets, 
and laptops.The company wants to automate its ordering and inventory management process.
Whenever a customer places an order, the system must:
1. Verify stock availability for the requested product and quantity.
2. If sufficient stock is available:	- Log the order in the sales table with the ordered quantity and total price.
	- Update the inventory in the products table by reducing quantity_remaining and increasing quantity_sold.
	- Display a real-time confirmation message: "Product sold successfully!“
3. If there is insufficient stock, the system must:
	- Reject the transaction and display: Insufficient Quantity Available!"
*/
drop table if exists sales;
drop table if exists products;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL,
    quantity_remaining INT NOT NULL DEFAULT 0 CHECK (quantity_remaining >= 0),
    quantity_sold INT NOT NULL DEFAULT 0 CHECK (quantity_sold >= 0)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    order_quantity INT NOT NULL,
    total_price NUMERIC(10, 2) NOT NULL,
    sale_timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
);

INSERT INTO products (product_id, product_name, unit_price, quantity_remaining, quantity_sold) VALUES
(2001, 'Bluetooth Headset', 49.99, 100, 20),
(2002, 'Gaming Mouse', 25.00, 30, 5),
(2003, 'External HDD 1TB', 60.00, 15, 3);


CREATE OR REPLACE FUNCTION process_sale(
    p_product_id INT,
    p_order_quantity INT
)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    v_unit_price NUMERIC(10, 2);
    v_total_price NUMERIC(10, 2);
    v_stock_available INT;
BEGIN
    SELECT unit_price, quantity_remaining INTO v_unit_price, v_stock_available
    FROM products
    WHERE product_id = p_product_id
    FOR UPDATE;

    IF NOT FOUND THEN
        RETURN 'Error: Product ID not found!';
    END IF;

    IF v_stock_available < p_order_quantity THEN
        RAISE EXCEPTION 'Insufficient Quantity Available! Requested: %; Available: %', p_order_quantity, v_stock_available;
    ELSE
        v_total_price := v_unit_price * p_order_quantity;

        INSERT INTO sales (product_id, order_quantity, total_price)
        VALUES (p_product_id, p_order_quantity, v_total_price);

        UPDATE products
        SET
            quantity_remaining = quantity_remaining - p_order_quantity,
            quantity_sold = quantity_sold + p_order_quantity
        WHERE
            product_id = p_product_id;

        RETURN 'Product sold successfully!';
    END IF;
END;
$$;

SELECT process_sale(2001, 10) AS Transaction_Result;

SELECT process_sale(2003, 20) AS Transaction_Result;

SELECT product_id, quantity_remaining, quantity_sold FROM products WHERE product_id IN (2001, 2003);