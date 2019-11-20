-- Project Option 1: The FastCabs
-- Purpose: Insert data into database
-- Author: Phillip Pascual - 005869470

SET CONSTRAINTS ALL DEFERRED;

-- Staff
INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES 
('S00554898', 'B0011AB75', 'Allen', 'Wraith', '27-Oct-93', 'M', '58 Twitch Rd', 
    '9094877522', '21-Jan-20', '75000', 'Y', '', '', '');

INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES 
('S15488375', 'B0011AB76', 'Juan', 'Johnson', '4-Jan-94', 'M', '61 Reddit Lane', 
    '9092459870', '23-Jan-20', '84000', 'Y', '', '', '');

INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES ('S00554897', 'B0011AB75', 'John', 'Smith', '28-Dec-95', 'M', 
    '123 Fake Street', '9095487755', '20-Jan-20', '65000', '', '', '', 'Y');

INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES 
('S00554899', 'B0011AB75', 'Jonna', 'Hill', '1-Mar-90', 'F', '765 Linda Drive', 
    '9092423165', '20-Jan-20', '62300', '', 'Y', '', '');

INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES 
('S00554900', 'B0011AB75', 'Sneaky', 'Castro', '23-Jan-91', 'F', '232 Petty Rd', 
    '9094248795', '21-Jan-20', '97000', '', '', 'Y', '');

INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES 
('S15488376', 'B0011AB76', 'Mireya', 'Hierra', '11-Feb-74', 'F', '762 Wood Ave', 
    '9091245706', '22-Jan-20', '97110', '', 'Y', '', '');

INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES 
('S15488377', 'B0011AB76', 'Bear', 'Kazooie', '6-Jun-80', 'M', '17 Gengar Ave', 
    '9098753574', '24-Jan-20', '56000', '', '', 'Y', '');

INSERT INTO Staff
(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, phoneNumber,
    dateHire, salary, isManager, isAdmin, isOwner, isDriver) 
VALUES 
('S15488378', 'B0011AB76', 'Shina', 'Lao', '11-Nov-92', 'F', '875 Cloud Drive', 
    '9098739734', '22-Jan-20', '67000', '', '', '', 'Y');

-- Office
INSERT INTO Office
(branchID, mgrID, address, phoneNumber)
VALUES
('B0011AB75', 'S00554898', '537 N. Loma Linda Rd', '3305548798');

INSERT INTO Office
(branchID, mgrID, address, phoneNumber)
VALUES
('B0011AB76', 'S15488375', '123 Fake Street', '3112554784');

-- Business
INSERT INTO Business
(clientID, branchID) 
VALUES 
('C00117845', 'B0011AB75');

INSERT INTO Business
(clientID, branchID) 
VALUES 
('C00117895', 'B0011AB76');

-- Private
INSERT INTO Private
(clientID, branchID) 
VALUES 
('C00000007', 'B0011AB75');

INSERT INTO Private
(clientID, branchID) 
VALUES 
('C00000009', 'B0011AB76');

-- Taxi
INSERT INTO Taxi
(taxiID, ownerNo, isRegistered, licensePlate) 
VALUES
('T00000001', 'S00554900', 'Y', 'CA9990');

INSERT INTO Taxi
(taxiID, ownerNo, isRegistered, licensePlate) 
VALUES
('T00000004', 'S15488378', 'Y', 'CA9993');

-- Assignment
INSERT INTO Assignment 
(staffID, taxiID) 
VALUES
('S00554897', 'T00000001');

INSERT INTO Assignment 
(staffID, taxiID) 
VALUES
('S15488378', 'T00000004');

-- Contract
INSERT INTO Contract
(contractID, branchID, busClientID, fee, numberOfJobs, dateSigned) 
VALUES 
('X05588755', 'B0011AB75', 'C00117845', '505.39', '100', '27-Jan-20');

INSERT INTO Contract
(contractID, branchID, busClientID, fee, numberOfJobs, dateSigned) 
VALUES 
('X05786842', 'B0011AB76', 'C00117895', '250.87', '50', '26-Jan-20');

-- Job
INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J00000003', '', 'C00000007', '', 'T00000001', 'S00554897', 'B0011AB75', '123 Fake St', 
    '456 Faker St.', '45.45', '50.23', '26-Feb-20', 'Completed');

INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J00000004', '', 'C00000007', '', 'T00000001', 'S00554897', 'B0011AB75', '112 Verizon Wy', 
    '23 ATT Ave', '23.45', '25.23', '27-Mar-20', 'Completed');

INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J00000008', '', 'C00000009', '', 'T00000004', 'S15488378', 'B0011AB76', '98 Chernobyl St', 
    '45 Meltdown Ave', '33.32', '39.32', '16-Mar-20', 'Completed');

INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J00000009', '', 'C00000009', '', 'T00000004', 'S15488378', 'B0011AB76', '90 Abc Ave', 
    '87 Xyz St', '50.32', '67.98', '9-Jun-20', 'Completed');

INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J00000045', 'X05588755', '', 'C00117845', 'T00000001', 'S00554897', 'B0011AB75', 
    '879 Lourve Street', '978 LawLaw Rd', '60.95', '67.87', '16-Feb-20', 'Completed');

INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J00007845', 'X05588755', '', 'C00117845', 'T00000001', 'S00554897', 'B0011AB75', 
    '763 Inter Lane', '87 Challenjour Ave', '54.67', '87.54', '29-Feb-20', 'Completed');

INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J10057522', 'X05786842', '', 'C00117895', 'T00000004', 'S15488378', 'B0011AB76', 
    '879 Loner Ave', '645 Salavador Street', '78.41', '46.78', '8-Apr-20', 'Completed');

INSERT INTO Job
(jobID, contractID, clientID, busClientID, taxiID, staffID, branchID, pickupAddress, destination,
    milesDriven, fare, dateDriven, failReason) 
VALUES 
('J00080049', 'X05786842', '', 'C00117895', 'T00000004', 'S15488378', 'B0011AB76', 
    '245 Lewd Street', '343 Industries Rd', '21.57', '64.78', '11-Jun-20', 'Completed');

SET CONSTRAINTS ALL IMMEDIATE;

