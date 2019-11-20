-- Phillip Pascual
-- CSE 572
-- Homework Week 7
-- Scripts to fill tables

-- Defer Constraints
SET CONSTRAINTS ALL DEFERRED;

-- Insert data into Hotel table
INSERT INTO Hotel VALUES ('H001','Hotel Rwanda', 'Kigali');
INSERT INTO Hotel VALUES ('H002','Casino Royale', 'Monaco');
INSERT INTO Hotel VALUES ('H003','Titanic', 'Newland');

-- Insert data into Room table
INSERT INTO Room VALUES ('101','H001','Single','11');
INSERT INTO Room VALUES ('102','H001','Double','12');
INSERT INTO Room VALUES ('103','H001','Suite','13');

INSERT INTO Room VALUES ('201','H002','Single','21');
INSERT INTO Room VALUES ('202','H002','Double','22');
INSERT INTO Room VALUES ('203','H002','Suite','23');

INSERT INTO Room VALUES ('301','H003','Single','31');
INSERT INTO Room VALUES ('302','H003','Double','32');
INSERT INTO Room VALUES ('303','H003','Suite','33');

-- Insert data into Guest table
INSERT INTO Guest VALUES ('G01','Don Cheadle','123 Avenger Ave');
INSERT INTO Guest VALUES ('G02','Ron King','456 Boxing Ave');
INSERT INTO Guest VALUES ('G03','Edward Scissor','789 Buron Ave');

-- Insert data into Booking table
INSERT INTO Booking VALUES ('H001','G01','01-MAY-17','03-MAY-17','101');
INSERT INTO Booking VALUES ('H002','G01','04-JUN-17','07-JUN-17','202');

INSERT INTO Booking VALUES ('H003','G02','07-JUL-18','17-JUL-18','301');
INSERT INTO Booking VALUES ('H003','G02','09-SEP-18','11-SEP-18','303');

INSERT INTO Booking VALUES ('H002','G03','01-JAN-19','04-JAN-19','201');
INSERT INTO Booking VALUES ('H001','G03','05-FEB-19','06-FEB-19','103');

-- Set deferred constraints effective
SET CONSTRAINTS ALL IMMEDIATE;

SET PAUSE OFF

SELECT * FROM Hotel;
SELECT * FROM Room;
SELECT * FROM Guest;
SELECT * FROM Booking;

SET PAUSE ON
