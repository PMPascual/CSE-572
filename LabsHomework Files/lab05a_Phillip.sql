-- Name: Phillip Pascual
-- CSE 572
-- Lab 5A
set linesize 75
spool lab05aOutput_Phillip.txt

SELECT DISTINCT employee_id, first_name, last_name
    FROM hr.employees, hr.departments;

SELECT employee_id, first_name, last_name, hr.employees.department_id,
department_name
    FROM hr.employees, hr.departments
    WHERE hr.employees.department_id = hr.departments.department_id;


SELECT e.employee_id, e.first_name, e.last_name, d.department_name,
l.city
    FROM hr.employees e, hr.departments d, hr.locations l
    WHERE e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND e.department_id IN (80,90);

SELECT e.first_name, e.last_name, j.grade_level, j.lowest_sal, j.highest_sal
    FROM hr.employees e, hr.job_grades j
    WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
    FROM hr.employees e, hr.departments d
    WHERE e.department_id = d.department_id;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
    FROM hr.employees e, hr.departments d
    WHERE e.department_id = d.department_id
    ORDER BY e.first_name, e.last_name;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
    FROM hr.employees e
    LEFT JOIN hr.departments d
    ON e.department_id = d.department_id
    ORDER BY e.first_name, e.last_name;

SELECT e.first_name, e.last_name, m.last_name Manager
    FROM hr.employees e, hr.employees m
    WHERE e.manager_id = m.employee_id;

SELECT employee_id, first_name, last_name, department_name
    FROM hr.employees CROSS JOIN hr.departments;

SELECT employee_id, first_name, last_name, department_name
    FROM hr.employees NATURAL JOIN hr.departments;

SELECT e.last_name, e.department_id, d.department_name
    FROM hr.employees e, hr.departments d
    WHERE e.department_id = d.department_id
    AND e.manager_id = d.manager_id;

SELECT employee_id, first_name, last_name, department_name
    FROM hr.employees
    JOIN hr.departments USING (department_id);

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city
    FROM hr.employees e
    JOIN hr.departments d
    ON e.department_id = d.department_id
    JOIN hr.locations l
    ON d.location_id = l.location_id;

SELECT employee_id, first_name, last_name, department_name
    FROM hr.employees
    LEFT OUTER JOIN hr.departments USING (department_id);

SELECT employee_id, first_name, last_name, department_name
    FROM hr.employees e
    RIGHT OUTER JOIN hr.departments d
    ON e.department_id = d.department_id;

SELECT employee_id, first_name, last_name, d.department_name
    FROM hr.employees e
    FULL OUTER JOIN hr.departments d
    ON e.department_id = d.department_id;

spool off
