USE crashcourse;


SET @b=1; 

DROP PROCEDURE IF EXISTS temp;
DELIMITER //
CREATE PROCEDURE temp()
BEGIN
    DECLARE a INT DEFAULT 1;

    SET a=a+1;
    SET @b=@b+1;
    SELECT a,@b;

END//
DELIMITER ;


CALL temp();
SELECT @b;

DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    OUT total DECIMAL(8,2)
)
BEGIN
	SELECT Sum(quantuty*item_price)
    FROM orederitems
    WHERE order_number = onumber
    INTO total;
END//

DELIMITER ;

CALL ordertotal(20005,@total);
SELECT @total;

DROP PROCEDURE ordertotal;




-- Name: ordertotal
-- parameters: onumber = order number
-- 			   taxable = 0 if not taxable,1 if taxable
--             otatal = order total variable

DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    IN taxable BOOLEAN,
    OUT ototal DECIMAL(8,2)
)COMMENT 'Obtain order total,optionally adding tax'
BEGIN 
	
    DECLARE total DECIMAL(8,2);
    DECLARE taxrate INT DEFAULT 6;
    
    SELECT Sum(quantity*item_price)
    FROM orderitems
    WHERE order_num = onumber
    INTO ototal;
    
    IF taxable THEN 
		SELECT total+(total/100*taxrate) INTO total;
	END IF;
    
    SELECT total INTO ototal;
    
END//

DELIMITER ;

CALL ordertotal(20005,1,@total);
SELECT @total;

DELIMITER //
CREATE PROCEDURE processorders()
BEGIN 
	DECLARE ordernumbers cursor for
    SELECT order_num FROM orders;
    
    OPEN ordernumbers;
END//

DELIMITER ;

CALL processorders;

DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare the cursor
    DECLARE ordersnumbers CURSOR FOR 
    SELECT order_num FROM orders;
    
    -- Open the cursor
    OPEN ordernumbers;
    
    -- Close thr cursor
    CLOSE ordernumbers;
    
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS processorders;

DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare local variables
    DECLARE o INT;
    
    -- Declare the cursor
    DECLARE ordernumbers CURSOR FOR 
    SELECT order_num FROM orders;
    
    -- Open the cursor
    OPEN ordernumbers;
    
    -- Get ordernumber
    FETCH ordernumbers INTO o;
    
    -- Close the cursor
    CLOSE ordernumbers;
    
END//

DROP PROCEDURE IF EXISTS processorders;

DELIMITER //

CREATE PROCEDURE processorders()
BEGIN
	-- Declare local variables
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    
    -- Declare the cursor
    DECLARE ordernumbers CURSOR FOR
    SELECT order_num FROM orders;
    -- Declare continue handler
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
    
    -- Open the cursor
    OPEN ordernumbers;
    
    -- Loop  through all rows
    REPEAT 
		-- Get order number
        FETCH ordernumbers INTO o;
        
	-- End of loop
    UNTIL done END REPEAT;
    
    -- Close the cursor
    CLOSE ordernumbers;

END//


DELIMITER ;

DROP PROCEDURE IF EXISTS processorders;

DELIMITER //
CREATE PROCEDURE processorders()
BEGIN

	-- Declare local variables
	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE o INT;
	DECLARE t DECIMAL(8,2);

	-- Declare the cursor
    DECLARE ordernumbers CURSOR FOR
    SELECT order_num FROM orders;
    -- Declare continue handler
    DECLARE CONTINUE HANDLER FOR  SQLSTATE '02000' SET done=1;
    
    -- Create a table to store the results
    CREATE TABLE IF NOT EXISTS ordertotals
		(order_num INT,total DECIMAL(8,2));
        
	-- Open the cursor
    OPEN ordernumbers;
    
    -- Loop though all rows
    REPEAT
		-- Get order number
		FETCH ordernumbers INTO O;
        
        -- Get the total for this order
        CALL ordertotal(o,1,t);
        
        -- Insert order and total into ordertotals
        INSERT INTO ordertotals(order_num,total) VALUES(o,t);
       
        -- ???
		SELECT * FROM ordertotals; 
        
        -- End of loop
        UNTIL done END REPEAT;
        
        -- Close the cursor
        CLOSE ordernumbers;
       

       
