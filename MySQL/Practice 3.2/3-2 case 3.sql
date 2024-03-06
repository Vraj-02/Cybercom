-- CASE 3
-- Consider a table called "employees" with the following columns: "id", "name", "department", "salary". 
-- Write a SQL query to retrieve the names and salaries of all employees in the "sales" department who earn more than $50,000 per year.

USE queries3_2;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);


INSERT INTO employees (id, name, department, salary) VALUES
(1, 'Vraj', 'sales', 60000.00),
(2, 'Mitesh', 'marketing', 55000.00),
(3, 'Ved', 'marketing', 48000.00),
(4, 'Aastha', 'sales', 62000.00),
(5, 'Vasu' , 'sales' , 63000.00),
(6, 'Ravi', 'sales', 62000.00);


SELECT `name`, salary
FROM employees
WHERE department = 'sales' AND salary > 50000;
