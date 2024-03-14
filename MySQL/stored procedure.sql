
USE queries5_2;

-- Create procedure
DELIMITER //

CREATE PROCEDURE GetCustomerDetails()
BEGIN
    SELECT * FROM Customers;
END //
DELIMITER ;

-- to call procedure
CALL GetCustomerDetails();

-- to delete procedure
DROP PROCEDURE IF EXISTS GetCustomerDetails;

-- get customer by id
-- use in
DELIMITER //
CREATE PROCEDURE GetCustomerByID (IN id INT)
BEGIN
    SELECT * FROM Customers WHERE CustomerID = id;
END //
DELIMITER ;
CALL GetCustomerByID (1);

-- use OUT
DROP PROCEDURE IF EXISTS fetchRecordsSO;
DELIMITER //
CREATE PROCEDURE fetchRecordsSO(IN id INT, OUT Customer_name VARCHAR(255))
BEGIN
	SELECT Name INTO Customer_name FROM Customers WHERE CustomerID = id;
END //
DELIMITER ;
CALL fetchRecordsSO(1, @customerName);
SELECT  @customerName;











