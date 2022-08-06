CREATE TABLE CUSTOMER( id INTEGER, name VARCHAR2(100), age INTEGER, city VARCHAR2(100) );

 INSERT INTO CUSTOMER VALUES(100,'Ram Shankar',35,'Chennai'); INSERT INTO CUSTOMER VALUES(102,'Bala Murugan',30,'Banaglore'); INSERT INTO CUSTOMER VALUES(103,'Prabhakaran',25,'Hyderabad'); INSERT INTO CUSTOMER VALUES(104,'Arun Vetri Maran',40,'Pune'); INSERT INTO CUSTOMER VALUES(105,'Shivani',50,'Delhi');

INSERT INTO CUSTOMER VALUES(100,'Ram Shankar',35,'Chennai');

INSERT INTO CUSTOMER VALUES(102,'Bala Murugan',30,'Banaglore');

INSERT INTO CUSTOMER VALUES(103,'Prabhakaran',25,'Hyderabad');

INSERT INTO CUSTOMER VALUES(104,'Arun Vetri Maran',40,'Pune');

INSERT INTO CUSTOMER VALUES(105,'Shivani',50,'Delhi');

SELECT * FROM CUSTOMER;

DECLARE     c_id INTEGER;     c_name VARCHAR2(100);     c_age INTEGER;     c_city VARCHAR2(100);     PROCEDURE addCustomer(cust_id IN INTEGER, cust_name IN VARCHAR2, cust_age IN INTEGER, cust_city IN VARCHAR2) IS     BEGIN         INSERT INTO CUSTOMER VALUES(cust_id, cust_name, cust_age, cust_ciy);     END;     BEGIN         c_id := 101;         c_name := 'Harshavarthini';         c_age := 7;         c_city := 'Trichy';         addCustomer(c_id, c_name, c_age, c_city);         -- addCustomer(1000,'ABC',100,'INDIA');     END;     /
/

 DECLARE     c_id INTEGER;     c_name VARCHAR2(100);     c_age INTEGER;     c_city VARCHAR2(100);     PROCEDURE addCustomer(cust_id IN INTEGER, cust_name IN VARCHAR2, cust_age IN INTEGER, cust_city IN VARCHAR2) AS     BEGIN         INSERT INTO CUSTOMER VALUES(cust_id, cust_name, cust_age, cust_ciy);     END;     BEGIN         c_id := 101;         c_name := 'Harshavarthini';         c_age := 7;         c_city := 'Trichy';         addCustomer(c_id, c_name, c_age, c_city);         -- addCustomer(1000,'ABC',100,'INDIA');     END;     /
/

 DECLARE     c_id INTEGER;     c_name VARCHAR2(100);     c_age INTEGER;     c_city VARCHAR2(100);     PROCEDURE addCustomer(cust_id IN INTEGER, cust_name IN VARCHAR2, cust_age IN INTEGER, cust_city IN VARCHAR2) IS     BEGIN         INSERT INTO CUSTOMER VALUES(1000,'ABC',100,'INDIA');     END;     BEGIN         c_id := 101;         c_name := 'Harshavarthini';         c_age := 7;         c_city := 'Trichy';         addCustomer(c_id, c_name, c_age, c_city);         -- addCustomer(1000,'ABC',100,'INDIA');     END;     /
/

DECLARE     c_id INTEGER := 101;     c_name VARCHAR2(100) := 'Harshavarthini';     c_age INTEGER := 7;     c_city VARCHAR2(100) := 'Trichy';     PROCEDURE addCustomer(cust_id IN INTEGER, cust_name IN VARCHAR2, cust_age IN INTEGER, cust_city IN VARCHAR2) IS     BEGIN         INSERT INTO CUSTOMER VALUES(cust_id, cust_name, cust_age, cust_ciy);     END;     BEGIN         -- c_id := 101;         -- c_name := 'Harshavarthini';         -- c_age := 7;         -- c_city := 'Trichy';         addCustomer(c_id, c_name, c_age, c_city);         -- addCustomer(1000,'ABC',100,'INDIA');     END;     /
/

