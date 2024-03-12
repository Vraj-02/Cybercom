-- CASE 1---------------
-- Assume you are working with a company that has a database containing information about employees and their departments. 
-- The database has three tables:

CREATE DATABASE queries4_2;

USE queries4_2;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);

CREATE TABLE Salaries (
    EmployeeID INT,
    Salary DECIMAL(10, 2) NOT NULL,
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'Human Resources');


INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES
(1, 'Rahul Sharma', 1, 60000.00),
(2, 'Priya Singh', 1, 55000.00),
(3, 'Amit Patel', 2, 70000.00),
(4, 'Sneha Gupta', 3, 65000.00),
(5, 'Anuj Verma', 2, 80000.00),
(6, 'Neha Kapoor', 3, 75000.00),
(7, 'Vikram Mehta', 4, 60000.00),
(8, 'Riya Shah', 1, 72000.00);


INSERT INTO Salaries (EmployeeID, Salary, Date) VALUES
(1, 60000.00, '2024-03-10'),
(2, 55000.00, '2024-03-10'),
(3, 70000.00, '2024-03-10'),
(4, 65000.00, '2024-03-10'),
(5, 80000.00, '2024-03-10'),
(6, 75000.00, '2024-03-10'),
(7, 60000.00, '2024-03-10'),
(8, 72000.00, '2024-03-10');

-- 1.	Write a query to return the names of all employees who work in the 'Sales' department.
SELECT Name
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Sales');

-- 2.	Write a query to return the total number of employees in each department, ordered by department name.
SELECT DepartmentName, COUNT(EmployeeID) AS TotalEmployees
FROM Departments
LEFT JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY DepartmentName
ORDER BY DepartmentName;

-- 3.	Write a query to return the average salary for each department, ordered by department name.
SELECT DepartmentName, AVG(Salary) AS AverageSalary
FROM Departments
LEFT JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY DepartmentName
ORDER BY DepartmentName;

-- 4.	Write a query to return the top 10% of highest paid employees, ordered by salary.
-- SET @threshold = CEIL(0.10 * (SELECT COUNT(*) FROM Employees));
-- SELECT Name, Salary
-- FROM Employees
-- ORDER BY Salary DESC
-- LIMIT @threshold
-- LIMIT (SELECT CEIL(0.10 * COUNT(*)) FROM Employees)
-- ;

SELECT Name, Salary
FROM (
    SELECT Name, Salary, 
           ROW_NUMBER() OVER (ORDER BY Salary DESC) AS row_num,
           COUNT(*) OVER () AS total_rows
    FROM Employees
) AS ranked_employees
WHERE row_num <= CEIL(0.1 * total_rows)
ORDER BY Salary DESC;


-- 5.	Write a query to return the salary of each employee for their latest salary entry.
SELECT e.Name, s.Salary
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.Date = (SELECT MAX(Date) FROM Salaries WHERE EmployeeID = e.EmployeeID);













