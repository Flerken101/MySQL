USE crashcourse;
SELECT last_insert_id();
UPDATE customers1 
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;
UPDATE customers1
SET cust_email = ''
WHERE cust_id = 10004;

UPDATE customers1
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_name = 'A',
	cust_email = 'B'
WHERE cust_id = 10001;

DELETE FROM customers1
WHERE cust_id = 10005;

TRUNCATE customers2;

CREATE TABLE customers3
(
	cust_id		 int			NOT NULL	AUTO_INCREMENT,
    cust_name	 char(50)	NOT NULL,
    cust_address char(50)	NULL,
    cust_city	 char(50)	NULL,
    cust_state	 char(5)	NULL,
    cust_zip	 char(10)	NULL,
    cust_counrty char(50)	NULL,
    cust_contact char(50)	NULL,
    cust_email	 char(255)	NULL,
    PRIMARY KEY(cust_id)
    ) ENGINE = InnoDB;
    
    DROP TABLE customers3;
    
    CREATE TABLE customers3
(
	cust_id		 int			NOT NULL	AUTO_INCREMENT,
    cust_name	 char(50)	NOT NULL,
    cust_address char(50)	NULL,
    cust_city	 char(50)	NULL,
    cust_state	 char(5)	NULL,
    cust_zip	 char(10)	NULL,
    cust_counrty char(50)	NULL,
    cust_contact char(50)	NULL,
    cust_email	 char(255)	NULL,
    PRIMARY KEY(cust_id)
    ) ENGINE = InnoDB;
    
    ALTER TABLE vendors
    DROP COLUMN vend_phone;
    
    ALTER TABLE vendors
    ADD vend_phone char(20) DEFAULT 1;
    
    ALTER TABLE vendors
    DROP COLUMN vend_phone;

CREATE TABLE orders1
(
	order_num		int			NOT NULL	AUTO_INCREMENT,
    order_date		datetime	NOT NULL,
    cust_id			int			NOT NULL,
    PRIMARY KEY(order_num)
) ENGINE = InnoDB;

CREATE TABLE orderitems1
(
	order_num		int			NOT NULL,
    order_item		int			NOT NULL,
    prod_id			char(10)	NOT NULL,
    quantity		int(11)		NOT NULL,
    item_price		decimal(8,2) NOT NULL,
    PRIMARY KEY(order_num,order_item)
) ENGINE = InnoDB;

ALTER TABLE orderitems1
ADD CONSTRAINT fk_orderitems1_orders1
FOREIGN KEY(order_num)  REFERENCES orders1(order_num);

ALTER TABLE orderitems1
ADD CONSTRAINT fk_orderitems1_products
FOREIGN KEY(prod_id) REFERENCES products(prod_id);
    
ALTER TABLE orderitems
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY(order_num) REFERENCES orders(order_num);

DROP TABLE orders1;

RENAME TABLE customers3 TO customers4;

DROP TABLE customers;

SELECT cust_name,cust_contact
FROM customers1,orders,orderitems
WHERE customers1.cust_id = orders.cust_id
  AND orders.order_num = orderitems.order_num
  AND prod_id = 'TNT2';
  
SELECT cust_name,cust_contact
FROM customers1,orders,orderitems
WHERE customers1.cust_id = orders.cust_id
  AND orders.order_num = orderitems.order_num
  AND prod_id = 'TNT2';

DROP VIEW IF EXISTS productcustomers;
  
CREATE VIEW productcustomers AS 
SELECT cust_name,cust_contact,prod_id
FROM customers1,orders,orderitems
WHERE customers1.cust_id = orders.cust_id
  AND orders.order_num = orderitems.order_num;
  
SELECT cust_name,cust_contact
FROM productcustomers
WHERE prod_id = 'TNT2';

SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')')
		AS vend_title
FROM vendors
ORDER BY vend_name;

DROP VIEW IF EXISTS vendorslocations;

CREATE VIEW vendorlocations AS
SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')')
	   AS vend_title
FROM vendors
ORDER BY vend_name;

SELECT * 
FROM vendorlocations;

SELECT *
FROM productcustomers;

SELECT cust_name,cust_contact
FROM productcustomers
WHERE cust_name = 'A';

