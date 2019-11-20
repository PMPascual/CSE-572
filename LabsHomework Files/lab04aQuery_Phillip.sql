-- Lab 04A Query
-- Name: Phillip Pascual
set linesize 75
spool lab04AQueryOutput_Phillip.txt

-- 1) Write a query to display the current data.  Label the column date
SELECT SYSDATE "Date"
    FROM DUAL;

-- 2) Display employee ID, last name, first name, commission point for employees
-- who have commission.  Sort the result in order of commission.
SELECT employee_id, last_name, first_name, commission_pct
    FROM HR.employees
    WHERE commission_pct IS NOT NULL
    ORDER BY commission_pct;

-- 3) Display employee id, last name, first ame, salary and salary increased by
-- 15% as a whole number for employees whose salaries are greater or equal to
-- $10000.  Label the column New Salary.  Salary is printed in currency format.
-- Sort the results by employee id.
SELECT employee_id, last_name, first_name, salary, ROUND(salary*1.15,0) "New
Salary"
    FROM HR.employees
    WHERE salary >= 10000
    ORDER BY employee_id;

-- 4) Write a query that displays employee's last name, with the first letter
-- capitalized, and all other letters lowercase, length of the last names for
-- all employees whose name starts with letter J, A, or M.  Sort the results
-- by the employees' last name.
SELECT INITCAP(last_name), LENGTH(last_name)
    FROM HR.employees
    WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
    ORDER BY last_name;

-- 5) Display the employees' last name, and calculate the number of months
-- between today and the date the employee was hired of employees whose job
-- ID ends with MGR or MAN.   Label the column as MONTHS_WORKED.  Order the
-- results by the months employed.  Round the number of months up to the
-- closest whole number.
SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE,hire_date))
    FROM HR.employees
    WHERE job_id LIKE '%MGR' OR job_id LIKE '%MAN'
    ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE,hire_date));

-- 6) Display last name and salary of all employees whose job_id is 'IT_PROG'
-- and salary greater or equal 3000.  Format the salary to be 15 characters
-- long, left-padded with $.  Label the column SALARY.  Sort the result by
-- salary.
SELECT last_name, LPAD(salary,15,'$') "SALARY"
    FROM HR.employees
    WHERE job_id LIKE 'IT_PROG' AND salary >= 3000
    ORDER BY salary;

-- 7) Display employee's last name, first name, and bonus is computed by
-- salary * commission and in currency format for employees in departments 80
-- and 90.  If an employee does not earn any commission, put "No Bonus".  Label
-- the column BONUS.  Sort the results in order of last name, and then first
-- name.
SELECT last_name, first_name, NVL2(commission_pct,TO_CHAR(salary*commission_pct),'NO BONUS') "BONUS"
    FROM HR.employees
    WHERE department_id LIKE '80' OR department_id LIKE '90'
    ORDER BY last_name, first_name;

-- 8) Using DECODE function, displays last name, first name, job_id, and the
-- grade of all employees based on the value of column job_id, as per the
-- following data for employees whose salaries are greater or equal 10000. Sort
-- the results by grade.
SELECT last_name, first_name, job_id,
    DECODE(job_id,
            'AD_PRES','A',
            'ST_MAN','B',
            'IT_PROG','C',
            'SA_REP','D',
            'ST_CLERK','E',
            'NA') "GRADE"
    FROM HR.employees
    WHERE salary >= 10000
    ORDER BY "GRADE";

-- 9) Write the query for question #7 using CASE syntax.
SELECT last_name, first_name,
    CASE commission_pct
        WHEN NULL THEN 'No Bonus'
        ELSE TO_CHAR(salary*commission_pct)
        END BONUS
    FROM HR.employees
    WHERE department_id LIKE '80' OR department_id LIKE '90'
    ORDER BY last_name, first_name;

spool off
