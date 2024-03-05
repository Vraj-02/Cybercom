CREATE DATABASE  movies;

USE movies;

CREATE TABLE `Cinema` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `movie` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `rating` FLOAT NOT NULL
);

INSERT INTO `Cinema` VALUES
('War', 'great 3D', 8.9),
('Science', 'fiction', 8.5),
('Irish', 'boring', 6.2),
('Ice song', 'Fantasy', 8.6),
('House card', 'Interesting', 9.1);

SELECT * FROM `cinema`
WHERE id %2 =1
AND NOT description = 'boring'
ORDER BY rating DESC;


