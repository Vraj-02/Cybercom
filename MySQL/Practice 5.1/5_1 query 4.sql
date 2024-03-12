-- 4.	Write a SQL query to retrieve the names and salaries of all employees who have a 
-- salary greater than the average salary of all employees in the "employees" table, 
-- sorted by salary in descending order.

USE queries5_1;

CREATE TABLE employees (
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO employees (name, salary) VALUES
('Vraj', 50000.00),
('Ved', 40000.00),
('Aastha', 70000.00),
('Anjli', 55000.00),
('Ramesh', 65000.00);

SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;