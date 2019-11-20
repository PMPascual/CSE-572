-- Team Name: Deal Team Six
-- CSE 572 Spring 2019
-- Project Option: The FastCabs
-- Purpose: Creation of SQL Tables
-- Author: Phillip Pascual - 005869470
-- Author: Jose Perez - 004371093

CREATE TABLE Staff (
    staffID CHAR(9) NOT NULL,
    branchID CHAR(9) NOT NULL,
    firstName VARCHAR(15) NOT NULL,
    lastName VARCHAR(15) NOT NULL,
    dateOfBirth DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    address VARCHAR(25),
    phoneNumber CHAR(10),
    dateHire DATE NOT NULL,
    salary NUMBER(10,2) NOT NULL,
    isManager CHAR(1),
    isAdmin CHAR(1),
    isOwner CHAR(1),
    isDriver CHAR(1),
    CONSTRAINTS Staff_PK PRIMARY KEY(staffID),
    CONSTRAINTS Employee_Gender_CK CHECK (gender IN ('F','M')),
    CONSTRAINTS Manager_CK CHECK (isManager IN ('Y')),
    CONSTRAINTS Admin_CK CHECK (isAdmin IN ('Y')),
    CONSTRAINTS Owner_CK CHECK (isOwner IN ('Y')),
    CONSTRAINTS Driver_CK CHECK (isDriver IN ('Y'))
);

CREATE TABLE Taxi (
    taxiID CHAR(9) NOT NULL,
    ownerNo CHAR(9) NOT NULL,
    isRegistered CHAR(1) NOT NULL,
    licensePlate VARCHAR(15) NOT NULL,
    CONSTRAINTS Taxi_PK PRIMARY KEY(taxiID),
    CONSTRAINTS Registered_CK CHECK (isRegistered IN ('Y','N'))
);

CREATE TABLE Business (
    clientID CHAR(9) NOT NULL,
    branchID CHAR(9) NOT NULL,
    CONSTRAINTS Client_PK PRIMARY KEY(clientID)
);

CREATE TABLE Contract (
    contractID CHAR(9) NOT NULL,
    branchID CHAR(9) NOT NULL,
    busClientID CHAR(9) NOT NULL,
    fEE NUMBER(5,2) NOT NULL,
    numberOfJobs NUMBER(3) NOT NULL,
    dateSigned DATE NOT NULL,
    CONSTRAINTS Contract_PK PRIMARY KEY(contractID)
);

CREATE TABLE Office (
    branchID CHAR(9) NOT NULL,
    mgrID CHAR(9) NOT NULL,
    address VARCHAR(25) NOT NULL,
    phoneNumber CHAR(10),
    CONSTRAINTS Office_PK PRIMARY KEY(branchID)
);

CREATE TABLE Assignment(
    staffID CHAR(9) NOT NULL,
    taxiID CHAR(9) NOT NULL,
    CONSTRAINTS Assignment_PK PRIMARY KEY(staffID, taxiID)
);

CREATE TABLE Job(
    jobID CHAR(9) NOT NULL,
    contractID CHAR(9) ,
    clientID CHAR(9),
    busClientID CHAR(9),
    taxiID CHAR(9) NOT NULL,
    staffID CHAR(9) NOT NULL,
    branchID CHAR(9) NOT NULL,
    pickupAddress CHAR(25) NOT NULL,
    destination CHAR(25) NOT NULL,
    milesDriven NUMBER(5,2) NOT NULL,
    fare NUMBER(5,2) NOT NULL,
    dateDriven DATE NOT NULL,
    failReason VARCHAR(100) NOT NULL,
    CONSTRAINTS Job_PK PRIMARY KEY(jobID)    
);

CREATE TABLE Private(
    clientID CHAR(9) NOT NULL,
    branchID CHAR(9) NOT NULL,
    CONSTRAINTS Private_PK PRIMARY KEY(clientID)
);
