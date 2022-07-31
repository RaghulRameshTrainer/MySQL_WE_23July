-- INDEX

SELECT * FROM EMPLOYEE;

SHOW CREATE TABLE EMPLOYEE;

CREATE INDEX emp_idx ON EMPLOYEE(custid);
CREATE INDEX emp_idx2 ON EMPLOYEE(custid,location);

SHOW INDEXES FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE CUSTID=1005;

SHOW INDEXES FROM primarykey_tbl;

SELECT table_name, index_name 
FROM information_schema.statistics
WHERE table_name='EMPLOYEE';


-- TRANSACTION CONTROL LANGUAGE
-- COMMIT and ROLLBACK

SELECT * FROM EMPLOYEE;

START TRANSACTION;
UPDATE EMPLOYEE SET amount=100000 ;
ROLLBACK;

START TRANSACTION;
UPDATE EMPLOYEE SET amount=100000 WHERE amount=10000;
COMMIT;


-- DELETE DROP TRUNCARE

SELECT * FROM EMPLOYEE;

START TRANSACTION;
DELETE FROM EMPLOYEE WHERE location='CHENNAI';
ROLLBACK;

START TRANSACTION;
DELETE FROM EMPLOYEE WHERE location IS NULL;
ROLLBACK;

START TRANSACTION;
DELETE FROM EMPLOYEE;
ROLLBACK;

-- TRUNCATE

START TRANSACTION ;
TRUNCATE TABLE EMPLOYEE;
ROLLBACK;

-- DROP vs TRUNCATE
DROP TABLE EMPLOYEE;

SELECT * FROM CUSTOMER;
START transaction;
DROP TABLE CUSTOMER;
ROLLBACK;

-- SUB QUERY

SELECT * FROM primarykey_tbl;
SELECT * FROM foreignkey_tbl;

SELECT * FROM PRIMARYKEY_TBL WHERE custid IN (SELECT custid FROM foreignkey_tbl);

CREATE TABLE CUSTOMER(
custid INT PRIMARY KEY,
custname VARCHAR(100)
);

INSERT INTO CUSTOMER VALUES(1000,'Rajesh'),(1001,'Prakash'),(1002,'Amit'),(1003,'Apurba'),(1004,'Ankit');
SELECT * FROM CUSTOMER;

CREATE TABLE order_table(
orderid INT PRIMARY KEY,
custid INT,
productName VARCHAR(100),
amount INT,
FOREIGN KEY (custid) references CUSTOMER(custid));

INSERT INTO order_table VALUES(1,1000,'TV',65000),(2,1001,'Mobile',120000),(3,1000,'Laptop',75000);
SELECT * FROM order_table;

SELECT custid,custname FROM customer WHERE custid IN (SELECT custid FROM order_table);

SELECT custid,custname FROM customer WHERE custid IN (1000,1001);

-- INNER JOIN

SELECT distinct c.custid,c.custname FROM customer c INNER JOIN order_table o ON c.custid=o.custid;

SELECT custid,custname FROM customer WHERE custid NOT IN 
(SELECT custid FROM order_table);		

-- GROUP BY 

CREATE TABLE TRANSACTION_TABLE(
transid INT,
prodname VARCHAR(100),
amount INT,
country varchar(100)
);

INSERT INTO TRANSACTION_TABLE VALUES(1,'laptop',1000,'India'),
(2,'mobile',500,'USA'),
(3,'Dekstop',600,'Canada'),
(4,'Dekstop',500,'USA'),
(5,'TV',2000,'India'),
(6,'Tablet',500,'USA'),
(7,'TV',1000,'Canada'),
(8,'mobile',1500,'Canada'),
(9,'TV',1000,'USA');

SELECT * FROM TRANSACTION_TABLE;
SELECT SUM(amount) FROM TRANSACTION_TABLE;

SELECT country, SUM(amount) 
FROM TRANSACTION_TABLE 
WHERE country != 'USA'
GROUP BY country
HAVING SUM(amount) > 1000
ORDER BY sum(amount) DESC;

SELECT prodname, SUM(amount) 
FROM TRANSACTION_TABLE
 WHERE prodname != 'TV'
GROUP BY prodname
HAVING SUM(amount) > 100
 ORDER BY sum(amount) DESC ;
 
 SELECT country, max(amount) 
FROM TRANSACTION_TABLE 
-- WHERE country != 'USA'
GROUP BY country; 
-- HAVING SUM(amount) > 1000
-- ORDER BY sum(amount) DESC;

SELECT sum(amount) FROM TRANSACTION_TABLE;

SELECT * FROM TRANSACTION_TBL ORDER BY AMOUNT ;

-- SQL FUNCTION

--  NUMERIC FUNCTION

SELECT count(*) FROM TRANSACTION_TBL;
SELECT sum(amount) FROM TRANSACTION_TBL;
SELECT max(amount) FROM TRANSACTION_TBL;
SELECT min(amount) FROM TRANSACTION_TBL;
SELECT avg(amount) FROM TRANSACTION_TBL;