DECLARE     cid INTEGER;     cname VARCHAR2(100);     cage INTEGER;     ccity VARCHAR2(100);     PROCEDURE addNewCustomer(cust_id IN INTEGER, cust_name IN VARCHAR2, cust_age IN INTEGER, cust_city IN VARCHAR2) IS     BEGIN         INSERT INTO CUSTOMER VALUES(cust_id, cust_name, cust_age, cust_city);         dbms_output.put_line('The customer added successfully!');     END;          BEGIN         cid := 101;         cname := 'Harsha';         cage := 7;         ccity := 'Trichy';         addNewCustomer(cid, cname,cage,ccity);     END;     /
/

SELECT * FROM CUSTOMER;

DECLARE 
    c_id INTEGER; 
    c_name VARCHAR2(100); 
    c_age INTEGER; 
    c_city VARCHAR2(100); 
    CURSOR cust_data IS 
        SELECT id, name, age, city FROM CUSTOMER; 
    BEGIN 
        OPEN cust_data; 
        LOOP 
        FETCH cust_data INTO c_id, c_name, c_age, c_city; 
        EXIT WHEN cust_data%NOTFOUNT; 
        dbms_output.put_line(c_id || ',' ||c_name||','||c_age||','||c_city); 
        END LOOP; 
    END; 
/

    / 


DECLARE 
    c_id INTEGER; 
    c_name VARCHAR2(100); 
    c_age INTEGER; 
    c_city VARCHAR2(100); 
    CURSOR cust_data IS 
        SELECT id, name, age, city FROM CUSTOMER; 
    BEGIN 
        OPEN cust_data; 
        LOOP 
        FETCH cust_data INTO c_id, c_name, c_age, c_city; 
        EXIT WHEN cust_data%NOTFOUND; 
        dbms_output.put_line(c_id || ',' ||c_name||','||c_age||','||c_city); 
        END LOOP; 
    END; 
/

    /


