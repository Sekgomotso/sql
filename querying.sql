SELECT * FROM customers;

SELECT firstname FROM customers;

SELECT firstname FROM customers WHERE customerid = 1;

UPDATE customers SET firstname = 'Lerato Mabitso' WHERE customerid = 1;

DELETE FROM customers WHERE customerid = 2;

SELECT count(status) FROM orders;

SELECT max(amount) FROM payments;

SELECT * FROM customers ORDER BY country;

SELECT productname FROM products WHERE buyprice BETWEEN 100 AND 600;

SELECT * FROM customers WHERE country = 'Germany' AND city = 'Berlin';

SELECT * FROM customers WHERE city = 'Durban' OR city = 'Cape Town';

SELECT * FROM products WHERE buyprice > 500;

SELECT sum(amount) FROM payments;

SELECT count(status) FROM orders WHERE status = 'Shipped';

SELECT avg(buyprice) FROM products;

SELECT * FROM customers INNER JOIN payments ON payments.customerid = customers.customerid;

SELECT * FROM products WHERE Description LIKE '%Turnable front wheels%';