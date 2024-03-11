-- CASE 1 
-- Assume that you are working with a database containing information about a bookstore. The database has several tables:

CREATE DATABASE queries4_1;
USE queries4_1;

CREATE TABLE authors (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE book_categories (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE book_category_mappings (
    id INT PRIMARY KEY,
    book_id INT,
    category_id INT,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (category_id) REFERENCES book_categories(id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE book_borrowings (
    id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    borrow_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO authors VALUES
    (1, 'Author1'),
    (2, 'Author2'),
    (3, 'Author3'),
    (4, 'Author4'),
    (5, 'Author5');

INSERT INTO book_categories VALUES
    (1, 'Fiction'),
    (2, 'Science Fiction'),
    (3, 'Mystery'),
    (4, 'Non-Fiction'),
    (5, 'Romance');

INSERT INTO books VALUES
    (1, 'Book1', 1, '2020-01-01'),
    (2, 'Book2', 2, '2020-02-15'),
    (3, 'Book3', 3, '2021-03-20'),
    (4, 'Book4', 4, '2019-12-10'),
    (5, 'Book5', 5, '2020-05-05');

INSERT INTO book_category_mappings VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 1, 3),
    (7, 3, 5);

INSERT INTO customers VALUES
    (1, 'Vraj', 'Patel', 'vraj@email.com', '9876543210'),
    (2, 'Ved', 'Patel', 'ved@email.com', '8765432109'),
    (3, 'Aastha', 'Patel', 'aastha@email.com', '7654321098'),
    (4, 'Jenil', 'Prajapati', 'jenil@email.com', '9012345678'),
    (5, 'Prachi', 'Desai', 'prachi@email.com', '8901234567'),
    (6, 'Helly', 'Patel', 'helly@email.com', '7890123456');

INSERT INTO book_borrowings VALUES
    (1, 1, 1, '2021-01-01'),
    (2, 2, 2, '2021-02-15'),
    (3, 3, 3, '2021-03-20'),
    (4, 4, 4, '2021-04-10'),
    (5, 5, 5, '2021-05-05'),
    (6, 1, 3, '2021-01-02'),
    (7, 2, 4, '2021-02-16'),
    (8, 3, 4, '2021-03-21'),
    (9, 3, 5, '2021-04-11'),
    (10, 5, 1, '2021-05-06');
    
    SELECT * FROM book_borrowings;
    
--   QUESTION 1.  Write a query to find all books published in the year 2020.
  SELECT * FROM books
  WHERE YEAR(publication_date)=2020;

-- QUESTION 2.   Write a query to find the name of the author who has written the most number of books.
INSERT INTO books VALUES
 (6, 'Book6', 3, '2020-04-05');

SELECT a.name,COUNT(b.id) AS TotalBooks
FROM authors a
LEFT JOIN books b ON a.id=b.author_id
GROUP BY a.id
ORDER BY TotalBooks DESC
LIMIT 1;

-- QUESTION 3.	Write a query to find the name of the category with the most number of books.
SELECT b_c.name,COUNT(b_c_m.book_id) AS TotalBooks
FROM book_categories b_c
LEFT JOIN book_category_mappings b_c_m ON b_c.id=b_c_m.book_id
GROUP BY b_c.id
ORDER BY TotalBooks DESC
LIMIT 1;

-- QUESTION 4.	Write a query to find the name of the author who has written the most number of books in the category "fiction".
SELECT a.name AS author_name
FROM authors a
JOIN books b ON a.id = b.author_id
JOIN book_category_mappings m ON b.id = m.book_id
JOIN book_categories c ON m.category_id = c.id
WHERE c.name = 'fiction'
GROUP BY a.id, a.name
ORDER BY COUNT(b.id) DESC
LIMIT 1;

-- QUESTION 5.	Write a query to find the titles of the top 5 most popular books. 
-- The popularity of a book is defined as the number of times it has been borrowed by customers.
SELECT b.title , COUNT(bb.id) AS Times_Borrowed
FROM books b 
JOIN book_borrowings bb ON b.id=bb.book_id
GROUP BY b.id
ORDER BY Times_Borrowed DESC
LIMIT 1;









