-- Lab 03B
-- Name: Phillip Pascual

SET linesize 75

spool lab03BOutput_Phillip.txt

-- 1) Provide list (department_id, employee_id, first_name, last_name, hire_date
-- years_service) of employees who have worked for 15 years or longer, in order
-- of deparment_id, then employee_id
SELECT department_id, employee_id, first_name, last_name, hire_date,
(SYSDATE-hire_date)/365 "YEARS_SERVICE"
    FROM HR.employees
    WHERE ((SYSDATE-hire_date)/365) = 15 OR ((SYSDATE-hire_date)/365) > 15
    ORDER BY department_id, employee_id;

-- 2) Provide list (department_id, employee_id, first_name, last_name, hire date
-- years_service) of employees who have worked for 15 years or longer, in two
-- department only (100 and 110), in order of department_id, then employee_id
SELECT department_id, employee_id, first_name, last_name, hire_date,
(SYSDATE-hire_date)/365 "YEARS_SERVICE"
    FROM HR.employees
    WHERE (((SYSDATE-hire_date)/365) = 15 OR ((SYSDATE-hire_date)/365) > 15)
    AND (department_id = '100' OR department_id = '110')
    ORDER BY department_id, employee_id;

-- 3) Provide list (employee_id, first_name, last_name, hire_date,
-- years_service) of employees who have worked since 01-01-2008, in order of
-- years of service
SELECT employee_id, first_name, last_name, hire_date, (SYSDATE-hire_date)/365
"YEARS_SERVICE"
    FROM HR.employees
    WHERE (hire_date = TO_DATE('01-01-2008','DD-MM-YYYY')) OR (hire_date >
    TO_DATE('01-01-2008','DD-MM-YYYY'))
    ORDER BY (SYSDATE-hire_date)/365;

-- 4) Provide list (employee_id, first_name, last_name, salary, hire_date,
-- years_service) of employees who work for 15 years or longer and salary less
-- than than 10,000, in order of last_name, then first_name
SELECT employee_id, first_name, last_name, salary, hire_date,
(SYSDATE-hire_date)/365 "YEARS_SERVICE"
    FROM HR.employees
    WHERE ((SYSDATE-hire_date)/365 >= 15) AND (salary < 10000)
    ORDER BY last_name, first_name;

-- 5) How many employees are there in company? How much is the minimum salary?
-- How much is the maximum salary?
SELECT COUNT(*) "# of Employees", MIN(salary) "MIN SALARY", MAX(salary)
"MAX SALARY"
    FROM HR.employees;

-- 6) Provide list of job_id (unique) and in alphabetical order
SELECT DISTINCT job_id
    FROM HR.employees
    ORDER BY job_id;

-- 7) Provide list of employees whose first names begin with D and longer than
-- 6 characters
SELECT first_name, last_name
    FROM HR.employees
    WHERE (first_name LIKE 'D%') AND (LENGTH(first_name) > 6);

-- 8) Provide list of employees (last name, first name, job ID) whose jobs are
-- IT related (job_id begins with IT).  Name is required to be in upper case
SELECT UPPER(last_name), UPPER(first_name), job_id
    FROM HR.employees
    WHERE job_id LIKE 'IT%';

-- 9) Provide list of salaries (unique) that are greater than or equal to 10000,
-- in order of salary
SELECT DISTINCT salary
    FROM HR.employees
    WHERE salary >= 10000
    ORDER BY salary;

-- 10) Using history table, provide (employee_id, start_date, end_date, job_id,
-- department_id, years_service) of each employee in each department the
-- employee has worked, in order of employee_id and start_date
SELECT employee_id, start_date, end_date, job_id, department_id,
(end_date-start_date)/365 "YEARS_SERVICE"
    FROM HR.job_history
    ORDER BY employee_id, start_date;

spool off
