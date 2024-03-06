-- CASE 4-------------------------------
-- Consider a table called "orders" with the following columns: "id", "customer_id", "order_date", "total_amount". 
-- Write a SQL query to calculate the total amount of orders for each customer, sorted in descending order by total amount.

USE queries3_2;

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);


INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 101, '2022-01-15', 120.00),
(2, 102, '2022-02-20', 75.50),
(3, 103, '2022-03-05', 150.75),
(4, 101, '2022-04-10', 50.99),
(5, 104, '2022-05-15', 85.00),
(6, 102, '2022-06-20', 110.25),
(7, 101, '2022-07-05', 95.50),
(8, 103, '2022-08-10', 200.00);


SELECT customer_id, SUM(total_amount) AS total_order_amount
FROM orders
GROUP BY customer_id
ORDER BY total_order_amount DESC;
