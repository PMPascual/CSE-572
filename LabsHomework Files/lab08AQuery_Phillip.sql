-- Phillip Pascual
-- CSE 572
-- Spring 2019
-- Lab 08A Query

SET LINESIZE 80
SPOOL lab08AQueryOutput_Phillip.txt

-- 1) Write a SQL script file to display employee ID and last names of all
-- employees for a location ID.  Test with location ID = 1700
SELECT e.employee_id, e.last_name
    FROM hr.employees e, hr.departments d
    WHERE e.department_id = d.department_id
    AND d.location_id = &location;

-- Undefines location variable
UNDEFINE location;

-- 2) Write a SQL script file to display employee ID, last names and job ID of
-- all employees who reports to an employee's name.  Test with 'King'.
SELECT employee_id, last_name, job_id
    FROM hr.employees
    WHERE manager_id IN
        (SELECT employee_id
            FROM hr.employees
            WHERE last_name = '&lastname');

-- Undefines lastname variable
UNDEFINE lastname;

-- 3) Write a SQL script file to display employee ID, last anme, and job ID of
-- all employees in a department.  Test with 'Executive' department.
SELECT employee_id, last_name, job_id
    FROM hr.employees
    WHERE department_id IN
        (SELECT department_id
            FROM hr.departments
            WHERE department_name = '&department');

--Undefines department variable
UNDEFINE department;

SPOOL OFF
