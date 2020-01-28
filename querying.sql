select * from customers

select firstname from customers;

select firstname from customers where customerid = 1;

update customers set firstname = 'Lerato Mabitso' where customerid = 1;

delete from customers where customerid = 2;

select count(status) from orders;

select max(amount) from payments;

select * from customers order by country;

select productname from products where buyprice between 100 and 600;

select * from customers where country = 'Germany' and city = 'Berlin';

select * from customers where city = 'Durban' or city = 'Cape Town';

select * from products where buyprice > 500;

select sum(amount) from payments;

select count(status) from orders where status = 'Shipped';

select avg(buyprice) from products;

select * from customers inner join payments on payments.customerid = customers.customerid;

select * from products where description = 'turnable front wheels, steering function';