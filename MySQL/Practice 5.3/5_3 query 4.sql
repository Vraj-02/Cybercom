-- 4.	Write a SQL query to retrieve the names and total revenue generated by all customers 
-- in the "orders" table, sorted by revenue in descending order, where the total revenue is 
-- greater than the average revenue generated by all customers.
USE queries5_3;

SELECT c.Name, SUM(o.Revenue) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name
HAVING TotalRevenue > (SELECT AVG(TotalRevenue) 
					   FROM (
                           SELECT SUM(Revenue) AS TotalRevenue FROM Orders GROUP BY CustomerID) 
					   AS Temp)
ORDER BY TotalRevenue DESC;
