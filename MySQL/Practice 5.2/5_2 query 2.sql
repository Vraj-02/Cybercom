
-- 2.	Write a SQL query to retrieve the names of all employees who have sold at least one product in the
--    "Clothing" category, along with the total revenue they have generated from those sales.
--    The output should be sorted by total revenue generated in descending order.

USE queries5_2;

SELECT e.name,SUM(oi.Quantity * oi.Price) AS total_revenue
FROM Employees e
JOIN EmployeeSales es ON e.EmployeeID = es.EmployeeID
JOIN OrderItems oi ON es.OrderItemID = oi.OrderItemID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE p.Category = 'Clothing'
GROUP BY e.EmployeeID
ORDER BY total_revenue DESC;

