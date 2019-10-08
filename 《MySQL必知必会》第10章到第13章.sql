USE crashcourse;
show tables;
SELECT Concat(vend_name,'(',vend_country,')')
FROM vendors
ORDER BY vend_name;
SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')')
FROM vendors
ORDER BY vend_name;
SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')') AS vend_title
FROM vendors ORDER BY vend_name;
SELECT prod_id,quantity,item_price FROM orderitems
WHERE order_num = 20005;
SELECT prod_id,
	   quantity,
       item_price,
       quantity*item_price AS expanded_price
FROM orderitems WHERE order_num = 20005;
SELECT vend_name,Upper(vend_name) AS vend_name_upcase
FROM vendors ORDER BY vend_name;
SELECT cust_name,cust_contact FROM customers1
WHERE cust_contact = 'Y Lie';
SELECT cust_name,cust_contact FROM customers1
WHERE Soundex(cust_contact) = Soundex('Y Lie');
SELECT Now();
SELECT cust_id,order_num FROM orders 
WHERE order_date = '2005-09-01';
SELECT cust_id,order_num FROM orders
WHERE Date(order_date) = '2005-09-01';
SELECT cust_id,order_num FROM orders
WHERE Date(order_date)  BETWEEN '2005-09-01' AND '2005-09-30';
SELECT cust_id,order_num FROM orders
WHERE Year(order_date) = 2005 AND Month(order_date) = 9;
SELECT AVG(prod_price) AS avg_price FROM products;
SELECT AVG(prod_price) AS avg_price FROM products
WHERE vend_id = 1003;
SELECT COUNT(*) AS num_cust FROM customers1;
SELECT COUNT(cust_email) AS num_cust FROM customers1;
SELECT MAX(prod_price) AS max_price FROM products;
SELECT MIN(prod_price) AS min_price FROM products;
SELECT SUM(quantity) AS items_ordered FROM orderitems;
SELECT SUM(quantity*item_price) AS total_price FROM orderitems
WHERE order_num = 20005;
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products WHERE vend_id = 1003;
SELECT COUNT(*) AS num_items,
	   MAX(prod_price) AS max_price,
       MIN(prod_price) AS min_price,
       AVG(prod_price) AS avg_price
FROM products;
SELECT vend_id,COUNT(*) AS num_prod FROM products
WHERE vend_id = 1003;
SELECT vend_id,COUNT(*) AS num_prod FROM products
GROUP BY vend_id;
SELECT vend_id,COUNT(*) AS num_prods 
FROM products
GROUP BY vend_id WITH ROLLUP;
SELECT cust_id,COUNT(*) AS orders 
FROM orders
GROUP BY cust_id 
HAVING count(*) >= 2;
SELECT cust_id,COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;
SELECT vend_id,COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 10
GROUP BY vend_id
HAVING COUNT(*) >= 2;
SELECT vend_id,COUNT(*) AS num_prods
FROM products
GROUP BY vend_id
HAVING COUNT(*) >= 2;
SELECT vend_id,COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 10
GROUP BY vend_id
HAVING num_prods >= 2;
SELECT order_num,SUM(quantity*item_price) AS total_price
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity*item_price) >= 50
ORDER BY total_price;
SELECT order_num,SUM(quantity*item_price) AS ordertoral
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity*item_price) >= 50;
SELECT order_num,SUM(quantity*item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING ordertotal >= 50
ORDER BY ordertotal;