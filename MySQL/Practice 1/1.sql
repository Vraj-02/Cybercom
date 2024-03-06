-- 1.	Create a database structure for product and categories. 
--      One product can be in more than one category and one category can have multiple products.

CREATE DATABASE productsDB;
USE productsDB;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Create table for mapping products to categories (many-to-many relationship)
CREATE TABLE product_category (
    product_id INT,
    category_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    PRIMARY KEY (product_id, category_id)
);