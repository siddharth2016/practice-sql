SELECT count(customerid) FROM customers
WHERE gender='F' AND (state='OR' OR state='NY')

SELECT count(customerid) FROM customers
WHERE age!=55

SELECT count(customerid) FROM customers
WHERE gender='F' AND state='OR'

SELECT * FROM customers
WHERE age>44 AND income>=100000

SELECT count(customerid) FROM customers
WHERE 30<=age AND age<=50 AND income<50000

SELECT avg(income) FROM customers
WHERE 20<=age AND age<=50

SELECT age, income FROM customers
WHERE (age<30 OR age>=50)
AND income>50000 AND (country='Japan' OR country='Australia')

SELECT sum(totalamount) FROM orders
WHERE netamount>100
AND ('2004-06-01'<=orderdate AND orderdate<='2004-06-30')

SELECT age, income FROM customers
WHERE income<50000 AND age BETWEEN 30 AND 50
ORDER BY age ASC

SELECT avg(income) FROM customers
WHERE age BETWEEN 20 AND 50

SELECT count(orderid) FROM orders
WHERE customerid IN (7888, 1082, 12808, 9623)

SELECT * FROM customers
WHERE zip::TEXT LIKE '%2%'

SELECT * FROM customers
WHERE zip::TEXT LIKE '2_1%'

SELECT COALESCE(state, 'No State') AS "State", phone FROM customers
WHERE phone::TEXT LIKE '302%'

SELECT count(customerid) FROM orders
WHERE EXTRACT( YEAR FROM orderdate ) = 2004
AND EXTRACT( MONTH FROM orderdate ) = 1

SELECT count(customerid) FROM orders
WHERE date_trunc( 'month', orderdate ) = date '2004-01-01'

SELECT * FROM orders AS o
INNER JOIN customers AS c ON o.customerid = c.customerid
WHERE c.state = 'OH' OR c.state = 'NY' OR c.state = 'OR'
ORDER BY o.orderid

SELECT p.prod_id, p.quan_in_stock, p.sales FROM inventory AS p
INNER JOIN products AS q ON p.prod_id = q.prod_id

