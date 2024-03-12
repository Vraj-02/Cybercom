-- Case 1
-- Create a database called "sales" with three tables: "customers", "orders", and "products".

CREATE DATABASE queries3_5;

USE queries3_5;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    unit_price DECIMAL(10, 2),
    description TEXT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- QUESTION 1.	Insert at least five customers, five products, and ten orders into the respective tables.
-- Make sure that at least two customers have multiple orders, and at least two products are included in multiple orders.

INSERT INTO customers VALUES
    (1, 'Vraj', 'Patel', 'vraj@email.com', '9876543210'),
    (2, 'Ved', 'Patel', 'ved@email.com', '8765432109'),
    (3, 'Aastha', 'Patel', 'aastha@email.com', '7654321098'),
    (4, 'Jenil', 'Prajapati', 'jenil@email.com', '9012345678'),
    (5, 'Prachi', 'Desai', 'prachi@email.com', '8901234567'),
    (6, 'Helly', 'Patel', 'helly@email.com', '7890123456');

INSERT INTO products VALUES
    (1, 'Product A', 20.00, 'Description for Product A'),
    (2, 'Product B', 25.00, 'Description for Product B'),
    (3, 'Product C', 30.00, 'Description for Product C'),
    (4, 'Product D', 15.00, 'Description for Product D'),
    (5, 'Product E', 18.00, 'Description for Product E');

INSERT INTO orders VALUES
    (1, '2022-01-15', 1, 2),
    (2, '2022-02-20', 2, 1),
    (3, '2022-03-05', 3, 3),
    (4, '2022-04-10', 4, 2),
    (5, '2022-05-15', 5, 4),
    (6, '2022-06-20', 2, 5),
    (7, '2022-07-05', 2, 3),
    (8, '2022-08-10', 3, 4),
    (9, '2022-09-15', 4, 3),
    (10, '2022-10-20', 5, 2);
    
 -- QUESTION 2.	Write a query that retrieves the customer's first name, last name, email, and the number of orders they have placed.
 --              The results should be ordered by the number of orders in descending order.
 SELECT customers.first_name,customers.last_name,customers.email,COUNT(orders.order_id) AS number_of_orders
 FROM customers
 LEFT JOIN orders ON customers.customer_id=orders.customer_id
 GROUP BY customers.customer_id
 ORDER BY number_of_orders DESC;
 
 -- QUESTION 3.	Write a query that retrieves the product name, the total number of orders for each product,
 -- and the total revenue generated by each product. The results should be ordered by the total revenue in descending order.
 SELECT products.product_name,
        COUNT(orders.order_id) AS TOTAL_number_of_orders,
        SUM(products.unit_price) AS total_revenue
 FROM products
 LEFT JOIN orders ON products.product_id=orders.product_id
 GROUP BY products.product_id
 ORDER BY  TOTAL_number_of_orders DESC;
 
--  QUESTION 4.	Write a query that retrieves the first name, last name, email, and product name for each order.
--  The results should only include orders where the customer has placed multiple orders.
SELECT DISTINCT
    c.first_name,
    c.last_name,
    c.email,
    p.product_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE
    c.customer_id IN (
        SELECT customer_id
        FROM orders
        GROUP BY customer_id
        HAVING COUNT(order_id) > 1
    );

-- QUESTION 5.	Write a query that retrieves the first name, last name, and email for each customer who has placed 
--              at least one order for a product with a unit price greater than $20.

SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE p.unit_price>20;

-- QUESTION 6.	Write a query that retrieves the product name and the number of times it has been ordered, 
--              but only includes products that have been ordered more than once.
SELECT p.product_name,COUNT(o.order_id) AS NumberOfTimes_Ordered
FROM products p 
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id
HAVING NumberOfTimes_Ordered>1;






 
 
 
 
 