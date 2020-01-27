DROP TABLE IF EXISTS "customers";
DROP SEQUENCE IF EXISTS customers_customerid_seq;
CREATE SEQUENCE customers_customerid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."customers" (
    "customerid" integer DEFAULT nextval('customers_customerid_seq') NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "gender" character varying,
    "address" character varying(200),
    "phone" integer,
    "email" character varying(100),
    "city" character varying(20),
    "country" character varying(50),
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customerid")
) WITH (oids = false);

INSERT INTO "customers" ("customerid", "firstname", "lastname", "gender", "address", "phone", "email", "city", "country") VALUES
(1,	'John',	'Hibert',	'Male',	'284 chaucer st',	84789657,	'john@gmail.com',	'Johannesburg',	'South Africa'),
(2,	'Thando',	'Sithole',	'Female',	'240 Sect 1',	794445584,	'thando@gmail.com',	'Cape Town',	'South Africa'),
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd,Gilits',	820832830,	'Leon@gmail.com',	'Durban',	'South Africa'),
(4,	'Charl',	'Muller',	'Male',	'290A Dorset Ecke',	856872553,	'Charl.muller@yahoo.com',	'Berlin',	'Germany'),
(5,	'Julia',	'Stein',	'Female',	'2 Wernerring',	672445058,	'Js234@yahoo.com',	'Frankfurt',	'Germany');

DROP TABLE IF EXISTS "employees";
DROP SEQUENCE IF EXISTS employees_employeeid_seq;
CREATE SEQUENCE employees_employeeid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."employees" (
    "employeeid" integer DEFAULT nextval('employees_employeeid_seq') NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "email" character varying(100),
    "jobtitle" character varying(20),
    CONSTRAINT "employees_pkey" PRIMARY KEY ("employeeid")
) WITH (oids = false);

INSERT INTO "employees" ("employeeid", "firstname", "lastname", "email", "jobtitle") VALUES
(1,	'Kani',	'Matthew',	'mat@gmail.com',	'Manager'),
(2,	'Lesly',	'Cronje',	'LesC@gmail.com',	'Clerk'),
(3,	'Gideon',	'Maduku',	'm@gmail.com',	'Accountant');

DROP TABLE IF EXISTS "orders";
DROP SEQUENCE IF EXISTS orders_orderid_seq;
CREATE SEQUENCE orders_orderid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."orders" (
    "orderid" integer DEFAULT nextval('orders_orderid_seq') NOT NULL,
    "productid" integer,
    "paymentid" integer,
    "fulfilledbyemployeeid" integer,
    "daterequired" date,
    "dateshipped" date,
    "status" character varying(20),
    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderid"),
    CONSTRAINT "orders_paymentid_fkey" FOREIGN KEY (paymentid) REFERENCES payments(paymentid) NOT DEFERRABLE,
    CONSTRAINT "orders_productid_fkey" FOREIGN KEY (productid) REFERENCES products(productid) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "orders" ("orderid", "productid", "paymentid", "fulfilledbyemployeeid", "daterequired", "dateshipped", "status") VALUES
(1,	1,	1,	2,	'2018-05-09',	NULL,	'Not shipped'),
(2,	1,	2,	2,	'2018-04-09',	'2018-03-09',	'Shipped'),
(3,	3,	3,	3,	'2018-06-09',	NULL,	'Not shipped');

DROP TABLE IF EXISTS "payments";
DROP SEQUENCE IF EXISTS payments_paymentid_seq;
CREATE SEQUENCE payments_paymentid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."payments" (
    "customerid" integer,
    "paymentid" integer DEFAULT nextval('payments_paymentid_seq') NOT NULL,
    "paymentdate" timestamp,
    "amount" numeric,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("paymentid")
) WITH (oids = false);

INSERT INTO "payments" ("customerid", "paymentid", "paymentdate", "amount") VALUES
(1,	1,	'2018-01-09 00:00:00',	150.75),
(5,	2,	'2018-03-09 00:00:00',	150.75),
(4,	3,	'2018-03-09 00:00:00',	700.60);

DROP TABLE IF EXISTS "products";
DROP SEQUENCE IF EXISTS products_productid_seq;
CREATE SEQUENCE products_productid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."products" (
    "productid" integer DEFAULT nextval('products_productid_seq') NOT NULL,
    "productname" character varying(100),
    "description" character varying(300),
    "buyprice" numeric,
    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
) WITH (oids = false);

INSERT INTO "products" ("productid", "productname", "description", "buyprice") VALUES
(1,	'Harley Davidson Chopper',	'This replica features working kickstands, font suspension, gear-shift lever',	150.75),
(2,	'Classic Car',	'Turnable front wheels , steering function',	550.75),
(3,	'Sports Car',	'Turnable front wheels, steering function',	700.60);
