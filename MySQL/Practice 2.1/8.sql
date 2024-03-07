-- 8.	Write an SQL query to report the first name, last name, city, and state of each person in the Person table.
 -- If the address of a personId is not present in the Address table, report null instead. Return the result table in any order.

CREATE DATABASE personAdddb;
USE personAdddb;

CREATE TABLE Person (
    personId INT PRIMARY KEY,
    lastName VARCHAR(255),
    firstName VARCHAR(255)
);


CREATE TABLE Address (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255),
    FOREIGN KEY (personId) REFERENCES Person(personId)
);

INSERT INTO Person (personId, lastName, firstName) VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');

INSERT INTO Address (addressId, personId, city, state) VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California');

SELECT Person.firstName,Person.lastname,Address.city,Address.state
FROM Person 
LEFT JOIN Address ON Person.personId=Address.personId; 



