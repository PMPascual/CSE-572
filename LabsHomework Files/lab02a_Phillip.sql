-- lab: lab02-A
-- Name: Phillip Pascual
-- set 75 characters per line
SET linesize 75
-- output queries result to text file
spool lab02AOutput_Phillip.txt
-- note each sql query has at least one coment line
-- to describe what the query is expected to produce

--list available tables from HR user
SELECT table_name
    FROM all_tables
    WHERE owner = 'HR';

SELECT DISTINCT owner
    FROM all_tables;

DESC HR.jobs;

SELECT job_id Jobs 
    FROM HR.jobs;

SELECT job_id Jobs, job_title Title 
    FROM HR.jobs;

SELECT job_title "Job Title", min_salary Salary,
       min_salary*1.2 "120% Minimum Salary"
    FROM HR.jobs;

SELECT job_title "Job Title", (min_salary + max_salary)/2 "Avg. Salary"
    FROM HR.jobs;

SELECT employee_id "ID", last_name || ', ' || first_name "Last Name, First Name"
    FROM HR.employees;

SELECT last_name, commission_pct
    FROM HR.employees;
-- stop sending output to file
spool off
