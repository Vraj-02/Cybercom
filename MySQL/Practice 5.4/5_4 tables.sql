CREATE DATABASE queries5_4;
USE queries5_4;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    category_id INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE `returns` (
    return_id INT PRIMARY KEY,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100)
);


INSERT INTO customers (customer_id, name) VALUES
(1, 'Vraj'),
(2, 'Ved'),
(3, 'Aastha'),
(4, 'Helly'),
(5, 'Vivek'),
(6, 'Anjali'),
(7, 'Rahul'),
(8, 'Neha'),
(9, 'Sanjay'),
(10, 'Pooja');

-- TRUNCATE TABLE orders;

INSERT INTO orders (order_id, customer_id, category_id, total_amount) VALUES
(1, 1, 1, 50.00),
(2, 2, 2, 30.00),
(3, 3, 1, 25.00),
(4, 4, 3, 40.00),
(5, 5, 1, 15.00),
(6, 6, 2, 20.00),
(7, 7, 3, 35.00),
(8, 8, 1, 45.00),
(9, 1, 2, 55.00),
(10, 2, 3, 60.00),
(11, 1, 2, 70.00),
(12, 2, 3, 80.00),
(13, 3, 1, 90.00),
(14, 4, 2, 100.00),
(15, 5, 3, 110.00),
(16, 6, 1, 120.00),
(17, 7, 2, 130.00),
(18, 8, 3, 140.00),
(19, 9, 1, 150.00),
(20, 10, 2, 160.00),
(21, 1, 3, 170.00),
(22, 2, 1, 180.00),
(23, 3, 2, 190.00),
(24, 4, 3, 200.00),
(25, 5, 1, 210.00);


INSERT INTO returns (return_id, order_id) VALUES
(1, 3),
(2, 5),
(3, 9),
(4, 11),
(5, 15),
(6, 17),
(7, 19),
(8, 21),
(9, 23),
(10, 25);


INSERT INTO categories (category_id, name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM `returns`;
SELECT * FROM categories;


