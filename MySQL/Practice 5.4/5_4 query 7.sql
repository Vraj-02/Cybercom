
-- 7.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
-- and have spent more than $100 in total on all orders, sorted by the total amount spent in descending order.

USE queries5_4; 
 
SELECT c.Name 
--        ,SUM(total_amount) AS Total
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
-- HAVING SUM(total_amount)>200
HAVING SUM(total_amount)>100
ORDER BY SUM(total_amount) DESC;
