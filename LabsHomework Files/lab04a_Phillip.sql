-- Name: Phillip Pascual
-- CSE 572
-- Lab 3A
-- sets linesize to 75
SET linesize 75

-- Sets output
spool lab04aOutput_Phillip.txt

-- 1) Selects distinct salary values from HR.employees where salary is between
-- 9000 and 10000, ordered by salary
SELECT DISTINCT salary
    FROM HR.employees
    WHERE salary BETWEEN 9000 AND 10000
    ORDER BY salary;

-- 2) Selects employee first name, last name and salary from HR.employees where
-- salary is not between 9000 and 10000, ordered by salary
SELECT first_name, last_name, salary
    FROM HR.employees
    WHERE salary NOT BETWEEN 9000 AND 10000
    ORDER BY salary;

-- 3) Displays string 'SQL Course' in lower-case letters using dummy table
SELECT LOWER('SQL Course')
    FROM DUAL;

-- 4) Selects and displays employee id, first name, and last names of employees
-- with uppercase first name 'KAREN'
SELECT employee_id, first_name, last_name
    FROM HR.employees
    WHERE UPPER(first_name) = 'KAREN';

-- 5) Displays length of string 'HelloWorld' using dummy table
SELECT LENGTH('HelloWorld')
    FROM DUAL;

-- 6) Displays position of first occurrence of 'l' in 'HelloWorld' starting at
-- position 5 in string using dummy table
SELECT INSTR('HelloWorld','l',5,1)
    FROM DUAL;

-- 7) Right justifies '1234' to length 9 and pads with '*' character
SELECT RPAD(1234,9,'*')
    FROM DUAL;

-- 8) Trim 'l' from 'loyal' using dummy table
SELECT TRIM('l' FROM 'loyal')
    FROM DUAL;

-- 9) Displays employee_id, first_name, last_name and days employeed of
-- employees in job_title 'SA_MAN'
SELECT employee_id, first_name, las_name, SYSDATE - hire_date "Days Employed"
    FROM HR.employees
    WHERE job_id = 'SA_MAN';

-- 10) Displays employee_id, first_name, last_name and months employed of
-- employees in job_title 'SA_MAN'
SELECT employee_id, first_name, last_name,
ROUND(MONTHS_BETWEEN(SYSDATE,hire_date),0) "Months Employed"
    FROM HR.employees;

-- 11) Displays date 6 months from SYSDATE using dummy table
SELECT ADD_MONTHS(SYSDATE,6)
    FROM DUAL;


spool off
