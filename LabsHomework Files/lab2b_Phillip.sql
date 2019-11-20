-- lab: lab02-B
-- Name: Phillip Pascual
-- sets linesize to 132
SET linesize 132 
-- sets output text file
spool lab02BOutput_Phillip.txt

-- 1) Provide list of table names that are available in HR account
SELECT table_name
    FROM all_tables
    WHERE owner = 'HR';

-- 2) List attributes for each of those tables
DESC HR.regions;

DESC HR.locations;

DESC HR.departments;

DESC HR.jobs;

DESC HR.employees;

DESC HR.job_history;

DESC HR.job_grades;

DESC HR.countries;

-- 3) Query job_id, job_title, maximum salary, minimum salary, and difference
-- between two salaries.
SELECT job_id, job_title, max_salary, min_salary, (max_salary - min_salary)
       Difference
    FROM HR.jobs;

-- 4) Query employee_ID, employee's full name, hire date, years employed, and
-- salary of all employees
SELECT employee_id, last_name || ', ' || first_name "Full Name", hire_date,
       (SYSDATE - hire_date)/365 "Years Employed", salary
    FROM HR.employees;

-- 5) Query current number of employees in the company
SELECT COUNT(*) "Number of Employees"
    FROM HR.employees;

-- 6) Query unique salaries in the company
SELECT DISTINCT salary
    FROM HR.employees;

-- 7) Query number of unique salaries in the company
SELECT COUNT(DISTINCT salary) "# of Unique Salaries"
    FROM HR.employees;

-- stops text file output
spool off
