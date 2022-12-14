USE NELITO

DROP TABLE PERSON
CREATE TABLE PERSON(PERSON_ID INT IDENTITY, PERSON_NAME VARCHAR(100) NOT NULL)

INSERT INTO PERSON(PERSON_NAME) VALUES ('ASHISH')

SELECT * FROM PERSON

SELECT SCOPE_IDENTITY();

SELECT * FROM EMPLOYEE
-----------------------------------------------

SELECT EMPNAME + ' '+ADDRESS FROM EMPLOYEE
-----------***TYPE CASTING***-------------------

--SELECT EMPNAME+SALARY + ADDRESS FROM EMPLOYEE

SELECT EMPNAME+ ' ' + CAST(SALARY AS varchar(30)) FROM EMPLOYEE
------------------------------------------------------------------
-- DML : INSERT, UPDATE, DELETE---
------------------------------------------------------------------
--***TRIGGER***--
DROP TABLE EMP
CREATE TABLE EMP(ID INT, SALARY INT)
CREATE TRIGGER T11 ON EMP
AFTER INSERT AS
BEGIN
PRINT 'THE RECORD IS INSERTED'
END
-- **USING TRIGGER
INSERT INTO EMP VALUES(130,200)
-----------------
SELECT * FROM EMP
------------------
--***ANOTHER TRIGGER
CREATE TRIGGER T12 ON EMP
AFTER UPDATE AS
BEGIN
SELECT * FROM deleted
SELECT * FROM inserted
END
-------------------
SELECT * FROM EMP
-------------------
UPDATE EMP SET SALARY=1033 WHERE ID =110
---------------------------------------
--**T13
CREATE TRIGGER T13 ON EMP
FOR INSERT
AS
DECLARE @MPAY INT
SELECT @MPAY = SALARY FROM inserted
IF(@MPAY<1000)
BEGIN
PRINT 'SALARY MUST BE MORE THAN 1000'
ROLLBACK TRAN
END

INSERT INTO EMP VALUES(111,33)
-------------------------------------------------
SELECT * FROM EMPLOYEE
------------------------------------------------
--**T14
CREATE TRIGGER T14 ON EMPLOYEE
FOR INSERT
AS
DECLARE @ADD VARCHAR(30)
SELECT @ADD = ADDRESS FROM inserted
IF(@ADD IS NULL OR @ADD ='')
BEGIN
PRINT 'ADDRESS CAN NOT BE NULL'
ROLLBACK TRAN
END
-------------------------------------------------
INSERT INTO EMPLOYEE VALUES (106,10000, 'SUYOG',NULL,111)
-----------------------------------------------------------
--TS
CREATE TRIGGER TS ON EMP
FOR UPDATE 
AS
IF UPDATE(SALARY)--OPTIONAL
BEGIN
DECLARE @A INT
SELECT @A = AVG(SALARY) FROM EMP
IF(@A>2000)
BEGIN
PRINT 'THE AVERAGE PAY CAN NOT BE MORE THAN  2000'
ROLLBACK TRANSACTION
END
END

UPDATE EMP SET ID=1110 WHERE ID=106

UPDATE EMP SET SALARY =200000 WHERE ID=106


SELECT * FROM EMP
SELECT AVG(SALARY) FROM EMP
----------------------------------------------
SELECT * FROM EMPP
--T15

CREATE TRIGGER T15 ON EMPP
FOR INSERT
AS
DECLARE @DJ DATE
SELECT @DJ = DOJ FROM INSERTED
IF(@DJ >= GETDATE())
BEGIN
PRINT 'DOJ MUST BE SMALLER THAN PRESENT DAY'
ROLLBACK TRAN
END
----------------------------------------
INSERT INTO EMPP VALUES(104,'2022-07-22')
INSERT INTO EMPP VALUES(104,'2022-07-04')
-----------------------------------------------
----**DELETE TRIGGER---------
CREATE TRIGGER DEL1 ON EMPP
FOR DELETE
AS
BEGIN
PRINT 'DELETION ON RECORD IS NOT ALLOWED'
ROLLBACK TRAN
END
----------------------------------------
DELETE FROM EMPP
------------------------------------
DROP TRIGGER DEL1
-------------------------------------
--**DEL2
CREATE TRIGGER DEL2 ON EMPP
FOR DELETE
AS
BEGIN
DECLARE @D DATE
SELECT @D =  DOJ FROM deleted
DECLARE @X INT
SELECT @X = DATEPART(WEEKDAY, @D)
IF(@X=1)
PRINT 'SUNDAY: NOT DELETED'
ROLLBACK TRAN
END
---------
SELECT *, DATEPART(WEEKDAY, DOJ) FROM EMPP
---------------------
DELETE EMPP WHERE ID=102
----------------------------------------------
---------------***HAVING CLAUSE***---------------------
CREATE TABLE STUDENT1(NAME VARCHAR(30),PERCENTAGE INT)
INSERT INTO STUDENT1 VALUES('ISHA PATEL',98)
INSERT INTO STUDENT1 VALUES('HARSH DAS',94)
INSERT INTO STUDENT1 VALUES('RACHIT SHA',93)
INSERT INTO STUDENT1 VALUES('SUMEDHA',98)
INSERT INTO STUDENT1 VALUES('RAHIT ALI',98)

