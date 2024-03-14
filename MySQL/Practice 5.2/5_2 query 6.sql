-- 6.	Write a SQL query to retrieve the names of all employees who have sold at least one product to customers 
--     who have placed orders for products in the "Electronics" category,
--     but have never placed an order for products in the "Clothing" category. 
--     The output should only include employees who have made at least one such sale.

USE queries5_2;
SELECT *
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN EmployeeSales es ON oi.OrderItemID = es.OrderItemID
JOIN Employees e ON es.EmployeeID = e.EmployeeID
WHERE 
	p.Category='Electronics' AND
	c.CustomerID 
	  NOT IN (
			SELECT DISTINCT c1.CustomerID
			FROM Customers c1
			JOIN Orders o1 ON c1.CustomerID = o1.CustomerID
			JOIN OrderItems oi1 ON o1.OrderID = oi1.OrderID
			JOIN Products p1 ON oi1.ProductID = p1.ProductID
			WHERE p1.Category= 'Clothing')
GROUP BY e.Name;

-- SELECT DISTINCT e.Name
-- FROM Employees e
-- JOIN EmployeeSales es ON e.EmployeeID = es.EmployeeID
-- JOIN OrderItems oi ON es.OrderItemID = oi.OrderItemID
-- JOIN Orders o ON oi.OrderID = o.OrderID
-- JOIN Customers c ON o.CustomerID = c.CustomerID
-- JOIN Products p ON oi.ProductID = p.ProductID
-- WHERE p.Category = 'Electronics'
-- AND c.CustomerID NOT IN (
--     SELECT DISTINCT c.CustomerID
--     FROM Customers c
--     JOIN Orders o ON c.CustomerID = o.CustomerID
--     JOIN OrderItems oi ON o.OrderID = oi.OrderID
--     JOIN Products p ON oi.ProductID = p.ProductID
--     WHERE p.Category = 'Clothing'
-- );

