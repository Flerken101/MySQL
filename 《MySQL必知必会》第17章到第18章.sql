USE crashcourse;
SELECT vend_id,prod_id,prod_price
FROM products
WHERE prod_price <= 5;
SELECT vend_id,prod_id,prod_price
FROM products
WHERE vend_id IN(1001,1002);
SELECT vend_id,prod_id,prod_price
FROM products
WHERE prod_price <= 5
UNION 
SELECT vend_id,prod_id,prod_price
FROM products
WHERE vend_id IN(1001,1002);
SELECT vend_id,prod_id,prod_price
FROM products
WHERE prod_price <= 5
OR vend_id IN(1001,1002);

SELECT vend_id,prod_id,prod_price
FROM products
WHERE prod_price <= 5
UNION ALL
SELECT vend_id,prod_id,prod_price
FROM products
WHERE vend_id IN(1001,1002)
ORDER BY vend_id,prod_price;

SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('rabbit');

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit');

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit');

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit');

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit');

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit');

SELECT note_text
FROM productnotes
WHERE note_text LIKE '%rabbit%';

SELECT note_text,
	   MATCH (note_text) AGAINST('rabbit') AS rank
FROM productnotes
ORDER BY rank;

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('anvils');

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('anvils');

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('anvils');

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('anvils');

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('anvils' WITH QUERY EXPANSION);

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('anvils' WITH QUERY EXPANSION);

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('anvils' WITH QUERY EXPANSION);

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('heavy -rope*' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('heavy -rope*' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('+rabbit +bait' IN BOOLEAN MODE) ;

SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('rabbit bait' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('"rabbit bait"' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('>rabbit <carrot' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE Match(note_text) AGAINST('+safe +(<combination)' IN BOOLEAN MODE);