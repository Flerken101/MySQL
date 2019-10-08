USE crashcourse;
CREATE TABLE customers2
(
  cust_id      int       NOT NULL AUTO_INCREMENT,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL ,
  PRIMARY KEY (cust_id)
) ENGINE=InnoDB;

INSERT INTO customers2
VALUE(NULL,
	'Pep E.LaPew',
    '100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA',
    NULL,
    NULL);
    
INSERT INTO customers2(cust_name,
	cust_address,
	cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email)
VALUES('Pep E.LaPew',
	'100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA',
    NULL,
    NULL);
    
INSERT INTO customers2(cust_name,
	cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
VALUES('Pep E.LaPew',
	'100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA');
INSERT INTO customers2(cust_name,
	cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
VALUES('Pep E.LaPew',
	'100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA');
    
INSERT INTO customers2(cust_name,
	cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
VALUES(
	'Pep E.LaPew',
	'100 Main Street',
    'Los Angeles',
    'CA',
    '90046',
    'USA'
),
(
    'M.Martain',
    '42 Galaxy Way',
    'New York',
    'NY',
    '11213',
    'USA'
);

CREATE TABLE custnew
(
  cust_id      int       NOT NULL AUTO_INCREMENT,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL ,
  PRIMARY KEY (cust_id)
) ENGINE=InnoDB;

INSERT INTO custnew(
	cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email)
VALUES(
    'M.Martain',
    '42 Galaxy Way',
    'New York',
    'NY',
    '11213',
    'USA',
    NULL,
    NULL
);

INSERT INTO custnew(
	cust_id,
	cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email)
VALUES(
	NULL,
    'M.Martain',
    '42 Galaxy Way',
    'New York',
    'NY',
    '11213',
    'USA',
    NULL,
    NULL
);


INSERT INTO customers2(
	cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
SELECT 
	cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
FROM custnew;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = 'emailS@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = NULL
WHERE cust_id = 10005;

UPDATE customers1
SET cust_email = NULL 
WHERE cust_id = 10005;

DELETE FROM customers1
WHERE cust_id = 10006;

UPDATE customers1
SET cust_email = (
	SELECT cust_id
	FROM orders
    WHERE order_num = 20009
)
WHERE cust_id = 10005;
	
#UPDATE IGNORE customers1

TRUNCATE customers2;