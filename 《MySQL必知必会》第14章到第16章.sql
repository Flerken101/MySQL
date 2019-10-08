USE crashcourse;
SELECT order_num 
FROM orderitems
WHERE prod_id = 'TNT2';
SELECT cust_id
FROM orders
WHERE order_num IN(20005,20007);
SELECT cust_id,cust_contact
FROM customers1
WHERE cust_id IN(10001,10004);

SELECT cust_id,cust_contact
FROM customers1
WHERE cust_id IN (SELECT cust_id
				  FROM orders
                  WHERE order_num IN(SELECT order_num
									 FROM orderitems
									 WHERE prod_id = 'TNT2'));

SELECT COUNT(*) AS orders
FROM orders
WHERE cust_id = 10001;

SELECT cust_name,
	   cust_state,
       (SELECT COUNT(*)
       FROM orders
       WHERE orders.cust_id = customers1.cust_id) AS orders
FROM customers1
GROUP BY cust_id;

SELECT cust_name,
	   cust_state,
       (SELECT COUNT(*)
       FROM orders
       WHERE orders.cust_id = customers1.cust_id) AS orders
FROM customers1
GROUP BY cust_id;

SELECT vend_name,prod_name,prod_price
FROM vendors,products
WHERE vendors.vend_id = products.vend_id
ORDER BY vend_name,prod_name;

SELECT vend_name,prod_name,prod_price
FROM vendors,products
WHERE vendors.vend_id = products.vend_id
ORDER BY vend_name,prod_name;

SELECT vend_name,prod_name,prod_price
FROM vendors,products
ORDER BY vend_name,prod_name;

SELECT vend_name,prod_name,prod_price
FROM vendors INNER JOIN products
ON vendors.vend_id = products.vend_id;

SELECT vend_name,prod_name,prod_price
FROM vendors INNER JOIN products
ON vendors.vend_id = products.vend_id;

SELECT prod_name,vend_name,prod_price,quantity
FROM orderitems,products,vendors
WHERE products.vend_id = vendors.vend_id
  AND orderitems.prod_id  = products.prod_id
  AND order_num = 20005;


SELECT prod_name, vend_name,prod_price,quantity
FROM orderitems,vendors,products
WHERE orderitems.prod_id = products.prod_id
  AND products.vend_id = vendors.vend_id
  AND order_num = 20005;
  
#订购产品TNT2的客户列表
#使用子查询
SELECT cust_name,cust_state
FROM customers1
WHERE cust_id IN (SELECT cust_id
				  FROM orders
				  WHERE order_num IN(SELECT order_num
								     FROM orderitems
								     WHERE prod_id = 'TNT2'));

#使用联结
SELECT cust_name,cust_state
FROM customers1,orders,orderitems
WHERE orderitems.prod_id = 'TNT2'
  AND orders.order_num = orderitems.order_num
  AND customers1.cust_id = orders.cust_id;
  
SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')') AS vend_title
FROM vendors
ORDER BY vend_name;

SELECT cust_name,cust_contact
FROM customers1 AS c,orders AS o,orderitems AS oi
WHERE c.cust_id = o.cust_id
  AND o.order_num = oi.order_num
  AND prod_id = 'TNT2';
  
#找到生产ID为DTNTR的物品的供应商,然后找出这个供应商生产的其他产品
SELECT prod_id,prod_name
FROM products
WHERE vend_id = (SELECT vend_id
				  FROM products
				  WHERE prod_id = 'DTNTR');
                  
 SELECT p1.prod_id,p1.prod_name
 FROM products AS p1,products AS p2
 WHERE p1.vend_id = p2.vend_id
   AND p2.prod_id = 'DTNTR';
   
SELECT p2.prod_id,p2.prod_name
FROM products AS p1,products AS p2
WHERE p1.prod_id = 'DTNTR'
  AND p2.vend_id = p1.vend_id;
  
SELECT c.*,o.order_num,o.order_date,
	   oi.prod_id,oi.quantity,oi.item_price
FROM customers1 AS c,orders AS o,orderitems AS oi
WHERE c.cust_id = o.cust_id
  AND oi.order_num = o.order_num
  AND prod_id = 'FB';
  
SELECT c.*,o.order_num,o.order_date,
	   oi.prod_id,oi.quantity,oi.item_price
FROM customers1 AS c,orders AS o,orderitems AS oi
WHERE oi.prod_id = 'FB'
  AND oi.order_num = o.order_num
  AND o.cust_id = c.cust_id;
  
SELECT customers1.cust_id,orders.order_num
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id;

SELECT customers1.cust_id,orders.order_num
FROM customers1 LEFT OUTER JOIN orders
ON customers1.cust_id = orders.cust_id;

SELECT customers1.cust_id,orders.order_num
FROM orders RIGHT OUTER JOIN customers1
ON customers1.cust_id = orders.cust_id;

SELECT orders.order_num,customers1.cust_id
FROM orders LEFT OUTER JOIN customers1
ON customers1.cust_id = orders.cust_id;

#检索所有客户及每个客户所下的订单数
SELECT customers1.cust_name,
	   customers1.cust_id,
	   COUNT(orders.order_num) AS num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT oi.order_num,
	   SUM(oi.quantity)  AS total_num
FROM orderitems AS oi
GROUP BY oi.order_num;

SELECT c.cust_name,
	   c.cust_id,
       COUNT(o.order_num) AS num_ord
FROM customers1 AS c INNER JOIN orders AS o
ON c.cust_id = o.cust_id
GROUP BY c.cust_id;

SELECT c.cust_name,
	   c.cust_id,
       COUNT(o.order_num) AS num_ord
FROM customers1 AS c LEFT OUTER JOIN orders AS o
ON c.cust_id = o.cust_id
GROUP BY c.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) As num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num)  AS num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS num_ord
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS num_order
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS num_order
FROM customers1 INNER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;

SELECT customers1.cust_name,
	   customers1.cust_id,
       COUNT(orders.order_num) AS order_num
FROM customers1 LEFT OUTER JOIN orders
ON customers1.cust_id = orders.cust_id
GROUP BY customers1.cust_id;