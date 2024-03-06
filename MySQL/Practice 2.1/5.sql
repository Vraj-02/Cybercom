CREATE DATABASE customerOrderdb;
USE customerOrderdb;

CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);

INSERT INTO Customers VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

INSERT INTO Orders (id, customerId) VALUES
(1, 3),
(2, 1);

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL OR o.customerId IS NULL;




