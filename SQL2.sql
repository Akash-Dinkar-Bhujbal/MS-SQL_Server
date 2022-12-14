USE TEST;

DROP TABLE CUSTOMERS;
CREATE TABLE CUSTOMERS (CONTACTNAME VARCHAR(30),ADDRESS VARCHAR(20),email varchar(30))
INSERT INTO CUSTOMERS VALUES('SURESH PAL','MANPADA RD','suresh@gmail.com')
INSERT INTO CUSTOMERS VALUES('HITENDRA THAKUR','BANJARA HILL','hit@hotmail.com')
INSERT INTO CUSTOMERS VALUES('ASIF KHAN','AKBAR ROAD','asif@gmail.com')
INSERT INTO CUSTOMERS VALUES('MOHAN KHANNA','GANDHINAGAR RD','mohan@ymail.com')
INSERT INTO CUSTOMERS VALUES('JOHAN','GANDHINAGAR RD','mohan@ymail.com')
SELECT * FROM CUSTOMERS;

--1. QUERY TO DISPLAY FIRST NAME
SELECT SUBSTRING(CONTACTNAME, 1, CHARINDEX(' ', CONTACTNAME)) AS 'FIRST NAME'  FROM CUSTOMERS;
--2. QUERY TO DISPLAY LAST NAME 
SELECT SUBSTRING(CONTACTNAME, CHARINDEX(' ' , CONTACTNAME), LEN(CONTACTNAME)) 'LAST NAME' FROM CUSTOMERS;
--3. DISPLAY ALL RECORDS WHOSE IS CONSISTING OF rd or road in address column
SELECT * FROM CUSTOMERS 
	WHERE ADDRESS = 
		ANY(SELECT ADDRESS FROM CUSTOMERS 
			WHERE CHARINDEX('RD', ADDRESS) > 0 OR CHARINDEX('ROAD', ADDRESS) > 0);
--4. display domainname from email address like gmail,hotmail etc
SELECT CONTACTNAME, EMAIL, SUBSTRING(EMAIL, CHARINDEX('@', EMAIL)+1, LEN(EMAIL)) AS DOMAIN_NAME FROM CUSTOMERS; 
--5. display number of employees in every domain
SELECT SUBSTRING(EMAIL, CHARINDEX('@', EMAIL)+1, LEN(EMAIL)) AS DOMAIN_NAME, COUNT(*) 'Count' FROM CUSTOMERS GROUP BY SUBSTRING(EMAIL, CHARINDEX('@', EMAIL)+1, LEN(EMAIL)) ;

--------------------------------------------------------------
DROP TABLE PRODUCT

create table product (pid int,description varchar(20))

insert into product values(1,'bread')
insert into product values(2,'sweet bread')
insert into product values(3,'PASTA')
insert into product values(4,'CRACKERS')
insert into product values(5,'CEREAL')
insert into product values(6,'Desserts')

select * from product
------------------patindex : PATTERN_INDEX
select Description from product
	  where patindex('%[b,B]read%',description) =0

select Description from product
	  where patindex('%[b,B]read%',description) >0