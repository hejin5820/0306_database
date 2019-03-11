create table scott.new_emp
select * from scott.emp;  -- 建表

select *
from scott.new_emp;  -- 可以用于备份

delete  from scott.new_emp;
show tables from scott;

insert into scott.new_emp
(empno, ename, job)
select EMPNO,ENAME,JOB
from scott.emp;

select *
from scott.new_emp;

create or replace view scott.v_emp
as
  select ename,empno,job
from scott.emp
where DEPTNO=30;

select *
from scott.v_emp;

select *
from scott.emp e
inner join scott.dept d
on e.DEPTNO=d.DEPTNO;

create or replace view scott.v_name
as
  select e.EMPNO,e.ename,d.dname
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO=d.DEPTNO
where ENAME='allen';
select *
from scott.v_name;
# where ename='allen';