-- Phillip Pascual
-- CSE 570
-- Lab 06A Query
set linesize 75
spool lab06aQueryOutput_Phillip.txt

-- 1) Write a query to display employee ID, last name and hire date of any
-- employee in the same department as Zlotkey.  Exclude Zlotkey.  Sort the list
-- in order of employee ID.
SELECT employee_id, last_name, hire_date
    FROM HR.employees
    WHERE department_id = 
        (SELECT department_id
            FROM HR.employees
            WHERE last_name like 'Zlotkey')
    AND last_name <> 'Zlotkey'
    ORDER BY employee_id;

-- 2) Write a query to display employee ID and last names of all employees who
-- ear more than average salary of all employees.  Sort the results in ascending
-- order of salary, then employee ID.
SELECT employee_id, last_name
    FROM HR.employees
    WHERE salary >
        (SELECT AVG(salary)
            FROM HR.employees)
    ORDER BY salary, employee_id;

-- 3) Write a query to display employee ID and last names of all employees
-- whose department location ID is 1700.
SELECT employee_id, last_name
    FROM HR.employees
    WHERE department_id IN
        (SELECT department_id
            FROM HR.departments
            WHERE location_id = '1700');

-- 4) Write a query to display employee ID, last names and job ID of all
-- employees who reports to "King".
SELECT employee_id, last_name, job_id
    FROM HR.employees
    WHERE manager_id IN
        (SELECT employee_id
            FROM HR.employees
            WHERE last_name = 'King');

-- 5) Write a query to display employee ID, last names and job_id of all
-- employees in the 'Executive' departments.
SELECT employee_id, last_name, job_id
    FROM HR.employees
    WHERE department_id IN
        (SELECT department_id
            FROM HR.departments
            WHERE department_name LIKE '%Executive%');

-- 6) Write a query to display deparmtment ID, number of staff, average salary,
-- minimum salary, maximum salary, total salary of all departments.  Sort the
-- output by department ID.  Label the columns appropriately.
SELECT department_id, COUNT(*) "# Employees", AVG(salary) "Avg Salary",
MIN(salary) "Min Salary", MAX(salary) "Max Salary", SUM(salary) "Total Salary"
    FROM HR.employees
    GROUP BY department_id
    ORDER BY department_id;

-- 7) Write a query to display department ID, number of staff, average salary,
-- minimum salary, maximu salary, total salary of departments between 50 and
-- 100 only.  Sort the output by department ID.
SELECT department_id, COUNT(*) "# Employees", AVG(salary) "Avg Salary",
MIN(salary) "Min Salary", MAX(salary) "Max Salary", SUM(salary) "Total Salary"
    FROM HR.employees
    WHERE department_id BETWEEN 50 AND 100
    GROUP BY department_id
    ORDER BY department_id;

-- 8) Write a query to display job ID, number of staff, average salary,
-- minimum salary, maximum salary, total salary of all job ID types.  Sort the
-- output by job ID.
SELECT job_id, COUNT(*) "# Employees", AVG(salary) "Avg Salary",
MIN(salary) "Min Salary", MAX(salary) "Max Salary", SUM(salary) "Total Salary"
    FROM HR.employees
    GROUP BY job_id
    ORDER BY job_id;

-- 9) Write a query to display job ID, number of staff, average salary,
-- minimum salary, maximum salary, total salary of all job ID whose average
-- salary are greater than 5000.  Sort the output by job ID.
SELECT job_id, COUNT(*) "# Employees", AVG(salary) "Avg Salary",
MIN(salary) "Min Salary", MAX(salary) "Max Salary", SUM(salary) "Total Salary"
    FROM HR.employees
    GROUP BY job_id
        HAVING AVG(salary) > 5000
    ORDER BY job_id;


spool off
