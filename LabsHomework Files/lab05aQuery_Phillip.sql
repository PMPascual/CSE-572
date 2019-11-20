-- Phillip Pascual
-- CSE 570
-- Lab 05A Query
set linesize 75
spool lab05aQueryOutput_Phillip.txt

-- 1) Write a query to display employee ID, lat name, department ID, department
-- name of all employees.  Sort the list in order of employee ID.

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
    FROM hr.employees e, hr.departments d;

-- 2) You will notice that some employees who do not have a matching department
-- will not be displayed.  Modify the above query to make sure all employees are
-- displayed.  Sort the list in order of employee id.

SELECT employee_id, last_name, department_id, department_name
    FROM hr.employees
    LEFT OUTER JOIN hr.departments USING (department_id)
    ORDER BY employee_id;

-- 3) Write a query to display all jobs that are in the department 80.  Include
-- location ID in the output.

SELECT j.job_id, d.department_id, d.location_id
    FROM hr.jobs j, hr.departments d
    WHERE d.department_id = '80';

-- 4) Wire a query to display all jobs, department name that are in the
-- departments 80, 90, and 100.  Include the cities of the departments in the
-- output.  Sort the output in order of department.

SELECT j.job_id, d.department_name, l.city
    FROM hr.jobs j, hr.departments d, hr.locations l
    WHERE d.department_id IN (80,90,100)
    ORDER BY d.department_id;

-- 5) Write a query to display last name, department name, city, commission_pct
-- of all employees who have commission_pct.  Sort the output in order of
-- department name.

SELECT e.last_name, d.department_name, l.city, e.commission_pct
    FROM hr.employees e, hr.departments d, hr.locations l
    WHERE e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL
    ORDER BY d.department_name;

-- 6) Write a query to display last name, department name for all employees who
-- have letter 'a' in their last name.

SELECT e.last_name, d.department_name
    FROM hr.employees e, hr.departments d
    WHERE e.department_id = d.department_id
    AND e.last_name LIKE '%a%';

-- 7) Write a query to display employee id, last name, job id, department name
-- city of all employees who work in Toronto

SELECT e.employee_id, e.last_name, e.job_id, d.department_name, l.city
    FROM hr.employees e
    JOIN hr.departments d USING (department_id)
    JOIN hr.locations l USING (location_id)
    WHERE l.city = 'Toronto';

-- 8) Write a query to display employee id, last name, manager ID, manager's
-- last name of all employees.  Label the columns as EMP#, Employee, MGR#,
-- Manager.  Sort the output in order of employee ID.

SELECT e.employee_id EMP#, e.last_name Employee, m.employee_id MGR#,
m.last_name Manager
    FROM hr.employees e, hr.employees m
    WHERE e.manager_id = m.employee_id
    ORDER BY e.employee_id;

-- 9) Write a query to display employee ID, last name, hire date, manager ID,
-- manager's last name of all employees whose hire dates were earlier than their
-- managers.  Label the columns as EMP#, Employee, Hire Date, MGR#, Manager.
-- Sort the output in order of employee ID.

SELECT e.employee_id EMP#, e.last_name Employee, e.hire_date "Hire Date",
m.employee_id MGR#, m.last_name Manager
    FROM hr.employees e, hr.employees m
    WHERE e.manager_id = m.employee_id
    AND e.hire_date < m.hire_date
    ORDER BY e.employee_id;

-- 10) Write a query to display employee id, last name, job id and hire date of
-- all employees who were hired after an employee whose last name is Davies.

SELECT employee_id, last_name, job_id, hire_date
    FROM hr.employees
    WHERE hire_date < (SELECT hire_date FROM hr.employees WHERE last_name LIKE
                       'Davies');
