-- Stored procedure with multiple function

CREATE DATABASE Stored_1;
USE Stored_1;
-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);


INSERT INTO employees (employee_id, name, salary) VALUES
(1, 'Alice', 50000.00),
(2, 'Bob', 60000.00),
(3, 'Charlie', 70000.00);


DELIMITER //
CREATE PROCEDURE ManageEmployee(IN action VARCHAR(10), IN empID INT, IN newSalary DECIMAL(10, 2))
BEGIN

    IF action = 'delete' THEN
        DELETE FROM employees WHERE employee_id = empID;

    ELSEIF action = 'update' AND newSalary IS NOT NULL THEN
        UPDATE employees SET salary = newSalary WHERE employee_id = empID;
    ELSE
        SELECT 'Invalid action or missing parameters';
    END IF;
END //
DELIMITER ;

CALL ManageEmployee('delete', 3, NULL);

CALL ManageEmployee('update', 1, 55000.00);

CALL ManageEmployee('update', 2, NULL);

SELECT * FROM employees;