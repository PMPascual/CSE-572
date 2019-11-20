-- Phillip Pascual
-- CSE 572
-- Spring 2019
-- Lab 09A

-- List all columns of table jobs
CREATE VIEW view1 AS
    SELECT *
        FROM hr.jobs;

-- List two columns / fields only
CREATE VIEW view2 AS
    SELECT job_id, job_title
        FROM hr.jobs;

-- List columns with simple column alias
CREATE VIEW view3 AS
    SELECT job_title, min_salary Minimum_Salary
        FROM hr.jobs;

-- List columns with customized column alias using double quote
CREATE VIEW view4 AS
    SELECT job_title, min_salary*1.2 AS "120% Minimum Salary"
        FROM hr.jobs;

-- List columns with arithmetic expression
CREATE VIEW view5 AS
    SELECT job_title, min_salary*12 Annual_Minimum
        FROM hr.jobs;

CREATE VIEW view6 AS
    SELECT job_title, min_salary*12 + 2000 New_Minimum
        FROM hr.jobs;

CREATE VIEW view7 AS
    SELECT job_title, (min_salary+max_salary)/2 Average_Salary
        FROM hr.jobs;

-- List columns with null value
CREATE VIEW view8 AS
    SELECT last_name, salary, commission_pct
        FROM hr.employees;

CREATE VIEW view9 AS
    SELECT last_name, salary, 12*salary*commission_pct "Total"
        FROM hr.employees;

-- Concatenation of multiple columns
CREATE VIEW view10 AS
    SELECT job_title || min_salary AS "Job Title Min Salary "
        FROM hr.jobs;

-- Concatenation of multiple columns and literal character strings
CREATE VIEW view11 AS
    SELECT job_id || ',' || job_title AS "Job ID, Title"
        FROM hr.jobs;

-- List all minimum salaries
CREATE VIEW view12 AS
    SELECT min_salary
        FROM hr.jobs;

-- List only unique minimum salaries
CREATE VIEW view13 AS
    SELECT DISTINCT min_salary
        FROM hr.jobs;
