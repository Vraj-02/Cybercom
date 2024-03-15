
-- 4.	Write a SQL query to retrieve the names of all customers who have made orders 
-- in the "orders" table and have returned more items than they havew ordered.

USE queries5_4; 

SELECT  c.name
       ,COUNT(r.return_id) AS TotalReturns
       ,COUNT(o.order_id) AS TotalOrders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN returns r ON o.order_id = r.order_id
GROUP BY c.customer_id
HAVING COUNT(r.return_id)>COUNT(o.order_id);
