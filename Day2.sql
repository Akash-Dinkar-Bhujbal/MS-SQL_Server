USE NELITO

SELECT * FROM EMPLOYEE

SELECT DEPTID, COUNT(*) FROM EMPLOYEE GROUP BY DEPTID

SELECT DISTINCT DEPTID FROM EMPLOYEE 
-------------------------------------------------------------
-------------------------------------------------------------
CREATE TABLE AREATABLE(AREA VARCHAR(30), REGION INT, SALES INT)

INSERT INTO AREATABLE VALUES
('EAST',1,90),
('WEST',2,90),
('EAST',2,90),
('EAST',2,90),
('EAST',1,90),
('EAST',1,90),
('WEST',1,90),
('WEST',2,90),
('WEST',1,90),
('EAST',2,90),
('WEST',2,90)

SELECT * FROM AREATABLE ORDER BY AREA, REGION

SELECT * FROM AREATABLE ORDER BY REGION, AREA

SELECT SUM(SALES) FROM AREATABLE 

SELECT AREA, SUM(SALES) FROM AREATABLE GROUP BY AREA

SELECT AREA, REGION, SUM(SALES) FROM AREATABLE GROUP BY AREA, REGION

SELECT AREA, REGION, SUM(SALES) 'TOTAL SALE', AVG(SALES) 'AVG SALE' 
	FROM AREATABLE GROUP BY AREA, REGION

DROP TABLE AREATABLE
--==========================================================================================

SELECT MAX(SALARY) FROM EMPLOYEE

SELECT * FROM EMPLOYEE 
	WHERE SALARY = 9000

SELECT  * FROM EMPLOYEE	
	WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE)

SELECT  * FROM EMPLOYEE 
	WHERE ADDRESS = (SELECT ADDRESS FROM EMPLOYEE WHERE EMPNAME='MIHIR')

SELECT * FROM EMPLOYEE 

SELECT  * FROM EMPLOYEE 
	WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMPNAME='MIHIR')

-- ****SUB-QUERY [ALL:AND | ANY:OR]****
SELECT  * FROM EMPLOYEE 
	WHERE SALARY >= ALL(SELECT SALARY FROM EMPLOYEE WHERE EMPNAME='AMOGH' OR EMPNAME='AKASH')

SELECT  * FROM EMPLOYEE 
	WHERE SALARY >= ANY(SELECT SALARY FROM EMPLOYEE WHERE EMPNAME='AMOGH' OR EMPNAME='AKASH')
--==============================================================================--
CREATE TABLE DEPTT(DEPTID INT, DEPTNAME VARCHAR(30))

INSERT INTO DEPTT VALUES
(100, 'SALES'),
(200, 'PURCHASE'),
(300, 'ACCOUNTS'),
(400, 'PROGRAMMING')

INSERT INTO EMPLOYEE VALUES(105, 2000,'ANKIT','MUMBAI',111)

SELECT  * FROM EMPLOYEE

SELECT  * FROM DEPTT

SELECT EMPNAME, SALARY, DEPTT.DEPTID FROM EMPLOYEE, DEPTT WHERE EMPLOYEE.DEPTID=DEPTT.DEPTID
--------------------------------------------------------------------------------------------
-------------------------------joins-----------------------------------
----TYPES OF JOIN---- 
--INNER JOIN
--OUTER JOIN
  --LEFT OUTER JOIN
  --RIGHT OUTER JOIN
--SELF JOIN
--CROSS JOIN
------------------------------------------------------------------------
-- ***INNER JOIN***
SELECT EMPNAME, SALARY, Y.DEPTID FROM EMPLOYEE X, DEPTT Y WHERE X.DEPTID=Y.DEPTID

SELECT EMPNAME, SALARY, Y.DEPTID FROM EMPLOYEE X INNER JOIN DEPTT Y ON X.DEPTID=Y.DEPTID

SELECT EMPNAME, SALARY, DEPTNAME, EMPLOYEE.DEPTID, DEPTT.DEPTID FROM EMPLOYEE INNER JOIN DEPTT ON EMPLOYEE.DEPTID = DEPTT.DEPTID

-- ***LEFT OUTER JOIN***
SELECT EMPNAME, SALARY, DEPTNAME, EMPLOYEE.DEPTID, DEPTT.DEPTID FROM EMPLOYEE LEFT OUTER JOIN DEPTT ON EMPLOYEE.DEPTID = DEPTT.DEPTID

-- ***RIGHT OUTER JOIN***
SELECT EMPNAME, SALARY, DEPTNAME, EMPLOYEE.DEPTID, DEPTT.DEPTID FROM EMPLOYEE RIGHT OUTER JOIN DEPTT ON EMPLOYEE.DEPTID = DEPTT.DEPTID

-- ***FULL OUTER JOIN***
SELECT EMPNAME, SALARY, DEPTNAME, EMPLOYEE.DEPTID, DEPTT.DEPTID FROM EMPLOYEE FULL OUTER JOIN DEPTT ON EMPLOYEE.DEPTID = DEPTT.DEPTID

DROP TABLE DEPTT

-- ***SELF JOIN***
CREATE TABLE SELF1 (EMPID INT, NAME VARCHAR(30), REPORTING INT)

INSERT INTO SELF1 VALUES
(100, 'ANIKET', 10),
(200, 'MIHIR', 20),
(300, 'SUHAS', 10),
(400, 'MOHAN', 20),
(500, 'RAJ', 10),
(10, 'VINAYAK', NULL),
(20, 'MAYA', NULL)

SELECT * FROM SELF1

SELECT Y.NAME EMP, X.NAME MANAGER FROM SELF1 X, SELF1 Y WHERE X.EMPID = Y.REPORTING

-- ***CROSS JOIN***
SELECT * FROM EMPLOYEE, DEPTT 