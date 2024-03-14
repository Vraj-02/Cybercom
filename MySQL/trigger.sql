CREATE DATABASE trigger_db;

USE trigger_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    credit_limit DECIMAL(10, 2),
    credit_rating TEXT
);

-- Trigger to set a minimum credit limit for new customers
DELIMITER //
CREATE TRIGGER before_customer_insert
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
	IF NEW.credit_limit < 10000.00 THEN
		SET NEW.credit_limit = 10000.00;
	END IF;
END //
DELIMITER ;

DROP TRIGGER update_credit_limit_on_rating_change;

-- Update trigger to adjust credit limit based on credit rating change
DELIMITER //
CREATE TRIGGER update_credit_limit_on_rating_change
BEFORE UPDATE ON customers
FOR EACH ROW
BEGIN
    IF OLD.credit_rating <> NEW.credit_rating THEN
        CASE NEW.credit_rating
            WHEN 'excellent' THEN
                SET NEW.credit_limit = 50000.00;
            WHEN 'good' THEN
                SET NEW.credit_limit = 30000.00;
            ELSE
                SET NEW.credit_limit = 10000.00;
        END CASE;
    END IF;
END //
DELIMITER ;

INSERT INTO customers VALUES(1,'Vraj',5000.00,'good');

UPDATE customers SET credit_rating = 'excellent' WHERE customer_id = 1;

SELECT * FROM customers;



