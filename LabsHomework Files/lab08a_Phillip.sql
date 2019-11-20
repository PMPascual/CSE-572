-- Phillip Pascual
-- CSE 572
-- Spring 2019
-- Lab 08A

SET LINESIZE 80
SET PAGESIZE 60
SPOOL lab08aOutput_Phillip.txt

-- List employees with a job-title
SELECT employee_id, first_name, last_name, job_id, salary
    FROM HR.employees
    WHERE UPPER(job_id) = UPPER('&job_title')
    ORDER BY employee_id;

UNDEFINE job_title;

-- List employees with a job-title = 'IT_PROG'
DEFINE job_title = 'IT_PROG'
SELECT employee_id, first_name, last_name, job_id, salary
    FROM HR.employees
    WHERE UPPER(job_id) = UPPER('&job_title')
    ORDER BY employee_id;

UNDEFINE job_title;

-- List employees with varying columns, conditions and orders
SELECT &columnlists
    FROM hr.employees
    WHERE &conditions
    ORDER BY &orders;

-- Substitution variables used at different clauses
SELECT employee_id, first_name, last_name, &&columnlist
    FROM HR.employees
    ORDER BY &columnlist;

UNDEFINE columnlist;
COLUMN job_id JUSTIFY CENTER HEADING 'Job|Category' FORMAT A20

COLUMN Salary HEADING 'Salary' FORMAT $99,9999.99 
TTITLE CENTER 'Employee Report' SKIP 1 'As of '_DATE SKIP 
BTITLE CENTER 'Confidential'

SPOOL OFF
