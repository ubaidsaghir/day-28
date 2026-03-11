CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);


CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(50),
price INT
);


CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (customer_name, city) VALUES
('Ali','Karachi'),
('Sara','Lahore'),
('Ahmed','Islamabad'),
('John','Multan');


INSERT INTO products (product_name, price) VALUES
('Laptop',1500),
('Phone',800),
('Tablet',600),
('Headphones',200);



INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
(1,1,1,'2025-01-10'),
(1,2,2,'2025-02-11'),
(2,3,1,'2025-02-20'),
(3,2,3,'2025-03-05'),
(1,4,2,'2025-03-06');


-- Task 1
-- Show customer name, product name, quantity
-- Solution

SELECT c.customer_name,p.product_name,o.quantity
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id;


-- Task 2
-- Show total orders by each customer


SELECT c.customer_name, COUNT(o.quantity) AS total_orders
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_name;


-- Task 3
-- Show total amount spent by each customer


SELECT c.customer_name, SUM (p.price * o.quantity) AS total_spqnt
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY c.customer_name;


-- Task 4
-- Find the most expensive product ordered


SELECT p.product_name, p.price
FROM products p
JOIN orders o
ON p.product_id = o.product_id
ORDER BY p.price DESC
LIMIT 1;

-- Task 5
-- Show customers who never placed an order


SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE order_id IS NULL;



