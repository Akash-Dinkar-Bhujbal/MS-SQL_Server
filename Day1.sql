-- Comment
-- Query Pane : IDE
-- Create Database
CREATE DATABASE NELITO

-- Open Database
USE NELITO


-- Create Table
CREATE TABLE EMPLOYEE(ID INT, SALARY INT)

-- Display Records
SELECT * FROM EMPLOYEE

-- Insert Data
INSERT INTO EMPLOYEE VALUES (100,9000)
INSERT INTO EMPLOYEE VALUES (101,8000)

-- Add new Column : using ALTER***
ALTER TABLE EMPLOYEE ADD EMPNAME VARCHAR(20)

-- Modify data : using UPDATE***
UPDATE EMPLOYEE SET EMPNAME='AKASH'

ALTER TABLE EMPLOYEE ADD ADDRESS VARCHAR(30)

UPDATE EMPLOYEE SET ADDRESS='MUMBAI'

UPDATE EMPLOYEE SET EMPNAME='MIHIR', ADDRESS='JODHALE' WHERE ID=104

INSERT INTO EMPLOYEE VALUES (102,7000,'SAKSHI', 'NAGPUR')
INSERT INTO EMPLOYEE VALUES (103,8000,'MANAV', 'PAVAI')
INSERT INTO EMPLOYEE VALUES (104,8000,'MANAV', 'PAVAI')

SELECT * FROM EMPLOYEE WHERE ADDRESS='NAGPUR'
SELECT * FROM EMPLOYEE WHERE SALARY=8000
SELECT * FROM EMPLOYEE WHERE EMPNAME LIKE 'A%'--starts with 'A'

-- ***Delete data
DELETE FROM EMPLOYEE WHERE ADDRESS='AKASH'

SELECT * FROM EMPLOYEE WHERE EMPNAME LIKE '%I'--ends with 'I'

SELECT * FROM EMPLOYEE WHERE EMPNAME LIKE 'M____'--starts with 'M' and 4 characters more

--Insert selected Columns
INSERT INTO EMPLOYEE VALUES (105,Null,Null, 'Thane')
INSERT INTO EMPLOYEE(ID) VALUES(106)

-- Delete Table
DROP TABLE EMPLOYEE

-- Delete Database
DROP DATABASE NELITO

-- ***IS Operator
SELECT * FROM EMPLOYEE WHERE SALARY IS NULL

-- ***NOT Operator
SELECT * FROM EMPLOYEE WHERE SALARY IS NOT NULL

UPDATE EMPLOYEE SET ID=900, ADDRESS='NERUL', SALARY=9000 WHERE NAME='SAKSHI'

-- ***AND Operator
SELECT * FROM EMPLOYEE SALARY >7000 AND NAME LIKE 'M%'
-- ***OR Operator
SELECT * FROM EMPLOYEE SALARY >7000 OR NAME LIKE 'M%'

-- ***Alias Name
SELECT SALARY AS EMP_SALARY FROM EMPLOYEE

SELECT SALARY EMP_SALARY FROM EMPLOYEE

SELECT SALARY 'Employee Salary' FROM EMPLOYEE

SELECT SALARY 'Employee Salary', NAME EMP_NAME FROM EMPLOYEE
--==================================================================
-- ***PRIMARY KEY***UNIQUE***IDENTITY***
--CREATE TABLE TEST(ID INT PRIMARY KEY, SALARY INT)
INSERT INTO TEST VALUES (10,2000)

CREATE TABLE TEST(ID INT UNIQUE, SALARY INT)
INSERT INTO TEST VALUES (NULL,2000)

CREATE TABLE TEST(ID INT IDENTITY, SALARY INT) --PK
CREATE TABLE TEST(ID INT IDENTITY(1000,100), SALARY INT)

SELECT * FROM TEST
DROP TABLE TEST

CREATE TABLE DEPTMASTER (DEPTID INT PRIMARY KEY, DEPTNAME VARCHAR(30))

-- CREATE TABLE EMPMASTER (ID INT, SALARY INT, DEPTID INT REFERENCES DEPTMASTER(DEPTID))

-- ***REFERNCIAL INTEGRITY : ON DELETE, UPDATE CASCADE***
-- CREATE TABLE EMPMASTER (ID INT, SALARY INT, DEPTID INT REFERENCES DEPTMASTER(DEPTID) ON DELETE CASCADE)
CREATE TABLE EMPMASTER (ID INT, SALARY INT, DEPTID INT REFERENCES DEPTMASTER(DEPTID) ON UPDATE CASCADE)

