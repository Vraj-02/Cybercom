CREATE DATABASE queries3_2;

-- CASE 1-----------------------------------------------------
-- Write a query to retrieve the title and body of the five most recent blog posts, along with the number of comments each post has.

USE queries3_2;

CREATE TABLE blog_posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    author_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
-- DROP TABLE blog_comments;
CREATE TABLE blog_comments (
    id INT PRIMARY KEY,
    post_id INT,
    body TEXT,
    author_id INT,
    created_at TIMESTAMP
);

INSERT INTO blog_posts (id, title, body, author_id, created_at, updated_at) VALUES
(1, 'First Post', 'This is the body of the first post.', 101, '2022-01-01 12:00:00', '2022-01-01 12:00:00'),
(2, 'Second Post', 'This is the body of the second post.', 102, '2022-02-01 14:30:00', '2022-02-05 09:45:00'),
(3, 'Third Post', 'This is the body of the third post.', 103, '2022-03-01 10:15:00', '2022-03-03 11:30:00'),
(4, 'Fourth Post', 'This is the body of the fourth post.', 104, '2022-04-01 09:00:00', '2022-04-02 10:30:00'),
(5, 'Fifth Post', 'This is the body of the fifth post.', 105, '2022-05-01 14:45:00', '2022-05-05 16:20:00'),
(6, 'Sixth Post', 'This is the body of the sixth post.', 101, '2022-06-01 11:10:00', '2022-06-03 14:00:00'),
(7, 'Seventh Post', 'This is the body of the seventh post.', 102, '2022-07-01 08:30:00', '2022-07-03 09:45:00'),
(8, 'Eighth Post', 'This is the body of the eighth post.', 103, '2022-08-01 10:00:00', '2022-08-05 12:15:00');

INSERT INTO blog_comments (id, post_id, body, author_id, created_at) VALUES
(1, 1, 'Great post!', 201, '2022-01-02 13:30:00'),
(2, 1, 'I enjoyed reading this.', 202, '2022-01-03 08:45:00'),
(3, 2, 'Looking forward to more posts!', 203, '2022-02-02 16:20:00'),
(4, 3, 'Well written!', 204, '2022-03-02 12:10:00'),
(5, 2, 'Nice insights in the second post!', 205, '2022-02-05 10:30:00'),
(6, 3, 'The third post resonated with me.', 206, '2022-03-05 13:45:00'),
(7, 5, 'Looking forward to more content!', 207, '2022-04-02 11:20:00'),
(8, 6, 'Looking forward to more content!', 207, '2022-08-02 11:20:00'),
(9, 1, 'Looking forward to more content!', 207, '2022-09-02 11:20:00'),
(10, 8, 'Looking forward to more content!', 207, '2022-09-02 11:20:00');

SELECT blog_posts.title,blog_posts.body,COUNT(blog_comments.id) AS Total_Comments
FROM blog_posts LEFT JOIN blog_comments ON blog_posts.id=blog_comments.post_id
GROUP BY blog_posts.id
ORDER BY blog_posts.created_at DESC
LIMIT 5;




    

