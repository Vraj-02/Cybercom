
-- 8.	Write a SQL query to retrieve the names of all employees who have sold products to customers 
--     who have placed orders for more than five different products in the "Electronics" category.
--     The output should only include employees who have made at least one such sale.

USE queries5_2;

SELECT *
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN EmployeeSales es ON oi.OrderItemID = es.OrderItemID
JOIN Employees e ON es.EmployeeID = e.EmployeeID
WHERE p.Category = 'Electronics'
GROUP BY e.EmployeeID
HAVING COUNT(DISTINCT oi.ProductID) > 1;

-- SELECT e.Name
-- FROM Customers c
-- JOIN Orders o ON c.CustomerID = o.CustomerID
-- JOIN OrderItems oi ON o.OrderID = oi.OrderID
-- JOIN Products p ON oi.ProductID = p.ProductID
-- JOIN EmployeeSales es ON oi.OrderItemID = es.OrderItemID
-- JOIN Employees e ON es.EmployeeID = e.EmployeeID
-- WHERE p.Category = 'Electronics'
-- GROUP BY e.EmployeeID
-- HAVING COUNT(DISTINCT oi.ProductID) > 1
-- ;

-- SELECT *
-- FROM Employees e
-- JOIN EmployeeSales es ON e.EmployeeID = es.EmployeeID
-- JOIN OrderItems oi ON es.OrderItemID = oi.OrderItemID
-- JOIN Orders o ON oi.OrderID = o.OrderID
-- JOIN Customers c ON o.CustomerID = c.CustomerID
-- JOIN Products p ON oi.ProductID = p.ProductID
-- WHERE p.Category = 'Electronics'
-- GROUP BY e.EmployeeID
-- HAVING COUNT(DISTINCT oi.ProductID) > 1;




