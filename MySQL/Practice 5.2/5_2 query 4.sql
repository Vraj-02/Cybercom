
-- 4.	Write a SQL query to retrieve the names of all employees who have sold at least one product 
--     to a customer who has a shipping address in the same city as the employee.
--     The output should only include employees who have made at least one such sale.
USE queries5_2;

-- SELECT *
-- FROM Employees e
-- JOIN EmployeeSales es ON e.EmployeeID = es.EmployeeID
-- JOIN OrderItems oi ON es.OrderItemID = oi.OrderItemID
-- JOIN Orders o ON oi.OrderID = o.OrderID
-- JOIN Customers c ON o.CustomerID = c.CustomerID;

SELECT DISTINCT e.name
FROM Employees e
JOIN EmployeeSales es ON e.EmployeeID = es.EmployeeID
JOIN OrderItems oi ON es.OrderItemID = oi.OrderItemID
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE e.City = c.Shipping_city;