SELECT NAME,PERCENTAGE FROM STUDENT1 GROUP BY NAME,PERCENTAGE HAVING PERCENTAGE > 95

--------------------TOP-------------------------------------- USED TO SHOW TOP VALUES I.E 'N' VALUES
SELECT TOP 2 EMPNAME FROM EMPLOYEE
SELECT TOP 3* FROM EMPLOYEE
SELECT TOP 50 PERCENT * FROM EMPLOYEE  ---IT WILL SHOW HALF TABLE
-----------------------
SELECT * FROM EMPLOYEE
---------------------------
--TRUNCATE : DELETE VALUES/ROWS
--DELETE : SPECIFIC ROW/VALUE
--DROP :  DELETE STRUCTURET


----------------------------------------------------------
DROP TABLE PRODUCT1
CREATE TABLE PRODUCT1(PID INT, PRODUCT_NAME VARCHAR(20), LIST_PRICE INT)
INSERT INTO PRODUCT1 VALUES
(10,'PEN', 100),
(20,'PENCIL', 50)

SELECT * FROM PRODUCT1

DECLARE 
		@PRODUCT_NAME VARCHAR(MAX),
		@LIST_PRICE DECIMAL

------------============***CURSOR***===============-----------
DECLARE CURSOR_PRODUCT CURSOR

FOR SELECT
			PRODUCT_NAME,
			LIST_PRICE
	FROM 
			PRODUCT1;

OPEN CURSOR_PRODUCT;

FETCH NEXT FROM CURSOR_PRODUCT INTO
	@PRODUCT_NAME,
	@LIST_PRICE;

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @PRODUCT_NAME + ' ' + CAST(@LIST_PRICE AS VARCHAR);
		FETCH NEXT FROM CURSOR_PRODUCT INTO
			@PRODUCT_NAME,
			@LIST_PRICE;
	END;

CLOSE CURSOR_PRODUCT;

-------------------------------------------------------------
-- INDEX
CREATE INDEX INDEX1 ON EMPLOYEE(ID)

---------------------------------------------------------------
SELECT * FROM EMPLOYEE
-- ***VIEW : VIRTUAL TABLE***
CREATE VIEW V1 AS SELECT * FROM EMPLOYEE WHERE DEPTID = 100

SELECT * FROM V1
-- ***DESC***
SP_HELPTEXT V1
------------------------------------------------------------------------
DROP PROCEDURE MYNAME
CREATE PROCEDURE MYNAME
	@CITYNAME VARCHAR(30)
AS
BEGIN
	SELECT * FROM EMPLOYEE WHERE ADDRESS LIKE '%'+@CITYNAME+'%'
END

EXEC MYNAME'MUMBAI'

SELECT * FROM EMPLOYEE
--------------------------------------------------
CREATE TABLE MEMBER(NAME VARCHAR(20), ADDRESS VARCHAR(30))

CREATE PROCEDURE INSERTTABLE
@MEMBERNAME VARCHAR(50),
@MEMBERCITY VARCHAR(25)



--------------------------------------------
---PROCEDURE: WE NEED TO CALL
---TRIGGER : AUTOMATICALLY CALL
---FUNCTION: RETURN TYPE NEEDED
---------------------------------------------
SELECT * FROM EMPLOYEE
--------------------------------------------
--PROCEDURE DL
DROP PROCEDURE DL
CREATE PROCEDURE DL
@ID INT
AS BEGIN
DELETE FROM EMPLOYEE  WHERE ID=@ID
END

EXEC DL 105
------------------------------------------
--FUNCTION FAVG
DROP FUNCTION FAVG
CREATE FUNCTION FAVG(@NO INT)
RETURNS FLOAT
AS
BEGIN
---DECLARE @AVERAGE FLOAT =0
--SET @AVERAGE = AVG(SALARY) FROM EMPLOYEE WHERE DEPTID= @ID
RETURN (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPTID= @NO)
END

--DECLARE @A INT
--SET @A = DBO.FAVG(300)
--PRINT @A
SELECT DBO.FAVG(200)

SELECT * FROM EMPLOYEE
SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPTID = 200
-----------------------------------------------------------
CREATE TABLE SAM(ID INT, HIREDATE DATE)

INSERT INTO SAM VALUES(2,'2010/11/10')
INSERT INTO SAM VALUES(3,'2015/01/10')
INSERT INTO SAM VALUES(4,'2017/12/10')
INSERT INTO SAM VALUES(5,'2010/08/10')

CREATE FUNCTION GetEmployeeList(@hiredate date)
RETURNS TABLE
	AS
	RETURN
		SELECT * FROM SAM WHERE HIREDATE >@hiredate;

SELECT * FROM dbo.GetEmployeeList('01/01/2010')









