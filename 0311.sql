create table scott.new_emp
select *
from scott.emp; -- 建表

select *
from scott.new_emp; -- 可以用于备份

delete
from scott.new_emp; -- 删除表内的内容
drop table scott.new_emp; -- 删除表格
show tables from scott;

insert into scott.new_emp
  (empno, ename, job)
select EMPNO, ENAME, JOB
from scott.emp;

select *
from scott.new_emp;

create or replace view scott.v_emp
as
select ename, empno, job
from scott.emp
where DEPTNO = 30;

select *
from scott.v_emp;

select *
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;

create or replace view scott.v_name
as
select e.EMPNO, e.ename, d.dname
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO
where ENAME = 'allen';

select *
from scott.v_name;
# where ename='allen';

-- sal> scoot员工 sal?
select *
from scott.emp
where ENAME = 'scott';

select *
from scott.emp
where SAL > (select sal
             from scott.emp
             where ENAME = 'scott');
-- sub query子查询


-- DML
start transaction; -- 开始事务
delete
from scott.emp
where ENAME = 'allen';

savepoint a;    -- 添加保留点a，保留上面那个语句的内容

update scott.emp
set SAL=2000
where ENAME='martin';

savepoint b;    -- 添加保留点b

delete from scott.emp;

select *
from scott.emp;

rollback to a;
rollback to b;

rollback;-- 回滚，语句将回到事物开始之初
commit;-- 提交，就回滚不了了

-- DDL语句:可以隐式的提交一次事务，所以不能回滚了
create table scott.test(
  id int
);

# select DEPTNO,avg(SAL)
# select sum(SAL)
# select min(SAL),max(SAL)
select DEPTNO,count(COMM)
# select min(ENAME)
from scott.emp
group by DEPTNO;

select JOB,max(HIREDATE)
from scott.emp
group by JOB
having JOB in ('clerk','manager');      -- 组检索 / where 行检索 / 投影 列检索

select abs(-1);
select bin(-1);
select pi();
select rtrim('   test   ');
select ltrim('   test   ');
select trim('   test   ');

select lower(ename)  -- 查询语句不能改数据、
from scott.emp;

update scott.emp
set ENAME = lower(ename);

select *
from scott.emp;

select current_date;
select now();

select date_add(now(), interval 1 year);
select dayofweek('2019-3-16');
select week(now());
select year(now());
