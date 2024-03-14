 
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