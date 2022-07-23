-- TYPES OF QUERY

-- DDL -> Data Definition Language
-- 	CREATE, ALTER, RENAME, DROP
-- DML -> Data Manupulation Language
-- 	INSERT, UPDATE, DELETE, TRUNCATE
-- DCL -> Data Control Language
-- 	GRANT , REVOKE
-- TCL -> Transacation Control Language
-- 		COMMINT, ROLLBACK
-- DQL -> Data Query Language
-- 	SELECT

-- Schema = Database

-- Create a Database

CREATE DATABASE IF NOT EXISTS cust;


DROP DATABASE cust;

CREATE DATABASE cust;

USE cust;

-- Create a Table

CREATE TABLE customer(
custid INT, 
fullname  VARCHAR(30),
gender CHAR(1),
age INT,
city VARCHAR(20),
amount INT
);

DESC customer;

SHOW CREATE TABLE customer;

-- LOAD THE DATA

INSERT INTO CUSTOMER VALUES(1000,'Raghul Ramesh','M',38,'Chennai',10000);
INSERT INTO CUSTOMER VALUES(1001,'Durga Devi','F',25,'Hyderabad',20000),(1002,'Bala','M',40,'Bangalore',25000),
(1003,'Venkatesh','M',40,'Pune',30000),(1004,'Ramya','F',30,'Chennai',50000);

INSERT INTO CUSTOMER(custid,fullname,gender,city,amount) VALUES(1005,'Siva','M','Chennai',30000);
INSERT INTO CUSTOMER(custid,fullname,gender,amount) VALUES(1006,'Anita','F',20000);

SELECT * FROM CUSTOMER;

SELECT city, fullname, age FROM customer;

SELECT custid,fullname,gender,age,city,amount FROM customer;
SELECT * FROM customer;

SELECT fullname,city FROM CUSTOMER;

SELECT * FROM CUSTOMER WHERE city='Chennai' AND gender='F';
SELECT * FROM CUSTOMER WHERE amount > 25000;
SELECT * FROM CUSTOMER WHERE amount <= 25000;

SELECT * FROM CUSTOMER WHERE gender='M' OR city='Chennai';
SELECT * FROM CUSTOMER WHERE (gender='M' OR city='Chennai') AND age >= 40;
SELECT * FROM CUSTOMER WHERE (gender='M' OR city='Chennai') AND age < 40;
SELECT * FROM CUSTOMER WHERE gender='M' AND city='Chennai';

SELECT * FROM CUSTOMER;
-- Update
SET sql_safe_updates=0;

UPDATE customer SET age=32 WHERE custid=1005;

UPDATE customer SET age=35, city='Pune' WHERE custid=1006;

SELECT * FROM CUSTOMER;

UPDATE customer SET city='Chennai' WHERE custid=1001;

UPDATE customer set amount=amount*2 ;
-- Data Types
-- INT 
-- CHAR(10)
-- VARCHAR(10) 
-- DECIMAL(10,2) 
-- DATE
-- DATETIME
