
-- 7.	Write a SQL query to retrieve the names of all customers who have placed orders 
-- for more than five different products in the "Electronics" category.

USE queries5_2;
SELECT *,COUNT(DISTINCT oi.ProductID) AS Different_products
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE p.Category = 'Electronics'
GROUP BY c.CustomerID
HAVING COUNT(DISTINCT oi.ProductID) > 1;
-- HAVING COUNT(DISTINCT oi.ProductID) > 5;
