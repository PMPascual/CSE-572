SET CONSTRAINTS ALL DEFERRED;

INSERT INTO Staff(staffID, branchID, firstName, lastName, dateOfBirth, gender, address, salary,
    isManager, isAdmin, isOwner, isDriver) VALUES ('0000001', '0000001', 'John', 'Smith', '28-DEC-94', 'M', '122 N. Lorranie Rd',
    '34000', 'Y', 'Y', 'Y', 'N');

INSERT INTO Business(clientID, branchID) VALUES ('0000001', '0000001');



SET CONSTRAINTS ALL IMMEDIATE;

SET PAUSE OFF

SELECT *
    FROM Staff;
SELECT *
    FROM Business;

SET PAUSE ON


