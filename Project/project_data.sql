set linesize 77

spool project_data.txt

select * from ppas.office;
select * from ppas.staff;
select * from ppas.assignments;
select * from ppas.taxi;
select * from ppas.job;
select * from ppas.business;
select * from ppas.private;
select * from ppas.contract;

spool off
