
-- 1.	Write a SQL query to retrieve the names of all customers who have made 
-- at least one order in the "orders" table and have not made any orders in the "returns" table.

USE queries5_4;

SELECT DISTINCT c.name
FROM customers c
WHERE 
      c.customer_id NOT IN (
      SELECT DISTINCT c.customer_id
	  FROM customers c
	  JOIN orders o ON c.customer_id = o.customer_id
	  JOIN `returns` r ON o.order_id = r.order_id
      )
;

-- SELECT DISTINCT c.customer_id
-- FROM customers c
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN `returns` r ON o.order_id = r.order_id