END//

DELIMITER ;
    
CREATE TRIGGER newproduct AFTER INSERT ON products
FOR EACH ROW SELECT 'Product added';

INSERT INTO products(prod_id,
	vend_id,
    prod_name,
    prod_price)
VALUES('TNT3',
	'1005',
    'TNT',
    '10');
    
DROP TRIGGER newproduct;

DELIMITER //
CREATE TRIGGER neworder AFTER INSERT ON orders
FOR EACH ROW 
BEGIN
	SELECT 'Product added';
END//

DELIMITER ;

INSERT INTO orders(order_date,cust_id)
VALUES(Now(),10001);

DELIMITER //
CREATE TRIGGER deleteorder BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
	INSERT INTO archive_orders(order_num,order_date,cust_id)
    VALUES(OLD.order_num,OLD.order_date,OLD.cust_id);
END//

DELIMITER ;

CREATE TRIGGER updatevendor BEFORE UPDATE ON vendors
FOR EACH ROW  SET NEW.vend_state = Upper(NEW.vend_state);


USE crashcourse;
-- Chapter 26 管理事务处理
SELECT * FROM ordertotals;
START TRANSACTION;
DELETE FROM ordertotals;
SELECT * FROM ordertotals;
ROLLBACK;
SELECT * FROM ordertotals;

START TRANSACTION;
DELETE FROM orderitems WHERE order_num = 20010;
DELETE FROM orders WHERE order_num = 20010;
COMMIT;

START TRANSACTION;
DELETE FROM orderitems WHERE order_num = 20010;
SAVEPOINT deletel;
DELETE FROM orders WHERE order_num = 20010;
COMMIT;

START TRANSACTION;
-- √
DELETE FROM orderitems WHERE order_num = 20007;
SAVEPOINT deletel;
-- ×
DELETE FROM orders WHERE order_num = 20007;
ROLLBACK TO deletel;

SET autocommit=0;
SELECT order_num FROM orders;
SET autocommit=1;
-- 27
SHOW CHARACTER SET;
SHOW COLLATION;

SHOW VARIABLES LIKE 'character%';
SHOW VARIABLES LIKE 'collation%';

CREATE TABLE mytble
(
	columnn1 INT,
    columnn2 VARCHAR(10)
)DEFAULT CHARACTER SET hebrew
 COLLATE hebrew_general_ci;
 
 CREATE TABLE mytable
 (
	columnn1 INT,
    columnn2 VARCHAR(10),
    column3 VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_general_ci
 ) DEFAULT CHARACTER SET hebrew
   COLLATE hebrew_general_ci;
   
SELECT * FROM customers1
ORDER BY lastname,firstname COLLATE latin1_general_cs;

-- 28
USE mysql;
SELECT user FROM user;

CREATE USER ben IDENTIFIED BY 'p@$$w0rd';

SELECT user FROM user;

RENAME USER ben TO bforta;

USE mysql;
SELECT user FROM user;

DROP USER bforta;

CREATE USER ben IDENTIFIED BY 'p@$$w0rd';

DROP USER ben1;

CREATE USER ben1 IDENTIFIED BY 'p@$$w0rd';
SHOW GRANTS FOR ben1;

GRANT SELECT ON crashcourse.* TO ben1;

SHOW GRANTS FOR ben1;

REVOKE SELECT ON crashcourse.* FROM ben1;

SHOW GRANTS FOR ben1;

SET PASSWORD FOR ben1 = Password('n3w p@$$w0rd');

ANALYZE TABLE orders;
ANALYZE TABLE customers;
ANALYZE TABLE customers1;
ANALYZE TABLE customers2;

CHECK TABLE orders,orderitems;