DECLARE 
    c_id INTEGER := 105; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    -- EXCEPTION 
    --     WHEN no_data_found THEN 
    --         dbms_output.put_line('No records found for customer id 106'); 
             
    dbms_output.put_line('I am at the end of the block') 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    -- EXCEPTION 
    --     WHEN no_data_found THEN 
    --         dbms_output.put_line('No records found for customer id 106'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No records found for customer id 106'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No records found for customer id 106'); 
        WHEN others THEN 
            dbms_output.put_line('New error revceived !'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No records found for customer id 106'); 
            EXIT; 
        WHEN others THEN 
            dbms_output.put_line('New error revceived !'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No records found for customer id 106'); 
        LOOP 
            EXIT; 
        END LOOP; 
        WHEN others THEN 
            dbms_output.put_line('New error revceived !'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    -- EXCEPTION 
    --     WHEN no_data_found THEN 
    --         dbms_output.put_line('No records found for customer id 106'); 
    --     WHEN others THEN 
    --         dbms_output.put_line('New error revceived !'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 106; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No records found for customer id 106'); 
        WHEN others THEN 
            dbms_output.put_line('New error revceived !'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 100; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No records found for customer id 106'); 
        WHEN others THEN 
            dbms_output.put_line('New error revceived !'); 
             
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

DECLARE 
    c_id INTEGER := 100; 
    c_name VARCHAR2(100); 
    c_city VARCHAR2(100); 
BEGIN 
    SELECT name, city INTO c_name, c_city FROM CUSTOMER WHERE id=c_id; 
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name || ' City : ' || c_city); 
     
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No records found for customer id 106'); 
        WHEN others THEN 
            dbms_output.put_line('New error revceived !'); 
             
     
    dbms_output.put_line('I am at the end of the block'); 
END; 
/

CREATE OR REPLACE FUNCTION totalCustomers 
RETURN number IS 
    total number(1) := 0; 
BEGIN 
    SELECT count(*) INTO total 
    FROM CUSTOMER; 
     
    RETURN total 
END; 
/

CREATE OR REPLACE FUNCTION totalCustomers 
RETURN number IS 
    total number(1) := 0; 
BEGIN 
    SELECT count(*) INTO total 
    FROM CUSTOMER; 
     
    RETURN total; 
END; 
/

DECLARE 
    c number(1); 
BEGIN 
    c := totalCustomers(); 
    dbms_output.put_line('Total number of customers :' || c); 
END; 
/

DECLARE 
    cid INTEGER; 
    cage INTEGER; 
    FUNCTION getAge(c_id IN INTEGER) 
    RETURN INTEGER IS 
        a INTEGER; 
    BEGIN 
        SELECT age INTO a FROM CUSTOMER WHERE id=c_id; 
         
        RETURN a; 
    END; 
    BEGIN 
        cid := 102; 
        cage := getAge(cid); 
        dbms_output.put_line('Customer Age is :' || cust_age); 
    END; 
/

    /


DECLARE 
    cid INTEGER; 
    cage INTEGER; 
    FUNCTION getAge(c_id IN INTEGER) 
    RETURN INTEGER IS 
        a INTEGER; 
    BEGIN 
        SELECT age INTO a FROM CUSTOMER WHERE id=c_id; 
         
        RETURN a; 
    END; 
    BEGIN 
        cid := 102; 
        cage := getAge(cid); 
        dbms_output.put_line('Customer Age is :' || cage); 
    END; 
/

    /


DECLARE 
    cid INTEGER; 
    cage INTEGER; 
    FUNCTION getAge(c_id IN INTEGER) 
    RETURN INTEGER IS 
        a INTEGER; 
    BEGIN 
        SELECT age INTO a FROM CUSTOMER WHERE id=c_id; 
         
        RETURN a; 
    END; 
    BEGIN 
        cid := 103; 
        cage := getAge(cid); 
        dbms_output.put_line('Customer Age is :' || cage); 
    END; 
/

    /


CREATE OR REPLACE FUNCTION uppername(n IN VARCHAR2) 
RETURN VARCHAR2 IS 
    uname VARCHAR2(100); 
BEGIN 
    uname=upper(n); 
    RETURN uname; 
END; 
/

CREATE OR REPLACE FUNCTION uppername(n IN VARCHAR2) 
RETURN VARCHAR2 IS 
    uname VARCHAR2(100); 
BEGIN 
    uname := upper(n); 
    RETURN uname; 
END; 
/

SELECT id, name, age, city FROM CUSTOMER;

SELECT id, uppername(name), age, city FROM CUSTOMER;

CREATE OR REPLACE FUNCTION nextAge(a IN INTEGER) 
RETURN number IS 
    n_age INTEGER; 
BEGIN 
    n_age := a + 1; 
END; 
/

SELECT id, uppername(name), age, city, nextAge(age) as NextAge FROM CUSTOMER;

CREATE OR REPLACE FUNCTION nextAge(a IN INTEGER) 
RETURN number IS 
    n_age INTEGER; 
BEGIN 
    n_age := a + 1; 
     
    RETURN n_age 
END; 
/

CREATE OR REPLACE FUNCTION nextAge(a IN INTEGER) 
RETURN number IS 
    n_age INTEGER; 
BEGIN 
    n_age := a + 1; 
     
    RETURN n_age; 
END; 
/

SELECT id, uppername(name), age, city, nextAge(age) as NextAge FROM CUSTOMER;

SELECT id, uppername(name), age as curAge, city, nextAge(age) as NextAge FROM CUSTOMER;

CREATE TABLE ALUMNI( 
id INTEGER, 
name VARCHAR2(100), 
age INTEGER, 
city VARCHAR2(100) 
);

SELECT * FROM ALUMNI;

CREATE OR REPLACE TRIGGER backup_customer 
BEFORE DELETE ON CUSTOMER 
FOR EACH ROW 
BEGIN 
  INSERT INTO ALUMNI VALUES(:OLD.id,:OLD.name,:OLD.age,:OLD.city); 
END; 
/

SELECT * FROM ALUMNI;

DELETE FROM CUSTOMER WHERE id=101;

SELECT * FROM ALUMNI;

CREATE OR REPLACE TRIGGER customer_age 
BEFORE UPDATE ON CUSTOMER 
FOR EACH ROW 
DECLARE 
    age_diff INTEGER; 
BEGIN 
    age_diff := :NEW.age - :OLD.age; 
    dbms_output.put_line(' OLD AGE IS :' ||  :OLD.age); 
    dbms_output.put_line(' NEW AGE IS :' ||  :NEW.age); 
    dbms_output.put_line(' AGE DIFF IS :' || age_diff); 
END; 
/

UPDATE CUSTOMER SET age=100 WHERE ID=103;

