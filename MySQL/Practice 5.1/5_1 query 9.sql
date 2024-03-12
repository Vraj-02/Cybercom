-- 9.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table,
-- along with the total amount they have spent on all orders and the average amount they have spent per order.

USE queries5_1;

SELECT * FROM customers_task8;
SELECT * FROM products_task8;
SELECT * FROM orders_task8;
SELECT * FROM orders_details_task8;

SELECT 
	c.customer_id, 
    c.customer_name,
    SUM(od.quantity * p.product_price) AS total_amount_spent,
    AVG(od.quantity * p.product_price) AS average_amount_per_order
FROM customers_task8 c
INNER JOIN orders_task8 o ON o.customer_id = c.customer_id
INNER JOIN orders_details_task8 od ON od.order_id = o.order_id
INNER JOIN products_task8 p ON p.product_id = od.product_id
GROUP BY c.customer_id;


