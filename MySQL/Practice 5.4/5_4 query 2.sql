-- 2.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
-- and have returned at least one item in the "returns" table.

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN returns r ON o.order_id = r.order_id;
