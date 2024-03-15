-- 10.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
-- and have ordered products in at least two different categories.

USE queries5_4;

SELECT  c.name
-- 	    ,COUNT( DISTINCT ca.category_id) AS `Distinct Categories` 
-- 	    ,GROUP_CONCAT(ca.name SEPARATOR'|') AS CategoriesOrdered
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN categories ca ON o.category_id = ca.category_id
GROUP BY c.customer_id
HAVING COUNT( DISTINCT ca.category_id) >=2 ;