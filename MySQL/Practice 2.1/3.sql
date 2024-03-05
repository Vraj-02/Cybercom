CREATE DATABASE salaryDb;
USE salaryDb;

CREATE TABLE `salary` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `sex` ENUM('m', 'f') NOT NULL,
    `salary` INT NOT NULL
);
INSERT INTO `salary` VALUES
(1, 'A', 'm', 2500),
(2, 'B', 'f', 1500),
(3, 'C', 'm', 5500),
(4, 'D', 'f', 500);

UPDATE Salary
SET sex = CASE
    WHEN sex = 'm' THEN 'f'
    WHEN sex = 'f' THEN 'm'
END;

SELECT * FROM `salary`
ORDER BY `id` ASC;



