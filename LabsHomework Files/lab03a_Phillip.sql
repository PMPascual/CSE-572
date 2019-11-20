-- Lab 3A
-- Name: Phillip Pascual
-- sets linesize to 150
SET linesize 150
-- sets pagesize to 3200
SET pagesize 3200
-- sets output text file
spool lab03aOutput_Phillip.txt

-- 1) Pulls up table names for all tables where owner is HR
SELECT table_name
    FROM all_tables
    WHERE owner = 'HR';

-- 2) Searches and displays employee ID, first name, and last name for
-- employee with employee ID 130
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    WHERE employee_ID = 130;

-- 3) Searches and displays distinct department IDs from HR.employee table
SELECT DISTINCT department_id
    FROM HR.employees;

-- 4) Searches and displays employee_ID, first_name, and last_name for employees
-- from department_id 100
SELECT employee_id, first_name, last_name
    FROM HR.employees
    WHERE department_id = 100;

-- 5) Searches and displays distinct department_IDs between 0 and 50
SELECT DISTINCT department_id
    FROM HR.employees
    WHERE department_id BETWEEN 0 AND 50;

-- 6) Searches and displays employee_id, first_name, last_name, and
-- department_id for employees in department_id 10 and 20
SELECT employee_id, first_name, last_name, department_id
    FROM HR.employees
    WHERE department_id IN (10, 20);

-- 7) Searches and displays employee_id, first_name, last_name of employees with
-- first names beginning with 'Jen'
SELECT employee_id, first_name, last_name
    FROM HR.employees
    WHERE first_name LIKE '%Jen%';

-- 8) Searches and displays employee_id, first_name, last_name, and salary of
-- employees where job_id is IT_PROG and salary < 5000
SELECT employee_id, first_name, last_name, salary
    FROM HR.employees
    WHERE job_id = 'IT_PROG' AND salary < 5000;

-- 9) Searches and displays employee_id, first_name, last_name, and job_id of
-- managers
SELECT employee_id, first_name, last_name, job_id
    FROM HR.employees
    WHERE job_id LIKE '%MGR';

-- 10) Searches and displays employee_id, first_name, last_name, salary, and
-- job_id of employees in management
SELECT employee_id, first_name, last_name, salary, job_id
    FROM HR.employees
    WHERE (job_id LIKE '%MGR' OR job_id LIKE '%VP' OR job_id LIKE '%PRES');

-- 11) Displays employee_id and employee names, ordered by employee_id
SELECT employee_id, first_name || ' ' || last_name "Employee Name"
    FROM HR.employees
    ORDER BY employee_id;

-- 12) Displays employee_id, department_id, employee name, and salary, ordered
-- by department_id and salary
SELECT employee_id, department_id, first_name || ' ' || last_name "Employee
Name", salary
    FROM HR.employees
    ORDER BY department_id, salary;

-- 13) Displays department_id, employee name, and salary, ordered by
-- department_id in descending order and salary in ascending order
SELECT department_id, first_name || ' ' || last_name "Employee Name", salary
    FROM HR.employees
    ORDER BY department_id DESC, salary ASC;

spool off
