-- 5.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, 
-- but have not made any orders in the last 90 days.
USE queries5_1;
CREATE TABLE customers_task5 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE orders_task5 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers_task5(customer_id)
);

INSERT INTO customers_task5 (customer_id, customer_name, email) VALUES
(1,'Vraj Patel', 'vraj@example.com'),
(2,'Ved Patel', 'ved@example.com'),
(3,'Aastha Patel', 'aastha@example.com'),
(4,'Anjli', 'anjli@example.com');



INSERT INTO orders_task5 (order_id, customer_id, order_date) VALUES
(101, 1, '2024-01-01'),
(102, 2, '2024-01-02'),
(103, 3, '2024-01-03'),
(104, 3, '2024-01-12'),
(105, 2, '2024-01-20'),
(106, 1, '2024-01-25'),
(107, 3, '2024-02-27'),
(108, 2, '2024-02-10'),
(109, 2, '2023-02-15'),
(110, 3, '2023-02-10'),
(111, 2, '2022-02-15'),
(112,2,'2024-03-11');
INSERT INTO orders_task5 (order_id, customer_id, order_date) VALUES
(113,4,'2022-01-15');


-- SELECT c.customer_name ,o.order_date
-- FROM customers_task5 c
-- INNER JOIN orders_task5 o ON c.customer_id = o.customer_id
-- WHERE o.order_date <= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
-- GROUP BY c.customer_id;


-- --------------------------------------------------

SELECT c.customer_name ,o.order_date
FROM customers_task5 c
INNER JOIN orders_task5 o ON c.customer_id = o.customer_id
WHERE c.customer_id NOT IN (
    SELECT c1.customer_id
	FROM customers_task5 c1
	INNER JOIN orders_task5 o1 
	ON c1.customer_id = o1.customer_id
	WHERE o1.order_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
	GROUP BY c1.customer_id)
GROUP BY c.customer_id;


