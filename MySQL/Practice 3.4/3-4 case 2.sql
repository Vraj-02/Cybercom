-- Case 2
-- Consider you’ve one employee database system. Create table schema and add data according to the following queries.

USE queries3_4;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    title VARCHAR(100),
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employees VALUES
    (1, 'Vraj', 'Patel', 'Manager', 'IT', 70000.00, '2021-01-15'),
    (2, 'Ved', 'Patel', 'Developer', 'IT', 60000.00, '1999-02-20'),
    (3, 'Aastha', 'Patel', 'Manager', 'Finance', 75000.00, '2021-03-05'),
    (4, 'Jenil', 'Prajapati', 'Analyst', 'Finance', 55000.00, '2021-04-10'),
    (5, 'Prachi', 'Desai', 'Manager', 'Sales', 80000.00, '2023-05-15'),
    (6, 'Helly', 'Patel', 'Representative', 'Sales', 50000.00, '2021-06-20'),
    (7, 'Sarthak', 'Mistry', 'Manager', 'HR', 72000.00, '2021-07-05'),
    (8, 'Anil', 'Sadhu', 'Coordinator', 'HR', 48000.00, '2021-08-10'),
    (9, 'Gurpreet', 'Singh', 'Developer', 'IT', 65000.00, '2000-09-15'),
    (10, 'Mahendra', 'Dhoni', 'Analyst', 'Finance', 58000.00, '2021-10-20');

-- QUESTION 1. First and last name of employees with a title containing "Manager"
SELECT first_name, last_name
FROM employees
WHERE title LIKE '%Manager%';

-- QUESTION 2. Department name and average salary of employees in each department
SELECT department_name, AVG(salary) AS average_salary
FROM employees
GROUP BY department_name;

-- QUESTION 3. Number of employees hired in each year, sorted by year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS num_employees
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- QUESTION 4. First name, last name, and salary of the top 10 highest-paid employees
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 10;

-- QUESTION 5. Update salary of employees in "Sales" department to be 10% higher
UPDATE employees
SET salary = salary * 1.10
WHERE department_name = 'Sales';

-- QUESTION 6. Delete employees hired before the year 2000
DELETE FROM employees
WHERE YEAR(hire_date) < 2000;

-- QUESTION 7. Create a new table "employee_stats" with department stats
CREATE TABLE employee_stats AS
SELECT department_name, COUNT(*) AS total_employees, AVG(salary) AS average_salary
FROM employees
GROUP BY department_name;

SELECT * FROM employee_stats;

-- QUESTION 8. First and last name of employees with the same last name as their manager
SELECT DISTINCT e1.first_name, e1.last_name
FROM employees e1
JOIN employees e2 ON e1.last_name = e2.last_name 
				  AND e1.employee_id != e2.employee_id 
                  AND e1.title != 'Manager' 
                  AND e2.title ='Manager';

-- QUESTION 9. Top 5 departments with the highest average salary
SELECT department_name, AVG(salary) AS average_salary
FROM employees
GROUP BY department_name
ORDER BY average_salary DESC
LIMIT 5;


