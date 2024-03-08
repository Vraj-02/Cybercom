-- CASE 1
-- Consider a table called "books" with the following columns:
--  "id", "title", "author", "publication_year".
--  Write a SQL query to retrieve the title and author of the oldest book in the table.

CREATE DATABASE queries3_3;

USE queries3_3;

CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    publication_year INT
);

INSERT INTO books (id, title, author, publication_year)
VALUES
    (1, 'The God of Small Things', 'Arundhati Roy', 1997),
    (2, 'Interpreter of Maladies', 'Jhumpa Lahiri', 1999),
    (3, 'A Suitable Boy', 'Vikram Seth', 1993),
    (4, 'The White Tiger', 'Aravind Adiga', 2008),
    (5, 'The Palace of Illusions', 'Chitra Banerjee Divakaruni', 2008);


SELECT title, author
FROM books
WHERE publication_year = (
    SELECT MIN(publication_year)
    FROM books
);
