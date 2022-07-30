use cust;
-- JOIN
-- INNER JOIN
-- OUTER JOIN
-- 	LEFT OUTER JOIN
-- 	RIGHT OUTER JOIN
--     CROSS JOIN

CREATE TABLE customer(
custid INT,
custname VARCHAR(100),
city VARCHAR(20)
);

INSERT INTO customer VALUES(1000,'Ashwin Sekar','Trichy');
INSERT INTO customer VALUES(1001,'Tharani Priya','Chennai');
INSERT INTO customer VALUES(1002,'Deepika Ram','Bangalore');
INSERT INTO customer VALUES(1003,'Priya Anand','Hyderabad');
INSERT INTO customer VALUES(1004,'Sakshi Amit','Pune');

CREATE TABLE transaction_tbl(
transid INT,
custid INT,
prodname VARCHAR(100),
amount INT
);

INSERT INTO transaction_tbl VALUES(1,1000,'TV',65000);
INSERT INTO transaction_tbl VALUES(2,1001,'LAPTOP',75000);
INSERT INTO transaction_tbl VALUES(3,1000,'MOBILE',50000);
INSERT INTO transaction_tbl VALUES(4,1002,'FRIDGE',50000);
INSERT INTO transaction_tbl VALUES(5,1000,'TV',65000);
INSERT INTO transaction_tbl VALUES(6,1002,'DEKSTOP',55000);
INSERT INTO transaction_tbl VALUES(7,1000,'SHIRT',3000);
INSERT INTO transaction_tbl VALUES(8,1003,'TABLET',25000);
INSERT INTO transaction_tbl VALUES(9,1003,'CHOCOLATE',100);
INSERT INTO transaction_tbl VALUES(10,1005,'SWEETS',2000);


SELECT * FROM CUSTOMER;
SELECT * FROM TRANSACTION_TBL;

SELECT * FROM customer c INNER JOIN transaction_tbl t ON c.custid=t.custid;

SELECT c.custname, c.city, t.prodname,t.amount FROM customer c INNER JOIN transaction_tbl t ON c.custid=t.custid;


SELECT * FROM customer c LEFT OUTER JOIN transaction_tbl t ON c.custid=t.custid;

SELECT * FROM customer c RIGHT OUTER JOIN transaction_tbl t ON c.custid=t.custid;


SELECT * FROM customer c CROSS JOIN transaction_tbl t ;


-- IF YOU BUY                       WE OFFER YOU ANY ONE OF THE FOLLOWING AS FREE
-- TV									FOREIGN TRIP
-- FRIDGE								5 DAYS OF STAY IN * HOTEL at OOTY
-- WASHING MACHINE						10% DISCOUNT OF THE PRODUCT PRICE
-- LAPTOP								BICYCLE
-- AC									INSTALLATION FREE


-- VIEW
-- VIEW is a virtual Table

SELECT * FROM EMPLOYEE;
INSERT INTO EMPLOYEE VALUES(1111,'Rajinikanth',70,'Chennai',111111,'INDIA');
DELETE FROM EMPLOYEE WHERE custid=1004;
SET sql_safe_updates=0;
CREATE VIEW cust_data AS 
SELECT fullname,location FROM EMPLOYEE WHERE location in ('Chennai','Bangalore','Hyderabad','Cochin');

SELECT * FROM cust_data;


SELECT * FROM EMPLOYEE;

CREATE VIEW high_paid_customer AS
SELECT FULLNAME, LOCATION, AMOUNT FROM EMPLOYEE ORDER BY AMOUNT DESC;

DROP VIEW high_paid_customer;

CREATE VIEW less_paid_customer AS
SELECT * FROM EMPLOYEE WHERE amount <= 25000;


SELECT * FROM high_paid_customer;

SELECT * FROM  less_paid_customer;