CREATE  VIEW customeremaillist AS
SELECT cust_id,cust_name,cust_email
FROM customers1
WHERE cust_email IS NOT NULL;

SELECT *
FROM customeremaillist;

SELECT prod_id,
	   quantity,
       item_price,
       quantity*item_price AS expanded_price
FROM orderitems
WHERE order_num = 20005;

CREATE VIEW orderitemsexpanded AS 
SELECT order_num,
	   prod_id
       quantity,
       item_price,
       quantity*item_price AS expanded_price
FROM orderitems;

SELECT *
FROM orderitemsexpanded
WHERE order_num = 20005;

SELECT Avg(prod_price) AS priceaverage
    FROM products;

-- 创建，执行，删除存储过程
-- 例一
DELIMITER //
CREATE PROCEDURE productpricing()
BEGIN
	SELECT Avg(prod_price) AS priceaverage
    FROM products;
END//

DELIMITER ;

CALL productpricing();

DROP PROCEDURE productpricing;

-- 例二
DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber	INT,
    OUT ototal DECIMAL(8,2)
)
BEGIN
	SELECT Sum(item_price*quantity)
	FROM orderitems
    WHERE order_num = onumber
    INTO ototal;
END//

DELIMITER ;

CALL ordertotal(20005,@total);
SELECT @total;

CALL ordertotal(20009,@total);
SELECT @total;

-- 例三

DELIMITER //
CREATE PROCEDURE productpricing(
	OUT pl DECIMAL(8,2),
    OUT Ph DECIMAL(8,2),
    OUT pa DECIMAL(8,2)
)
BEGIN
	SELECT Min(prod_price)
    INTO pl
    FROM products;
    SELECT Max(prod_price)
    INTO ph
    FROM products;
    SELECT Avg(prod_price)
	INTO pa
    FROM products;
END//

DELIMITER ;

DELIMITER //
CREATE PROCEDURE productpricing(
	OUT pl DECIMAL(8,2),
    OUT ph DECIMAL(8,2),
    OUT pa DECIMAL(8,2)
)
BEGIN
	SELECT Min(prod_price)
    FROM products
    INTO pl;
    SELECT Max(prod_price)
    FROM products
    INTO ph;
    SELECT Avg(prod_price)
    FROM products
    INTO pa;
END//

DELIMITER ;

CALL productpricing(@pricelow,
					@pricehigh,
                    @priceaverage);
                    
SELECT @priceaverage;

SELECT @pricelow,@pricehigh,@priceaverage;

DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    OUT ototal DECIMAL(8,2)
)
BEGIN
	SELECT Sum(item_price*quantity)
    FROM orderitems
    WHERE order_num = onumber
    INTO ototal;
END//

DELIMITER ;

CALL ordertotal(20005,@total);
SELECT @total;

DELIMITER //
CREATE PROCEDURE  ordertotal(
	IN onumber INT,
    OUT ototal DECIMAL(8,2)
)
BEGIN
	SELECT Sum(item_price*quantity)
    FROM orderitems
    WHERE order_num = onumber
    INTO ototal;
END//

DELIMITER ;

CALL ordertotal(20005,@total);
SELECT @total;

-- Name:ordertotal
-- Parameters: onumber = order number
			  taxable = 0 if not taxable,1 if taxable
              ototal = order total variable

DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    IN taxable BOOLEAN,
    OUT ototal DECIMAL(8,2)
) COMMENT 'Obatin order total,optionally adding tax'
BEGIN

	-- Declare variable for total
    DECLARE total DECIMAL(8,2);
    -- Declare tax percentage
    DECLARE taxrate INT DEFAULT 6;
    
    -- Get the order total
    SELECT Sum(item_price*quantity)
    FROM orderitems
    WHERE order_num = onumber
    INTO total;
    
    -- Is this taxable?
    IF taxable THEN
		-- Yes,so add taxrate to the total
        SELECT total+(total/100*taxrate) INTO total;
	END IF;
    
    -- And finally,save to out variable
    SELECT total INTO ototal;
    
END//

DELIMITER ;

CALL ordertotal(20005,0,@total);
SELECT @total;

CALL ordertotal(20005,1,@total);
SELECT @total;

SHOW CREATE PROCEDURE ordertotal;

SHOW PROCEDURE STATUS LIKE 'ordertotal';