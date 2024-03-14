-- 7.  Write a SQL query to retrieve the names and salaries of the five highest paid employees
--     in each department of the "employees" table, sorted by department ID and then by salary in descending order.

USE queries5_1;
CREATE TABLE departments_task7 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees_task7 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments_task7(department_id)
);

INSERT INTO departments_task7 (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Developer'),
(3, 'Finance');

INSERT INTO employees_task7 (employee_id, name, salary, department_id) VALUES
(101, 'Vraj', 75000.00, 1),
(102, 'Ved', 70000.00, 1),
(103, 'Aastha', 80000.00, 2),
(104, 'Anjli', 55000.00, 2),
(105, 'Ramesh', 62000.00, 3),
(106, 'Mahesh', 60000.00, 3),
(107, 'Shanaya', 90000.00, 1),
(108, 'Rohan', 50000.00, 3),
(109, 'Christopher Nolan ', 72000.00, 2);

-- SELECT name,salary,department_name
-- FROM
-- (SELECT
-- 	e.name,
--     e.salary,
--     d.department_name,
-- 	ROW_NUMBER() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_row_number
-- FROM employees_task7 e 
-- INNER JOIN departments_task7 d
-- ON e.department_id = d.department_id
-- HAVING salary_row_number<6
-- );
SELECT name, salary, department_name FROM (
    SELECT e.name, e.salary, d.department_name,
        ROW_NUMBER() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_row_number
    FROM employees_task7 e 
    INNER JOIN departments_task7 d ON e.department_id = d.department_id
) AS ranked_rows
WHERE salary_row_number <= 5;





-- SELECT E.EMPLOYEE_NAME, E.SALARY FROM EMPLOYEEST1 E
-- LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
-- WHERE (SELECT COUNT(*) 
--        FROM EMPLOYEEST1 E2 
-- 	   WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID AND E2.SALARY >= E.SALARY) <= 5
-- ORDER BY E.DEPARTMENT_ID, E.SALARY DESC;