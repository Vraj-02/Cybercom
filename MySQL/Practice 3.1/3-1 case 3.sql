
-- CASE 3------------------------------------------------------------
-- Write a query to retrieve the total sales for each month in the year 2021,
-- sorted in ascending order by month.

USE queries3_1;

CREATE TABLE sales (
    id INT PRIMARY KEY,
    date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2)
);

INSERT INTO sales (id, date, customer_id, product_id, quantity, total_price) VALUES
(1, '2022-01-15', 101, 1, 2, 31.98),
(2, '2022-02-20', 102, 3, 1, 10.75),
(3, '2022-03-05', 103, 2, 3, 76.50),
(4, '2022-04-10', 101, 4, 1, 5.99),
(5, '2022-05-15', 104, 5, 2, 17.00),
(6, '2021-07-10', 105, 2, 1, 25.50),
(7, '2021-09-15', 106, 4, 2, 11.98),
(8, '2021-11-20', 107, 1, 3, 47.97),
(9, '2021-12-25', 108, 3, 1, 10.75),
(10, '2021-12-31', 109, 5, 4, 34.00);



SELECT EXTRACT(MONTH FROM date) AS month,
       SUM(total_price) AS total_sales
FROM sales
WHERE EXTRACT(YEAR FROM date) = 2021
GROUP BY month
ORDER BY month;




