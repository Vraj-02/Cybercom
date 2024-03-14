CREATE DATABASE queries5_3;
USE queries5_3;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID, Name, Salary) VALUES
(1, 'Vraj', 60000),
(2, 'Ved', 55000),
(3, 'Aastha', 65000),
(4, 'Helly', 70000),
(5, 'Anjli', 75000);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Revenue DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, Revenue) VALUES
(1, 1, 8000),
(2, 2, 12000),
(3, 3, 10000),
(4, 1, 6000),
(5, 4, 15000),
(6, 5, 20000),
(7, 3, 9000),
(8, 2, 11000),
(9, 4, 13000),
(10, 5, 18000);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, Name, Country) VALUES
(1, 'Anita', 'USA'),
(2, 'Binal', 'India'),
(3, 'Ginny', 'USA'),
(4, 'Dimple', 'USA'),
(5, 'Ema', 'India');


-- QUERY -----------------------------------
-- 1.	Write a SQL query to retrieve the names and salaries of all employees who have a salary
--      greater than the average salary of all employees.

SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

