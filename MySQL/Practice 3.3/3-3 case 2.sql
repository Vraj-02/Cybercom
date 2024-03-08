-- Case 2
-- Create a table called "employees" with the following columns:
--  "id" (integer, primary key), "name" (text), "age" (integer), and "salary" (integer).
USE queries3_3;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL
);

INSERT INTO employees (id, name, age, salary)
VALUES
    (1, 'John', 35, 60000),
    (2, 'Mary', 27, 50000),
    (3, 'Peter', 42, 75000),
    (4, 'Olivia', 29, 55000),
    (5, 'Michael', 38, 80000);

-- QUESTION 1.	Write a SQL query to select all employees from the "employees" table.     
SELECT * FROM employees;

-- QUESTION 2.	Write a SQL query to select the name and salary of all employees with a salary greater than 60000.
SELECT name,salary FROM employees
WHERE salary>60000;

-- QUESTION 3.	Write a SQL query to update Peter's age to 43.
UPDATE employees
SET age = 43
WHERE name = 'Peter';

-- QUESTION 4.	Write a SQL query to delete the employee with the id of 4.
DELETE FROM employees
WHERE id=4;

-- QUESTION 5.	Write a SQL query to calculate the average salary of all employees.
SELECT AVG(salary) AS average_salary
FROM employees;

-- QUESTION 6.	Write a SQL query to select the name and age of the oldest employee.
SELECT name,MAX(age) AS age FROM employees;

-- QUESTION 7.	Write a SQL query to select the name and age of the youngest employee.
SELECT name,MIN(age) AS age FROM employees;

-- QUESTION 8.	Write a SQL query to select the name of the employee with the highest salary.
SELECT name FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);









