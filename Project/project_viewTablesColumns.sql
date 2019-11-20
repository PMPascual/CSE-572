COLUMN table_name FORMAT A20
COLUMN column_name FORMAT A20
COLUMN comments FORMAT A40 WRAPPED
SET LINESIZE 132
SET PAGESIZE 55
SPOOL project_comments.txt

SELECT table_name, comments
 FROM user_tab_comments
 WHERE table_name IN ('OFFICE','STAFF','ASSIGNMENTS', 'TAXI', 'JOB', 'BUSINESS', 'PRIVATE', 'CONTRACT' )
 ORDER BY table_name;

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'OFFICE';

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'STAFF';

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'ASSIGNMENTS';

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'TAXI';

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'JOB';

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'BUSINESS';

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'PRIVATE';

SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'CONTRACT';

SPOOL OFF
