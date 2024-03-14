-- 7.	Write a SQL query to retrieve the names of all employees who have made sales greater than 
-- the average sales of all employees in the "orders" table, sorted by sales in descending order.

USE queries5_3;

SELECT e.EmployeeID, e.Name ,SUM(o.Revenue) as Total_revenue
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID
HAVING Total_revenue > (SELECT AVG(TotalRevenue) 
					   FROM (
                           SELECT SUM(Revenue) AS TotalRevenue FROM Orders GROUP BY EmployeeID ) 
					   AS Temp)
ORDER BY Total_revenue;


