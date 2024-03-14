
-- 1. Write a SQL query to retrieve the names of all customers who have placed orders for products 
--    in the "Electronics" category, along with the total amount they have spent on all orders.
-- 	  The output should be sorted by the total amount spent in descending order.

CREATE DATABASE queries5_2;

USE queries5_2;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Shipping_city VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255),
    Category VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(100)
);

CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    OrderItemID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (OrderItemID) REFERENCES OrderItems(OrderItemID)
);

INSERT INTO Customers (CustomerID, Name,Shipping_city ) VALUES
(1, 'Vraj', 'Ahmedabad'),
(2, 'Ved', 'Delhi'),
(3, 'Aastha', 'Mumbai'),
(4,'Helly','Ahmedabad'),
(5, 'Sarthak', 'Kanpur');

INSERT INTO Products (ProductID, Name, Category) VALUES
(1, 'Smartphone', 'Electronics'),
(2, 'Laptop', 'Electronics'),
(3, 'T-shirt', 'Clothing'),
(4, 'Jeans', 'Clothing');

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2024-03-12'),
(2, 2, '2024-03-13'),
(3, 3, '2024-03-14'),
(4, 4, '2024-03-15'),
(5, 5, '2024-03-11');

INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 2, 500.00),
(2, 1, 2, 1, 1200.00),
(3, 2, 3, 3, 30.00),
(4, 3, 4, 2, 50.00),
(5, 4, 3, 2, 25.00),
(6, 2, 1, 1, 480.00),
(7, 3, 2, 4, 1100.00),
(8, 1, 4, 1, 60.00),
(9, 4, 4, 2, 100.00),
(10, 3, 1, 3, 550.00),
(11, 1, 2, 1, 1150.00),
(12, 2, 3, 2, 40.00),
(13, 3, 4, 1, 45.00),
(14, 4, 1, 3, 530.00),
(15, 2, 2, 1, 1250.00),
(16, 3, 3, 4, 35.00),
(17, 4, 4, 2, 70.00),
(18, 2, 1, 2, 490.00),
(19, 3, 2, 3, 1150.00),
(20, 4, 3, 1, 20.00),
(21, 5, 1, 1, 480);


INSERT INTO Employees (EmployeeID, Name, City) VALUES
(1, 'Suresh Sharma', 'Mumbai'),
(2, 'Anita Verma', 'Delhi'),
(3, 'Raj Singh', 'Bangalore'),
(4, 'Anjli', 'Ahmedabad');


INSERT INTO EmployeeSales (SaleID, EmployeeID, OrderItemID) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 4),
(4, 1, 5),
(5, 2, 6),
(6, 3, 7),
(7, 1, 8),
(8, 2, 9),
(9, 3, 10),
(10, 1, 11),
(11, 2, 21); 


-- <---------Query--------------------------------------->

SELECT c.Name AS CustomerName, SUM(oi.Quantity * oi.Price) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE p.Category = 'Electronics'
GROUP BY c.CustomerID
ORDER BY TotalAmount DESC;


