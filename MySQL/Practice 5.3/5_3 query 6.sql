-- 6.	Write a SQL query to retrieve the names of all employees who have made sales greater than $50,000 in the "orders" table.

USE queries5_3;

SELECT e.EmployeeID,e.Name ,SUM(o.Revenue)
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID
HAVING SUM(o.Revenue)>50000;