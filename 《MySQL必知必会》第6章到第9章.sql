use crashcourse;
show tables;
select prod_name,prod_price from products where prod_price between 5  and 10;
select cust_id FROM customers1 WHERE cust_email IS NULL;
SELECT prod_id,prod_price,prod_name FROM products 
WHERE vend_id = 1003 AND prod_price <= 10;
SELECT vend_id,prod_name,prod_price FROM products
WHERE vend_id = 1002 OR vend_id = 1003;
SELECT prod_name,prod_price FROM products 
WHERE vend_id = 1002 or vend_id = 1003 AND prod_price >= 10;
SELECT vend_id,prod_name,prod_price FROM products
WHERE (vend_id = 1002 or vend_id = 1003) AND prod_price >= 10;
SELECT  vend_id,prod_name,prod_price FROM products
WHERE vend_id IN(1002,1003)
ORDER BY prod_name;
SELECT vend_id,prod_name,prod_price FROM products
WHERE vend_id NOT IN(1002,1003)
ORDER BY prod_name;
SELECT prod_id,prod_name FROM products
WHERE prod_name LIKE 'jet%';
SELECT prod_id,prod_name FROM products
WHERE prod_name LIKE '%anvil%';
SELECT prod_id,prod_name FROM products
WHERE prod_name LIKE 's%e';
SELECT prod_id,prod_name FROM products
WHERE prod_name LIKE '_ ton anvil';
SELECT prod_id,prod_name FROM products
WHERE prod_name LIKE '_ TON anvil';

SELECT prod_name FROM products
WHERE prod_name REGEXP '1000'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '.000'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name LIKE '1000'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name LIKE '%1000';

SELECT prod_name FROM products
WHERE prod_name REGEXP '1000|2000'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '[123] Ton'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '1|2|3 ton'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '[1-5] Ton'
ORDER BY prod_name;

SELECT vend_name FROM vendors
WHERE vend_name REGEXP '.'
ORDER BY vend_name;

SELECT vend_name FROM vendors
WHERE vend_name REGEXP '\\.'
ORDER BY vend_name;

SELECT vend_name FROM vendors
WHERE vend_name REGEXP '\\.'
ORDER BY vend_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '\\([0-9] sticks?\\)'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '[[:digit:]]{4}'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '[[:digit:]]'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '^[:digit:]]'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '^[[:digit:]]'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '[0-9][0-9][0-9][0-9]'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '^[0-9\\.]'
ORDER BY prod_name;

SELECT prod_name FROM products
WHERE prod_name REGEXP '[0-9]|\\.'
ORDER BY prod_name;