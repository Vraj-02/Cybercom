-- 6.	Write a SQL query to retrieve the names and salaries of all employees who have 
--      a salary greater than the minimum salary of their department in the "employees" table,
--      sorted by department ID and then by salary in descending order.
USE queries5_1;
CREATE TABLE departments_task6 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees_task6 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES departments_task6(department_id)
);

INSERT INTO departments_task6 (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Developer'),
(3, 'Finance');

INSERT INTO employees_task6 (employee_id, name, salary, department_id) VALUES
(101, 'Vraj', 75000.00, 1),
(102, 'Ved', 70000.00, 1),
(103, 'Aastha', 80000.00, 2),
(104, 'Anjli', 55000.00, 2),
(105, 'Ramesh', 62000.00, 3),
(106, 'Mahesh', 60000.00, 3),
(107, 'Shanaya', 90000.00, 1),
(108, 'Rohan', 50000.00, 3),
(109, 'Christopher Nolan ', 72000.00, 2);

SELECT e.employee_id, e.name, e.salary, d.department_name
FROM employees_task6 e
INNER JOIN departments_task6 d
ON d.department_id = e.department_id
WHERE 
	e.salary > (
		SELECT MIN(salary) 
        FROM employees_task6 
        WHERE department_id=d.department_id
	)
ORDER BY  e.department_id, e.salary DESC;