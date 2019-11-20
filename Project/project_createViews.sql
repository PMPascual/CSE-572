-- Deal Team Six
-- CSE 572 Spring 2019

-- 1) List name and phone numbers of Managers
CREATE VIEW managers AS
    SELECT o.branchid, o.phonenumber, s.lastname, s.firstname
        FROM ppas.office o, ppas.staff s
        WHERE o.mgrid = s.staffid;

-- 2) List names of all female drivers
CREATE VIEW femdrivers AS
    SELECT lastname, firstname
        FROM ppas.staff
        WHERE gender = 'F'
        AND isdriver = 'Y';

-- 3) List total number of staff at each office
CREATE VIEW numstaff AS
    SELECT count(*) "# of Staff"
        FROM ppas.staff
        GROUP BY branchid;

-- 4) List details of all taxis
CREATE VIEW owners AS
    SELECT t.taxiid, t.ownerno, t.isregistered "Registered?", t.licenseplate,
        s.lastname, s.firstname
        FROM ppas.taxi t, ppas.staff s
        WHERE t.ownerno = s.staffid;

-- 5) List count of registered taxis
CREATE VIEW registered AS
    SELECT count(*) "# Registered"
        FROM ppas.taxi
        WHERE isregistered = 'Y';

-- 6) List number of drivers allocated to each taxi
CREATE VIEW allocated AS
    SELECT taxiid, count(staffid) "# Drivers"
        FROM ppas.assignment
        GROUP BY taxiid;

-- 7) List average number of miles driven during a job
CREATE VIEW avgjob AS 
    SELECT avg(milesdriven) "Average Miles"
        FROM ppas.job;

-- 8) List total number of jobs allocated to each car
CREATE VIEW numjobs AS
    SELECT taxiid, count(jobid) "# of Jobs"
        FROM ppas.job
        GROUP BY taxiid;

-- 9) List total number of jobs allocated to each driver
CREATE VIEW driverjobs AS
    SELECT staffid, count(jobid) "# of Jobs"
        FROM ppas.job
        GROUP BY staffid;

-- 10) List total number of jobs and miles driven for a given contract
CREATE VIEW contractjobs AS
    SELECT contractid, count(jobid) "# of Jobs", sum(milesdriven) "Total Miles"
        FROM ppas.job
        WHERE contractid IS NOT NULL
        GROUP BY contractid;
