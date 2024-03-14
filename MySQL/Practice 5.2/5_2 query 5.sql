-- 5.	Write a SQL query to retrieve the names of all customers who have placed orders for products 
--     in the "Electronics" category, but have never placed an order for products in the "Clothing" category.

USE queries5_2;

SELECT c.Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE p.Category='Electronics' AND
c.CustomerID 
  NOT IN (
		SELECT DISTINCT c1.CustomerID
		FROM Customers c1
		JOIN Orders o1 ON c1.CustomerID = o1.CustomerID
		JOIN OrderItems oi1 ON o1.OrderID = oi1.OrderID
		JOIN Products p1 ON oi1.ProductID = p1.ProductID
		WHERE p1.Category= 'Clothing')
GROUP BY c.CustomerID;

-- SELECT DISTINCT c.CustomerID
-- FROM Customers c
-- JOIN Orders o ON c.CustomerID = o.CustomerID
-- JOIN OrderItems oi ON o.OrderID = oi.OrderID
-- JOIN Products p ON oi.ProductID = p.ProductID
-- WHERE p.Category= 'Clothing';

