--2 SQL Queries
--2.1 SELECT
--Select all records from the Employee table.
SELECT * FROM EMPLOYEE;
--Select all records from the Employee table where last name is King.
SELECT * FROM EMPLOYEE WHERE LASTNAME = 'King';
--Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM EMPLOYEE WHERE FIRSTNAME = 'Andrew' AND REPORTSTO IS NULL;
--2.2 ORDER BY
--Select all albums in Album table and sort result set in descending order by title.
SELECT * FROM ALBUM ORDER BY TITLE DESC;
--Select first name from Customer and sort result set in ascending order by city
SELECT FIRSTNAME FROM CUSTOMER ORDER BY CITY ASC;
--2.3 INSERT INTO
--Insert two new records into Genre table 
INSERT INTO GENRE VALUES (26, 'Thrash');
INSERT INTO GENRE VALUES (27, 'Chopped and screwed');

--Insert two new records into Employee table
INSERT INTO EMPLOYEE(EMPLOYEEID, LASTNAME, FIRSTNAME) VALUES(9, 'Nowak', 'Joe');
INSERT INTO EMPLOYEE(EMPLOYEEID, LASTNAME, FIRSTNAME) VALUES(10, 'Cambell', 'Stacy');

--Insert two new records into Customer table
SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER(CUSTOMERID, FIRSTNAME, LASTNAME, EMAIL) VALUES(60, 'Max', 'Armstrong', 'armstrong@g.com');
INSERT INTO CUSTOMER(CUSTOMERID, FIRSTNAME, LASTNAME, EMAIL) VALUES(61, 'John', 'Lis', 'something@gm.com');
--2.4 UPDATE
--Update Aaron Mitchell in Customer table to Robert Walter
UPDATE CUSTOMER SET FIRSTNAME = 'Robert', LASTNAME = 'Walter' WHERE CUSTOMERID = 32;
--Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
SELECT * FROM ARTIST ORDER BY NAME DESC;
UPDATE ARTIST SET NAME = 'CCR' WHERE ARTISTID = 76;
--2.5 LIKE
--Select all invoices with a billing address like “T%” 
SELECT * FROM INVOICE;
SELECT * FROM INVOICE WHERE BILLINGADDRESS LIKE 'T%';
--2.6 BETWEEN
--Select all invoices that have a total between 15 and 50
SELECT * FROM INVOICE WHERE TOTAL > 14 AND TOTAL < 51;
--Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM EMPLOYEE
WHERE HIREDATE > TO_DATE('2003-06-01 00:00:00','yyyy-mm-dd hh24:mi:ss') 
AND HIREDATE < TO_DATE('2004-03-01 00:00:00','yyyy-mm-dd hh24:mi:ss');
--2.7 DELETE
--Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
SELECT * FROM CUSTOMER;

--3.1 System Defined Functions
--Create a function that returns the current time.
CREATE OR REPLACE FUNCTION RETURN_TIME
RETURN TIMESTAMP
IS CURRENTTIME TIMESTAMP;
BEGIN
    SELECT CURRENT_TIMESTAMP(8)+0 INTO CURRENTTIME FROM DUAL;
    RETURN CURRENTTIME;
END;
/
SELECT RETURN_TIME() FROM DUAL;
--create a function that returns the length of name in MEDIATYPE table
CREATE OR REPLACE FUNCTION LENGTH_OF_NAME
RETURN NUMBER
IS LENGHTN NUMBER;
BEGIN
    SELECT LENGTH(NAME) INTO LENGHTN FROM MEDIATYPE WHERE MEDIATYPEID = 1;
    RETURN LENGHTN;
END;
/
SELECT LENGTH_OF_NAME() FROM DUAL;
--3.2 System Defined Aggregate Functions
--Create a function that returns the average total of all invoices
CREATE OR REPLACE FUNCTION AVG_OF_INVOICES
RETURN NUMBER
IS AVG1 NUMBER;
BEGIN
    SELECT AVG(TOTAL) INTO AVG1 FROM INVOICE;
    RETURN AVG1;
END;
/
SELECT AVG_OF_INVOICES() FROM DUAL;
--Create a function that returns the most expensive track
CREATE OR REPLACE FUNCTION MOST_EXPENSIVE
RETURN NUMBER
IS MAXCOST NUMBER;
BEGIN
    SELECT MAX(UNITPRICE) INTO MAXCOST FROM TRACK;
    RETURN MAXCOST;
END;
/
SELECT MOST_EXPENSIVE() FROM DUAL;
--3.3 User Defined Scalar Functions
--Create a function that returns the average price of invoiceline items in the invoiceline table
CREATE OR REPLACE FUNCTION AVG_PRICE_INVOICELINE
RETURN NUMBER
IS AVG_IN_LINE NUMBER;
BEGIN
    SELECT AVG(UNITPRICE) INTO AVG_IN_LINE FROM INVOICELINE;
    RETURN AVG_IN_LINE;
END;
/
SELECT AVG_PRICE_INVOICELINE() FROM DUAL;
--3.4 User Defined Table Valued Functions
SELECT * FROM EMPLOYEE WHERE BIRTHDATE > TO_DATE('1968-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'); 
--SELECT EMP_BORN_AFTER() FROM DUAL;
--4.0 Stored Procedures
--4.1 Basic Stored Procedure
--Create a stored procedure that selects the first and last names of all the employees.
--4.2 Stored Procedure Input Parameters
--Create a stored procedure that updates the personal information of an employee.
--Create a stored procedure that returns the managers of an employee.
--4.3 Stored Procedure Output Parameters
--Create a stored procedure that returns the name and company of a customer.

--5.0 Transactions
--Create a transaction that given a invoiceId will delete that invoice (There may be constraints that rely on this, find out how to resolve them).

--6.0 Triggers
--6.1 AFTER/FOR
--Create an after insert trigger on the employee table fired after a new record is inserted into the table.
--Create an after update trigger on the album table that fires after a row is inserted in the table
--Create an after delete trigger on the customer table that fires after a row is deleted from the table.

--7.1 INNER
--Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT CUSTOMER.FIRSTNAME, CUSTOMER.LASTNAME, INVOICE.INVOICEID FROM CUSTOMER INNER JOIN INVOICE ON CUSTOMER.CUSTOMERID = INVOICE.CUSTOMERID;
--7.2 OUTER
--Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT CUSTOMER.CUSTOMERID, CUSTOMER.FIRSTNAME, CUSTOMER.LASTNAME, INVOICE.INVOICEID, INVOICE.TOTAL
FROM CUSTOMER OUTER JOIN INVOICE ON CUSTOMER.CUSTOMERID = INVOICE.CUSTOMERID;
--7.3 RIGHT
--Create a right join that joins album and artist specifying artist name and title.
SELECT ARTIST.NAME, ALBUM.TITLE FROM ALBUM RIGHT JOIN ARTIST ON ALBUM.ARTISTID = ARTIST.ARTISTID;
--7.4 CROSS
--Create a cross join that joins album and artist and sorts by artist name in ascending order.
SELECT ALBUM.TITLE, ARTIST.NAME FROM ALBUM CROSS JOIN ARTIST ON ALBUM.ARTISTID = ARTIST.ARTISTID ORDER BY ARTIST.NAME DESC;
--7.5 SELF
--Perform a self-join on the employee table, joining on the reportsto column.
--SELECT a.column_name, b.column_name... 
--FROM table1 a, table1 b 
--WHERE a.common_filed = b.common_field;
SELECT 