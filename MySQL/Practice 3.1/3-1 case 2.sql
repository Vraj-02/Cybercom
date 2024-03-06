-- CASE 2 -------------------------------
-- Write a query to retrieve the name and price of all items in the inventory
--  where the quantity is greater than 0 and the category is 'electronics', 
--  sorted in descending order by price.

USE queries3_1;

CREATE TABLE inventory (
    id INT PRIMARY KEY,
    `name` VARCHAR(255),
    quantity INT,
    price DECIMAL(10,2),
    category VARCHAR(50)
);
INSERT INTO inventory (id, name, quantity, price, category) VALUES
(1, 'Product A', 100, 15.99, 'Electronics'),
(2, 'Product B', 50, 25.50, 'Clothing'),
(3, 'Product C', 200, 10.75, 'Home and Garden'),
(4, 'Product D', 75, 5.99, 'Office Supplies'),
(5, 'Product E', 0, 8.50, 'Electronics');



SELECT `name`, price FROM inventory
WHERE quantity>0 AND category='Electronics'
ORDER BY price DESC;


