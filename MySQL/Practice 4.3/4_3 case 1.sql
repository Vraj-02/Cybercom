CREATE DATABASE queries4_3;

USE queries4_3;
-- Create users table
CREATE TABLE users (
    id  INT PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Create orders table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    amount FLOAT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
DROP TABLE users;
-- Insert sample data into users table
INSERT INTO users  VALUES 
	(1, 'Vraj', 'vraj@example.com','123456', '2024-03-11 12:00:00', '2024-03-11 12:00:00'),
    (2, 'Ved', 'ved@email.com', 'abcdef', '2024-03-11 12:30:00', '2024-03-11 12:30:00'),
    (3, 'Aastha',  'aastha@email.com', 'qwerty', '2024-03-11 13:00:00', '2024-03-11 13:00:00'),
    (4, 'Jenil',  'jenil@email.com', '9012345678','2024-03-11 17:30:00', '2024-03-11 17:30:00'),
    (5, 'Prachi', 'prachi@test.com', '8901234567', '2024-03-11 17:00:00', '2024-03-11 17:00:00'),
    (6, 'Helly',  'helly@test.com', '7890123456','2024-03-11 16:30:00', '2024-03-11 16:30:00');
    
INSERT INTO orders VALUES 
    (1,1, 50.00, '2024-03-11 14:00:00', '2024-03-11 14:00:00'),
    (2,1, 75.00, '2024-03-11 14:30:00', '2024-03-11 14:30:00'),
    (3,2, 120.00, '2024-03-11 15:00:00', '2024-03-11 15:00:00'),
    (4,3, 40.00, '2024-03-11 15:30:00', '2024-03-11 15:30:00'),
    (5,2, 90.00, '2024-03-11 16:00:00', '2024-03-11 16:00:00'),
    (6,2, 90.00, '2024-01-11 16:00:00', '2024-02-11 16:00:00');
    
-- 1.	Create a new user with the following information:
--        name: John Doe
-- 	      email: john.doe@example.com
--        password: 123456
--        created_at: current timestamp
--        updated_at: current timestamp
INSERT INTO users 
VALUES (7,'John Doe', 'john.doe@example.com', '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 2.	Retrieve the names and email addresses of all users who have placed at least one order.
SELECT u.name, u.email
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id;

-- 3.	Retrieve the total amount of orders placed by each user, sorted in descending order of total amount.
SELECT u.id, u.name, u.email, IFNULL(SUM(o.amount), 0) AS total_amount 
FROM users u 
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id
ORDER BY total_amount DESC;

-- 4.	Retrieve the email address of the user who has placed the most orders.
SELECT u.id, u.name, u.email 
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id
HAVING COUNT(o.id) = (
    SELECT COUNT(o2.id) AS orders_counts 
    FROM orders o2
    GROUP BY o2.user_id
    ORDER BY orders_counts DESC
    LIMIT 1
);

-- 5.	Retrieve the user IDs and the total amount of orders placed by users who have placed at least one order and 
 --    whose total amount of orders exceeds $100.
 SELECT u.id, SUM(o.amount) AS total_amount
 FROM users u
 JOIN orders o ON u.id = o.user_id
 GROUP BY u.id
 HAVING total_amount>100;
 
 -- 6.	Retrieve the number of users who have not placed any orders.
 SELECT COUNT(u.id)
 FROM users u
 LEFT JOIN orders o ON u.id=o.user_id
 WHERE o.id IS NULL;
;
-- 7.	Update the user with ID 1 to change their email address to "jane.doe@example.com".
UPDATE users SET email='jane.doe@example.com' WHERE id=1;
SELECT * FROM users;

-- 8.	Delete all orders placed by users whose email address contains the string "test".
DELETE FROM orders
WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%test%');

-- 9.	Retrieve the total amount of orders placed on each day of the current week, grouped by day.
SELECT DATE(created_at) AS order_date, SUM(amount) AS total_amount
FROM orders
WHERE WEEK(created_at) = WEEK(CURRENT_DATE)
GROUP BY order_date;

-- 10.	Retrieve the IDs and email addresses of users who have placed an order in the current year 
--      and whose email address is in the format "example.com".
SELECT DISTINCT u.id, u.email
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE YEAR(o.created_at) = YEAR(CURRENT_DATE) AND u.email LIKE '%@example.com';







 
 
 
 







