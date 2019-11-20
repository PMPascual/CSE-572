-- Phillip Pascual
-- CSE 572
-- Spring 2019
-- Lab08A Query
-- Report script for #4

SET LINESIZE 80
SET PAGESIZE 60
SET PAUSE OFF
SPOOL lab08aQueryReportOutput_Phillip.txt

SET FEEDBACK OFF
TTITLE CENTER 'JOB REPORT' SKIP 1 CENTER 'As of ' _DATE
BTITLE CENTER 'Page:'SQL.PNO
BREAK ON job_id
COLUMN job_id HEADING 'Job|Category'
COLUMN count(job_id) HEADING '# of|Employees'
COLUMN avg(salary) HEADING 'Average|Salary' FORMAT $99,999.99
COLUMN min(salary) HEADING 'Minimum|Salary' FORMAT $99,999.99
COLUMN max(salary) HEADING 'Maximum|Salary' FORMAT $99,999.99
COLUMN sum(salary) HEADING 'Total|Salary' FORMAT $999,999.99
--
SELECT job_id, count(job_id), avg(salary), min(salary), max(salary), sum(salary)
    FROM hr.employees
    GROUP BY job_id
    ORDER BY job_id;

SET FEEDBACK ON
CLEAR BREAK
COLUMN job_id CLEAR
COLUMN avg(salary) CLEAR
COLUMN min(salary) CLEAR
COLUMN max(salary) CLEAR
COLUMN sum(salary) CLEAR
SPOOL OFF
SET PAUSE ON
