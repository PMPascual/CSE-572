-- execute the following SQL script to create tables for HR schema.
-- save script to createHRdb.sql with your name in the first comment lines.
--

-- Your name: Phillip Pascual 
-- ID:  005869470

DROP TABLE Department CASCADE CONSTRAINTS;
CREATE TABLE Department (
	Dnumber	INT,
	Dname   VARCHAR2(15) UNIQUE NOT NULL,
	Mgr_SSN CHAR(9),
	Mgr_startDate DATE,
	CONSTRAINTS Department_PK PRIMARY KEY (Dnumber)
);



DROP TABLE Employee CASCADE CONSTRAINTS;
CREATE TABLE Employee (
	SSN	CHAR(9),	
	Fname VARCHAR2(15) NOT NULL,
	Minit CHAR(1),
    Lname VARCHAR2(15) NOT NULL,
    Bdate DATE NOT NULL,
    Address VARCHAR2(30),
	Sex   CHAR(1),
	Salary NUMBER(10,2) NOT NULL,
	super_SSN CHAR(9),
	Dno  INT,
    CONSTRAINTS Employee_PK PRIMARY KEY(SSN),
	CONSTRAINTS Employee_Sex_CK CHECK (Sex IN ('F','M'))
);


ALTER TABLE Employee
	ADD CONSTRAINTS Employee_Dno_FK FOREIGN KEY (Dno) REFERENCES Department(Dnumber)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Employee
	ADD CONSTRAINTS Employee_super_SSN_FK FOREIGN KEY (super_SSN) REFERENCES Employee(SSN)
	DEFERRABLE INITIALLY IMMEDIATE;
	
ALTER TABLE Department
	ADD CONSTRAINTS Department_Mgr_SSN_FK FOREIGN KEY (Mgr_SSN) REFERENCES Employee(SSN)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;
	

DROP TABLE Dept_Locations CASCADE CONSTRAINTS;
CREATE TABLE Dept_Locations(
	Dnumber INT,
	Dlocation VARCHAR2(20),
	CONSTRAINTS Dept_Locations_PK PRIMARY KEY (Dnumber)
);

ALTER TABLE Dept_Locations
	ADD CONSTRAINTS Dept_Locations_Dnumber_FK FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

DROP TABLE Project CASCADE CONSTRAINTS;
CREATE TABLE Project(
	Pnumber INT,
	Pname	 VARCHAR2(15) NOT NULL,
	Plocation VARCHAR2(20) NOT NULL,
	Dnumber  INT,
	CONSTRAINTS Project_PK PRIMARY KEY (Pnumber)
);

ALTER TABLE Project
	ADD CONSTRAINTS Project_Dnumber_FK FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
	DEFERRABLE INITIALLY IMMEDIATE;


DROP TABLE Work_ons CASCADE CONSTRAINTS;
CREATE TABLE Work_ons(
	Essn	CHAR(9),
    Pno		INT,
	Hours	NUMBER,
	CONSTRAINTS Work_ons_PK PRIMARY KEY (Essn,Pno)
);


ALTER TABLE Work_ons
	ADD CONSTRAINTS Work_ons_Essn_FK FOREIGN KEY (Essn) REFERENCES Employee(SSN)
	ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Work_ons
	ADD CONSTRAINTS Work_ons_FK FOREIGN KEY (Pno) REFERENCES Project(Pnumber)
	ON DELETE CASCADE  DEFERRABLE INITIALLY IMMEDIATE;
	
	

DROP TABLE Dependent CASCADE CONSTRAINTS;
CREATE TABLE Dependent(
	Essn CHAR(9),
	Dependent_name VARCHAR2(15),
	Sex CHAR(1),
	Bdate DATE,
	RelationShip VARCHAR2(20),
	CONSTRAINTS Dependent_UK UNIQUE(Essn,Dependent_name)
);

ALTER TABLE Dependent
	ADD CONSTRAINTS Dependent_SSN_FK FOREIGN KEY (Essn) REFERENCES Employee(SSN)
	ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

	
