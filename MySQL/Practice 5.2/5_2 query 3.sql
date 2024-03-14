
-- 3.	Write a SQL query to retrieve the names of all customers who have placed orders for products 
--      in both the "Electronics" and "Clothing" categories. 
--      The output should only include customers who have ordered products in both categories.


USE queries5_2;

SELECT 
	    c.Name
--      ,GROUP_CONCAT(p.Category SEPARATOR '|') AS Category
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE p.Category IN ('Electronics', 'Clothing')
GROUP BY c.CustomerID
HAVING COUNT(DISTINCT p.Category) = 2;
