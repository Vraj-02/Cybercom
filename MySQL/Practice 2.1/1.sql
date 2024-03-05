CREATE DATABASE office;
USE office;

CREATE TABLE employee(
`emp_id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(255) NOT NULL,
`salary` BIGINT NOT NULL,
`position` VARCHAR(255)  NOT NULL,
`sex` ENUM('m','f') NOT NULL
);

CREATE TABLE `leave`(
`leave_id` INT AUTO_INCREMENT PRIMARY KEY,
`emp_id` INT NOT NULL,
`date` DATE NOT NULL,
`reason` VARCHAR(255) NOT NULL,
`approval_status` BOOLEAN DEFAULT FALSE,
FOREIGN KEY(emp_id) REFERENCES employee(emp_id)
);