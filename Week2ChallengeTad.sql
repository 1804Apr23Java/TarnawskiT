--TABLE CREATION

--Create a database with two tables:
--EMPLOYEE
--Columns: EMPLOYEE_ID, EMP_FIRSTNAME, EMP_LASTNAME, DEPARTMENT_ID, SALARY, EMP_EMAIL
--DEPARTMENT:
--Columns: DEPARTMENT_ID, DEPARTMENT_NAME

/*******************************************************************************
   Create database
********************************************************************************/
--CREATE USER challenge2
--IDENTIFIED BY p4ssw0rd
--DEFAULT TABLESPACE users
--TEMPORARY TABLESPACE temp
--QUOTA 10M ON users;
--
--GRANT connect to challenge2;
--GRANT resource to challenge2;
--GRANT create session TO challenge2;
--GRANT create table TO challenge2;
--GRANT create view TO challenge2;
--
--
--conn challenge2/p4ssw0rd

CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID INTEGER PRIMARY KEY,
    EMP_FIRSTNAME VARCHAR2(100),
    EMP_LASTNAME VARCHAR2(100),
    DEPARTMENT_ID INTEGER NOT NULL,
    SALARY INTEGER,
    EMP_EMAIL VARCHAR2(100)
);
/

CREATE TABLE DEPARTMENT (
    DEPARTMENT_ID INTEGER PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR2(100)
);
/

--Create a sequence and trigger to auto-generate primary key values for both tables.
CREATE SEQUENCE SQ_EMPLOYEE_PK
START WITH 1
INCREMENT BY 1;
/

CREATE SEQUENCE SQ_DEPARTMENT_PK
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TR_INSERT_EMPLOYEE
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    SELECT SQ_EMPLOYEE_PK.NEXTVAL INTO :NEW.EMPLOYEE_ID FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER TR_INSERT_DEPARTMENT
BEFORE INSERT ON DEPARTMENT
FOR EACH ROW
BEGIN
    SELECT SQ_DEPARTMENT_PK.NEXTVAL INTO :NEW.DEPARTMENT_ID FROM DUAL;
END;
/

--Insert at least six employees and three departments.
INSERT INTO EMPLOYEE(EMPLOYEE_ID, EMP_FIRSTNAME, EMP_LASTNAME, DEPARTMENT_ID, SALARY, EMP_EMAIL) 
VALUES(1, 'joe', 'hislastname', 1, 30000, 'joe@gmail.com');

INSERT INTO EMPLOYEE(EMPLOYEE_ID, EMP_FIRSTNAME, EMP_LASTNAME, DEPARTMENT_ID, SALARY, EMP_EMAIL) 
VALUES(2, 'nicole', 'herlastname', 1, 50000, 'nicole@yahoo.com');

INSERT INTO EMPLOYEE(EMPLOYEE_ID, EMP_FIRSTNAME, EMP_LASTNAME, DEPARTMENT_ID, SALARY, EMP_EMAIL) 
VALUES(3, 'mike', 'armstrong', 2, 75000, 'mike@hotmail.com');

INSERT INTO EMPLOYEE(EMPLOYEE_ID, EMP_FIRSTNAME, EMP_LASTNAME, DEPARTMENT_ID, SALARY, EMP_EMAIL) 
VALUES(4, 'john', 'man', 3, 100000, 'john@mixtapes.com');

INSERT INTO EMPLOYEE(EMPLOYEE_ID, EMP_FIRSTNAME, EMP_LASTNAME, DEPARTMENT_ID, SALARY, EMP_EMAIL) 
VALUES(4, 'susan', 'lady', 3, 120000, 'susan@aol.com');

INSERT INTO EMPLOYEE(EMPLOYEE_ID, EMP_FIRSTNAME, EMP_LASTNAME, DEPARTMENT_ID, SALARY, EMP_EMAIL) 
VALUES(4, 'bob', 'dole', 3, 110000, 'bob@aol.com');

INSERT INTO DEPARTMENT(DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES(1, 'engineering');

INSERT INTO DEPARTMENT(DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES(2, 'anthropology');

INSERT INTO DEPARTMENT(DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES(3, 'nursing');

--Create a stored procedure SP_GIVE_RAISE which takes in a DEPARTMENT_ID and increases each 
--employee's salary within the department by 10%, and returns the new average salary for the 
--department, as well as a boolean value indicating whether the ID entered corresponds to a valid department. 

CREATE OR REPLACE FUNCTION SP_GIVE_RAISE
RETURN NUMBER
IS RAISE1 NUMBER;
BEGIN
    SELECT ((SALARY*0.1)+SALARY) INTO RAISE1 FROM EMPLOYEE WHERE DEPARTMENT_ID = 2;
    RETURN RAISE1;
END;
/
SELECT SP_GIVE_RAISE() FROM DUAL;