-- STRING FUNCTION
SELECT * FROM TRANSACTION_TBL;
SELECT CONCAT(custid,'-',prodname,'-',amount) proddetail FROM TRANSACTION_TBL;
SELECT CONCAT_WS('-',custid,prodname,amount) prod_info FROM TRANSACTION_TBL;
SELECT prodname, LENGTH(prodname) as length FROM TRANSACTION_TBL;
SELECT lower(prodname),amount FROM TRANSACTION_TBL;
SELECT upper(prodname),amount FROM TRANSACTION_TBL;
SELECT substr(prodname,1,5), amount FROM TRANSACTION_TBL;
SELECT LEFT(prodname,5) FROM TRANSACTION_TBL;
SELECT RIGHT(prodname,3) FROM TRANSACTION_TBL;
SELECT replace(prodname,'TV','Television') FROM TRANSACTION_TBL;
SELECT prodname, REVERSE(prodname) as reverse_name FROM TRANSACTION_TBL;
SELECT ucase(prodname)  FROM TRANSACTION_TBL;
SELECT lcase(prodname)  FROM TRANSACTION_TBL;
SELECT REPEAT(prodname,3) FROM TRANSACTION_TBL;

-- DATE TIME

SELECT curdate();
select current_date();
select current_time();
select current_timestamp();
SELECT DATE_FORMAT(curdate(),"%d/%m/%Y");
SELECT DATE_FORMAT(curdate(),"%d/%b/%Y");
SELECT DATE_FORMAT(curdate(),"%d/%b/%y");

--  DATE FORMAT
%a -> Weekday ( Sun, Mon, Tue... Sat)
%W -> Weekday fullform (Sunday, Monday... Saturday)
%b -> Month Name (Jan, Feb, Mar.... Dec)
%M -> Month in fullform(Januaryh, February.. December)
%m -> Month in numeric (1 to 12)
%c -> Numeric Month(1 to 12)
%D -> Date as 1st, 2nd, 3rd...31st
%d -> Days ( 1 to 31)
%Y -> year in 4 digit (2022)
%y -> year in 2 digit (22)
%H -> Hours (00 to 23)
%h -> 12 hrs format( 00 to 12)
%r -> AM | PM
%p -> AM | PM
%i -> Minute (00 to 59)
%S -> Seconds (00 to 59)
%j  -> Day of the year

SELECT DATE_FORMAT(curdate(),"%W");
SELECT curdate();
SELECT DATE_FORMAT(current_timestamp(),"%W, %D %M, %Y %H:%i");
SELECT DATE_FORMAT(current_timestamp(),"%j , %W, %D %M, %Y , %h:%i:%S %p") as today;


CREATE TABLE CUSTOMER_TBL(
custid INT PRIMARY KEY,
custname VARCHAR(100),
registered_date DATETIME
);
INSERT INTO CUSTOMER_TBL VALUES(1000,'Rajesh','2022-01-31 10:00'),(1001,'Prakash','2020-01-01 11:30'),(1002,'Amit','2022-07-31 17:21'),(1003,'Apurba','2022-01-01 12:12'),(1004,'Ankit','2022-07-01 10:10');

SELECT * FROM CUSTOMER_TBL;
SELECT * FROM CUSTOMER_TBL WHERE year(registered_date)='2022';
SELECT * FROM CUSTOMER_TBL WHERE year(registered_date)<'2022';
SELECT * FROM CUSTOMER_TBL WHERE year(registered_date)='2022' and month(registered_Date)='07' and day(registered_date)='31';
SELECT * FROM CUSTOMER_TBL WHERE  date(registered_date)='2022-07-31';
SELECT * FROM CUSTOMER_TBL WHERE  date(registered_date)=curdate();
SELECT * FROM CUSTOMER_TBL WHERE  hour(registered_date)='10' and minute(registered_date)='10';

-- ranking function

-- row_numbe(), rank(), dense_rank()

SELECT * FROM TRANSACTION_TABLE;

SELECT transid,prodname,amount,country,rnk FROM (
SELECT transid,prodname,amount,country, row_number() OVER (order by amount DESC) rnk FROM TRANSACTION_TABLE) tbl
WHERE rnk<=3;

SELECT transid,prodname,amount,country,rnk FROM (
SELECT transid,prodname,amount,country, row_number() OVER (partition by country order by amount DESC) rnk FROM TRANSACTION_TABLE) tbl
WHERE rnk<=2;

SELECT transid,prodname,amount,country,rnk FROM (
SELECT transid,prodname,amount,country, row_number() OVER (partition by country order by amount ) rnk FROM TRANSACTION_TABLE) tbl
WHERE rnk=1;

-- rank
-- SELECT transid,prodname,amount,country, row_number() OVER (partition by country order by amount DESC) rnk FROM TRANSACTION_TABLE;
SELECT transid,prodname,amount,country,rnk FROM (
SELECT transid,prodname,amount,country, rank() OVER ( order by amount DESC) rnk FROM TRANSACTION_TABLE) abc
WHERE rnk <= 4;

SELECT transid,prodname,amount,country, rank() OVER (partition by country order by amount DESC) rnk FROM TRANSACTION_TABLE;

-- dense_rank

SELECT transid,prodname,amount,country,rnk FROM (
SELECT transid,prodname,amount,country, dense_rank() OVER ( order by amount DESC) rnk FROM TRANSACTION_TABLE) abc
WHERE rnk <= 4;

SELECT transid,prodname,amount,country, dense_rank() OVER (partition by country order by amount DESC) rnk FROM TRANSACTION_TABLE;
