
-- CASE 2-------------------------------------------------------
-- Write a query to retrieve the name and number of posts for each user who joined the platform in the year 2022,
-- along with the total number of likes received for each user's posts.

USE queries3_1;
DROP TABLE users;
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP
);
CREATE TABLE posts (
    id INT PRIMARY KEY,
    user_id INT,
    body TEXT,
    created_at TIMESTAMP
);
CREATE TABLE likes (
    id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    created_at TIMESTAMP
);

INSERT INTO users (id, name, created_at) VALUES
(1, 'Raj', TIMESTAMP '2021-03-15 08:30:00'),
(2, 'Priya', TIMESTAMP '2022-05-20 12:45:00'),
(3, 'Amit', TIMESTAMP '2023-08-10 09:15:00'),
(4, 'Neha', TIMESTAMP '2022-01-25 14:20:00'),
(5, 'Suresh', TIMESTAMP '2022-04-05 11:00:00'),
(6, 'Ananya', TIMESTAMP '2023-09-08 16:30:00');


INSERT INTO posts (id, user_id, body, created_at) VALUES
(1, 1, 'Excited to start my coding journey!', TIMESTAMP '2021-03-16 09:00:00'),
(2, 2, 'Just finished a great coding session.', TIMESTAMP '2022-05-21 13:20:00'),
(3, 3, 'Working on a new project. #codinglife', TIMESTAMP '2023-08-12 10:45:00'),
(4, 4, 'Learning SQL and loving it!', TIMESTAMP '2021-01-26 15:10:00'),
(5, 5, 'JavaScript is both challenging and fun.', TIMESTAMP '2022-04-06 12:30:00'),
(6, 6, 'Bootstrap makes web development so much easier.', TIMESTAMP '2023-09-10 17:00:00'),
(7, 1, 'Reached a milestone in my coding practice.', TIMESTAMP '2021-02-15 11:45:00'),
(8, 2, 'Trying out new CSS styles.', TIMESTAMP '2022-06-20 14:15:00'),
(9, 3, 'Feeling accomplished today!', TIMESTAMP '2023-09-25 16:30:00'),
(10, 4, 'SQL queries are becoming second nature.', TIMESTAMP '2021-01-30 18:00:00');


INSERT INTO likes (id, user_id, post_id, created_at) VALUES
(1, 2, 1, TIMESTAMP '2021-02-16 12:00:00'),
(2, 4, 1, TIMESTAMP '2022-06-21 14:30:00'),
(3, 1, 3, TIMESTAMP '2023-09-26 17:00:00'),
(4, 3, 5, TIMESTAMP '2021-01-31 19:30:00'),
(5, 5, 6, TIMESTAMP '2022-05-10 11:45:00'),
(6, 6, 8, TIMESTAMP '2023-08-15 13:15:00'),
(7, 2, 9, TIMESTAMP '2021-11-20 15:30:00'),
(8, 4, 10, TIMESTAMP '2022-02-25 18:00:00'),
(9, 1, 2, TIMESTAMP '2023-06-01 20:15:00'),
(10, 3, 4, TIMESTAMP '2021-09-05 21:30:00');

SELECT 
    users.name AS user_name,
    COUNT(posts.id) AS post_count,
    SUM(CASE WHEN likes.post_id IS NOT NULL THEN 1 
        ELSE 0 
        END) AS total_likes
FROM users
LEFT JOIN posts ON users.id = posts.user_id
LEFT JOIN likes ON posts.id = likes.post_id
WHERE EXTRACT(YEAR FROM users.created_at) = 2022
GROUP BY users.id;









