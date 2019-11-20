-- Phillip Pascual
-- CSE 572
-- Lab 06A
set linesize 75
spool lab06aOutput_Phillip.txt

SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary >= ALL
        (SELECT salary
            FROM hr.employees
            WHERE job_id = 'IT_PROG')
    ORDER BY employee_id;

SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary >=
        (SELECT MAX(salary)
            FROM hr.employees
            WHERE job_id = 'IT_PROG')
    ORDER BY employee_id;

SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE employee_id IN
        (SELECT manager_id
            FROM hr.employees)
    AND salary <=
        (SELECT AVG(salary)
            FROM hr.employees);

SELECT employee_id, first_name, last_name, department_id, salary
    FROM hr.employees
    WHERE salary = 
        (SELECT MIN(salary)
            FROM hr.employees);

SELECT employee_id, first_name, last_name
    FROM hr.employees
    WHERE employee_id IN
        (SELECT DISTINCT manager_id
            FROM hr.employees);

SELECT employee_id, first_name, last_name
    FROM hr.employees
    WHERE employee_id NOT IN
        (SELECT DISTINCT manager_id
            FROM hr.employees
            WHERE manager_id IS NOT NULL);

SELECT COUNT(*), MIN(salary), MAX(salary), AVG(salary), SUM(salary)
    FROM hr.employees;

SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary <=
        (SELECT AVG(salary)
            FROM hr.employees);

SELECT employee_id, first_name, last_name, salary, job_id
    FROM hr.employees
    WHERE salary >=
        (SELECT MAX(salary)
            FROM hr.employees
            WHERE job_id = 'IT_PROG')
    ORDER BY employee_id;

SELECT department_id, COUNT(*), MIN(salary), MAX(salary), AVG(salary)
    FROM hr.employees
    GROUP BY department_id;

SELECT department_id, COUNT(*), MIN(salary), MAX(salary)
    FROM hr.employees
    WHERE department_id <> 100
    GROUP BY department_id
    HAVING MIN(salary) < 8000;

SELECT department_id, COUNT(*), MIN(salary), MAX(salary), AVG(salary)
    FROM hr.employees
    GROUP BY department_id
    HAVING MIN(salary) >=
        (SELECT MIN(salary)
            FROM hr.employees
            WHERE department_id = 100);

SELECT first_name, last_name, department_id, salary
    FROM hr.employees a
    WHERE salary IN
        (SELECT MIN(salary)
            FROM hr.employees b
            GROUP BY department_id
            HAVING a.department_id = b.department_id);

spool off
