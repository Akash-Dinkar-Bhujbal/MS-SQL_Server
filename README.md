# MS-SQL_Server
You can learn deeply SQL in this Repository 

## DAY 1
- CREATE/ USE/ DROP DATABASE
- CREATE/ DISPLAY/ DROP TABLE
- INSERT/ UPDATE DATA
- ALTER TABLE/ ADD COLUMN 
- IS/ NOT OPERATORS
- AND/ OR OPERATORS
- ALIAS NAME
</BR>

- PRIMARY KEY/ UNIQUE/ IDENTITY 
- FOREIGN KEY/ REFERENCES
- COMPOSITE PRIMARY KEY
</BR>

- DESC/ EXEC sp_help 'dbo.TableName'
</BR>

- SUM/ AVG/ MAX/ COUNT FUNCTION 
</BR>

- GROUP BY CLAUSE
- ORDER BY CLAUSE
</BR>

## DAY 2
- SUB QUERY [ALL:AND | ANY:OR]
- INNER JOIN
- LEFT OUTER JOIN/ RIGHT OUTER JOIN
- SELF JOIN
- CROSS JOIN
</BR>

- Practice: STRING FUNCTIONS 

## DAY 3
- SUBSTRING FUNCTION
- CHARINDEX FUNCTION
- PATINDEX FUNCTION
- CHARINDEX FUNCTION
- LEN FUNCTION
- SOUNDEX FUNCTION
- DIFFERENCE FUNCTION
### USER DEFINED PROCEDURE
- SWITCH CASE
- WHILE LOOP
- TRY CATCH
</BR>

- PROCEDURE WITHOUT PARAMETER
- PROCEDURE WITH PARAMETER
- PROCEDURE OF OUTPUT PARAMETER

### USER DEFINED FUNCTION
- FUNCTION RETURNS A TABLE

### USER DEFINED TRIGGER

### DATE & TIME PRI DEFINED FUNCTIONS

## DAY 4
- TYPE CASTING
- trigger
- HAVING CLAUS 
- TOP
- CURSOR
- INDEX
- VIEW
- procedure
- function

## SQL 1 
1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
3. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
4. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
5. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
6. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
7. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
8. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. 
A space char should separate them.
9. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
10. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
11. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
12. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”
13. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
14. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
15. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

## SQL 2
1. QUERY TO DISPLAY FIRST NAME
2. QUERY TO DISPLAY LAST NAME 
3. DISPLAY ALL RECORDS WHOSE IS CONSISTING OF rd or road in address column
4. display domainname from email address like gmail,hotmail etc
5. display number of employees in every domain


## SQL 3
1. make a procedure in sql ,which will input 1 parameter OF integer type AND ANOTHER OF VARCHAR(20) and INSERT RECORD IN EMPLOYEE TABLE(COLUMNS ARE ID AND NAME) 
2. make a procedure in sql which will take 2 parameter 1 input integer type  and another output  varchar type we will pass id and input parameter and it must returns name as ouptut paramter 
3. write a trigger in sql which willfor insert if the name is blank and salary is less than 10000 then It must NOT allow to inserT the record in the table and display appropriate message 




## NOTE:
- TRUNCATE : DELETE VALUES/ROWS
- DELETE : SPECIFIC ROW/VALUE
- DROP :  DELETE STRUCTURET
</BR>

-	Procedure : use for crud operation, may or may not return/ output
-	Function: must return / use for anything
-	Trigger: use for apply condition on insert, update, delete
</BR>

- Six Operations to Order: 
1. SELECT
2. FROM
3. WHERE
4. GROUP BY
5. HAVING
6. ORDER BY



