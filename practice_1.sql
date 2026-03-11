CREATE TABLE customers(
cust_id SERIAL PRIMARY KEY,
cust_name VARCHAR(50) NOT NULL
);


CREATE TABLE orders(
ord_id SERIAL PRIMARY KEY,
ord_date DATE NOT NULL,
price NUMERIC NOT NULL,
cust_id INTEGER NOT NULL,
FOREIGN KEY (cust_id) REFERENCES
customers (cust_id)
);


INSERT INTO customers (cust_name)
VALUES
('Ubaid'),
('Adeel'),
('Raheel'),
('Awais');


INSERT INTO orders (ord_date,cust_id,price)
VALUES
('2026-01-12',1,40000),
('2026-01-13',1,50000),
('2026-01-14',2,60000),
('2026-01-15',3,70000),
('2026-01-16',2,80000);


SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM customers CROSS JOIN orders;


SELECT * FROM customers c
INNER JOIN
orders o
ON c.cust_id = o.cust_id;


SELECT c.cust_name, COUNT(o.ord_id) FROM customers c
INNER JOIN 
orders o
ON c.cust_id = o.cust_id
GROUP BY cust_name;



SELECT c.cust_name, SUM(o.price) 
FROM customers c
INNER JOIN 
orders o
ON c.cust_id=o.cust_id
GROUP BY cust_name;



SELECT * FROM customers c
LEFT JOIN 
orders o
ON c.cust_id = o.cust_id;



SELECT * FROM orders o
RIGHT JOIN
customers c
ON o.cust_id = c.cust_id;