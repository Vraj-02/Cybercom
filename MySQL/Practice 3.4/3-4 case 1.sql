-- CASE 1
-- Assume you are working on a database for a car dealership. The database contains the following tables:
CREATE DATABASE queries3_4;
USE queries3_4;

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Mileage INT,
    Price DECIMAL(10, 2),
    Available BIT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Cars (CarID, Brand, Model, Year, Mileage, Price, Available)
VALUES
    (1, 'Toyota', 'Camry', 2020, 30, 25000.00, 1),
    (2, 'Honda', 'Civic', 2019, 25, 22000.50, 1),
    (3, 'Ford', 'Mustang', 2021, 15, 35000.75, 1),
    (4, 'Chevrolet', 'Malibu', 2018, 28, 18000.25, 0),
    (5, 'Hyundai', 'Elantra', 2022, 13, 20000.00, 1),
    (6, 'Nissan', 'Altima', 2017, 32, 16000.50, 1),
    (7,'Maruti', 'Alto' , 2023, 40, 15000.00 , 1);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES
    (1, 'Vraj', 'Patel', 'vraj@email.com', '9876543210'),
    (2, 'Ved', 'Patel', 'ved@email.com', '8765432109'),
    (3, 'Aastha', 'Patel', 'aastha@email.com', '7654321098'),
    (4, 'Jenil', 'Prajapati', 'jenil@email.com', '9012345678'),
    (5, 'Prachi', 'Desai', 'prachi@email.com', '8901234567'),
    (6, 'Helly', 'Patel', 'helly@email.com', '7890123456'),
    (7, 'Sarthak', 'Mistry', 'sarthak@email.com', '6789012345');

INSERT INTO Sales (SaleID, CarID, CustomerID, SaleDate, SalePrice)
VALUES
    (1, 1, 2, '2022-01-15', 24000.00),
    (2, 3, 5, '2022-02-20', 33000.50),
    (3, 5, 1, '2022-03-05', 19500.00),
    (4, 2, 4, '2022-04-10', 21500.75),
    (5, 4, 3, '2022-05-15', 17500.25),
    (6, 6, 6, '2022-06-20', 15500.50),
    (7, 1, 3, '2022-07-05', 24500.00),
    (8, 3, 1, '2022-08-10', 34500.75),
    (9, 5, 4, '2022-09-15', 19500.25),
    (10, 2, 2, '2022-10-20', 21000.50),
	(11, 7, 2, '2022-10-20', 15000.50);

-- QUESTION 1.	Retrieve the top 10 most expensive cars from the Cars table.
SELECT * FROM Cars
ORDER BY Price DESC
LIMIT 0,10;

-- QUESTION 2.	Retrieve the average price of all available cars from the Cars table.
SELECT AVG(Price) AS Average_Price FROM Cars
WHERE Available=1;

-- QUESTION 3.	Retrieve the list of customers who have purchased a car,
-- 			    along with the total number of cars each customer has purchased.
SELECT  Customers.FirstName, Customers.LastName, COUNT(Sales.SaleID) AS `No. of cars`
FROM Customers
LEFT JOIN Sales ON Customers.CustomerID=Sales.CustomerID
WHERE Sales.CustomerID IS NOT NULL
GROUP BY Customers.CustomerID;

-- QUESTION 4.	Retrieve the list of customers who have not yet made a purchase.
SELECT  Customers.FirstName, Customers.LastName
FROM Customers
LEFT JOIN Sales ON Customers.CustomerID=Sales.CustomerID
WHERE Sales.CustomerID IS NULL
GROUP BY Customers.CustomerID;

-- QUESTION 5.	Insert a new car into the Cars table with the following information:
--              Brand='Toyota', Model='Corolla', Year=2022, Mileage=0, Price=20000, Available=1.
INSERT INTO Cars (CarID,Brand, Model, Year, Mileage, Price, Available)
VALUES (8,'Toyota', 'Corolla', 2022, 0, 20000.00, 1);

-- QUESTION 6.	Update the price of all cars in the Cars table by adding 10% to their current price.
UPDATE Cars
SET Price=Price*1.10;
SELECT * FROM Sales;

-- QUESTION 7.	Delete all sales from the Sales table that occurred before January 1, 2022.
DELETE FROM Sales
WHERE SaleDate<'2022-01-01';