INSERT INTO DEPTMASTER VALUES (100,'SALES'),(200,'PURCHASE'),(300,'PROGRAMMING'),(400,'ACCOUNTS')

SELECT * FROM DEPTMASTER

SELECT * FROM EMPMASTER

INSERT INTO EMPMASTER VALUES (16,5000,300)

DELETE FROM DEPTMASTER WHERE DEPTID=100

UPDATE DEPTMASTER SET DEPTID=500 WHERE DEPTID=100


DROP TABLE EMPMASTER

DROP TABLE DEPTMASTER

CREATE TABLE SAMPLE (ID INT, NAME VARCHAR(20) NOT NULL)

INSERT INTO SAMPLE VALUES (20, NULL)

SELECT * FROM SAMPLE

CREATE TABLE SAMPLE1(ID INT, COMPANYNAME VARCHAR(50) DEFAULT 'NELITO SOFTWARE COMPANY LTD AIROLI')

INSERT INTO SAMPLE1 VALUES (101,DEFAULT),(102,'AXIS BANK')

SELECT * FROM SAMPLE1

CREATE TABLE DEMO(Age int check(Age between 18 AND 24))

INSERT INTO DEMO1 VALUES(20)

SELECT * FROM DEMO1


CREATE TABLE DEMO3(Age int check(18>AGE))

-- ***Composite Primary***
CREATE TABLE DEMO2(NAME VARCHAR(20), MAIL VARCHAR(30), SALARY INT, PRIMARY KEY(NAME,MAIL))

INSERT INTO DEMO2 VALUES('AKASH BHUJBAL', 'AKASH.BHUJBAL@NELITO.COM', 8000)
INSERT INTO DEMO2 VALUES('AKASH BHUJBAL', 'AKASH.BHUJBAL@KGCE.EDU.IN', 9000)
INSERT INTO DEMO2 VALUES('AKASH BHUJBAL', 'AKASHBHUJBAL97@GMAIL.COM', 9000)

INSERT INTO DEMO2 VALUES('','', 10000)
INSERT INTO DEMO2 VALUES('','a', 22000)
INSERT INTO DEMO2 VALUES('xxx',NULL, 10000)
INSERT INTO DEMO2 VALUES(NULL,'xxx', 22000)


DROP TABLE DEMO2

SELECT * FROM DEMO2
--=========================================================================================
--***** Display Table Structure***DESCRIBE TABLE*****
--**************************************************
EXEC sp_help 'dbo.EMPLOYEE';  

SELECT * FROM EMPLOYEE

ALTER TABLE EMPLOYEE ADD DEPTID INT

UPDATE EMPLOYEE SET DEPTID =100 WHERE ID=100 OR ID=102

UPDATE EMPLOYEE SET DEPTID =200 WHERE ID=101 OR ID=103

UPDATE EMPLOYEE SET DEPTID =100 WHERE ID=104
-------------------------------------------------------------
-- ***SUM : It is use for doing the addition  of a particular column values

SELECT SUM(SALARY) FROM EMPLOYEE

SELECT SUM(SALARY) TOTALSALARY FROM EMPLOYEE
--------------------------------------------------------------
-- ***AVG : Used for finding the average of particular column
SELECT AVG(SALARY) AVRAGESALARY FROM EMPLOYEE
--------------------------------------------------------------
-- ***MIN : Used for find the minimum value of a column
SELECT MIN(SALARY) MINIMUMSALARY FROM EMPLOYEE
--------------------------------------------------------------
-- ***MAX : Used for find the maximum value of a column
SELECT MAX(SALARY) MAXIMUMSALARY FROM EMPLOYEE
--------------------------------------------------------------
-- ***COUNT : Used for find the count value of a column
SELECT COUNT(SALARY) SALARYCOUNT FROM EMPLOYEE
--------------------------------------------------------------
-- ***GROUP BY
SELECT SUM(SALARY) FROM  EMPLOYEE GROUP BY DEPTID

SELECT DEPTID, SUM(SALARY) AS SUM FROM  EMPLOYEE GROUP BY DEPTID

-- SELECT ID, SUM(SALARY) AS SUM FROM  EMPLOYEE GROUP BY DEPTID -- INVALID
---------------------------------------------------------------
-- ***ORDER BY
SELECT * FROM EMPLOYEE ORDER BY SALARY 

SELECT * FROM EMPLOYEE ORDER BY SALARY DESC
