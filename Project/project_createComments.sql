--Tables

--Staff Table
COMMENT ON TABLE Staff IS 'All Staff in the database';
COMMENT ON COLUMN Staff.staffID IS 'Unique staff ID for all';
COMMENT ON COLUMN Staff.branchID IS 'branch ID for the company';
COMMENT ON COLUMN Staff.firstName IS 'First Name of Staff';
COMMENT ON COLUMN Staff.lastName IS 'Last Name of Staff';
COMMENT ON COLUMN Staff.dateOfBirth IS 'Date of Birth of Staff - day/month/year';
COMMENT ON COLUMN Staff.gender IS 'Gender of staff - format M or F';
COMMENT ON COLUMN Staff.address IS 'Address of the staff';
COMMENT ON COLUMN Staff.phoneNumber IS 'Phone Number of the staff';
COMMENT ON COLUMN Staff.salary IS 'Salary that the staff member would get';

--Taxi Table
COMMENT ON TABLE Taxi IS 'All data involving the taxi';
COMMENT ON COLUMN Taxi.taxiID IS 'Unique ID for each taxi';
COMMENT ON COLUMN Taxi.ownerNo IS 'The owner of the taxis';
COMMENT ON COLUMN Taxi.isRegistered IS 'Value of whether the taxi is registered or not';
COMMENT ON COLUMN Taxi.licensePlate IS 'License plate for a specific taxi';

COMMENT ON TABLE Business IS 'All data involving the Business Client';
COMMENT ON COLUMN Business.clientID IS 'Unique ID for each client';
COMMENT ON COLUMN Business.branchID IS 'The branch ID that the Business associates themselves with';

--Contract Table
COMMENT ON TABLE Contract IS 'Holds all the values of the contracts that the business does';
COMMENT ON COLUMN Contract.contractID IS 'Unique ID of the contract';
COMMENT ON COLUMN Contract.branchID IS 'the branch ID where the contract is done';
COMMENT ON COLUMN Contract.busClientID IS 'the business client ID';
COMMENT ON COLUMN Contract.fEE IS 'The fee agreed on in the contract';
COMMENT ON COLUMN Contract.numberOfJobs IS 'The amount of jobs done in the contract';
COMMENT ON COLUMN Contract.dateSigned IS 'Date in which the contract was signed on';

--Office Table
COMMENT ON TABLE Office IS 'Holds all the information important in the office';
COMMENT ON COLUMN Office.branchID IS 'Unqiue branchID that is associated with the office';
COMMENT ON COLUMN Office.mgrID IS 'If the office has a manager, this holds their mgrID';
COMMENT ON COLUMN Office.address IS 'Address of the office';
COMMENT ON COLUMN Office.phoneNumber IS 'Phone number of that office';

--Assignment Table
COMMENT ON TABLE Assignment IS 'Holds all the information of all assignments done';
COMMENT ON COLUMN Assignment.staffID IS 'Staff ID of who takes on the assignment';
COMMENT ON COLUMN Assignment.taxiID IS 'The taxi ID where the assignment was done';

--Private Table
COMMENT ON TABLE Private IS 'Holds all the information on the private client';
COMMENT ON COLUMN Private.clientID IS 'The client ID of the private client';
COMMENT ON COLUMN Private.branchID IS 'The branch ID that the client made the deal with';

--Job Table
COMMENT ON Table Job IS 'Holds all the information that is associated with the Job';
COMMENT ON COLUMN Job.jobID IS 'Job ID';
COMMENT ON COLUMN Job.contractID IS 'Contract ID';
COMMENT ON COLUMN Job.clientID IS 'Client ID';
COMMENT ON COLUMN Job.busClientID IS 'Business Client ID';
COMMENT ON COLUMN Job.taxiID IS 'Taxi ID';
COMMENT ON COLUMN Job.staffID IS 'ID of driver';
COMMENT ON COLUMN Job.branchID IS 'Branch ID';
COMMENT ON COLUMN Job.pickupAddress IS 'Address passenger picked up at';
COMMENT ON COLUMN Job.destination IS 'Destination address';
COMMENT ON COLUMN Job.milesDriven IS 'Miles from pickup to destination';
COMMENT ON COLUMN Job.fare IS 'Fare for completing ride';
COMMENT ON COLUMN Job.dateDriven IS 'Date drive completed';
COMMENT ON COLUMN Job.failReason IS 'Comments/reason for drive failure';
