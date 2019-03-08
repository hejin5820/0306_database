delete from db_school.student;

show full columns from db_school.student;
show full tables from db_school;
show variables like 'char%';
show variables like 'coll%';

select * from scott.emp;
drop table db_school.student;

select empno,hiredate  -- 查询语句的投影操作
from scott.emp;

select distinct job from scott.emp;
select *
from scott.emp
# where SAL>2000 ;
# where SAL<>3000;-- 不等于3000
where SAL<>3000 and JOB<>'salesman';

select *    -- 分页查询
from scott.emp
# limit 3 offset 0;-- offset 偏移量，从第一条开始查三条
limit 3 offset 9;-- 查询10,11,12
# limit 0,3;-- 简写，建议上面那种方法

select ENAME
from scott.emp
# where ENAME not like 'a%s';
# where ENAME like '_cott';
where ENAME like '%\_%' escape '\\';-- %_%:都出来了，至少有一个字符
-- %\_%

update scott.emp
set ENAME='sco_tt'where
ENAME = 'scott';

update scott.emp
set ENAME='scott'where
    ENAME = 'sco_tt';

select *
from scott.emp
# where JOB='salesman'or JOB='manager'or JOB='persident';
where JOB in ('salesman','manager','president');

select *
from scott.emp
# where SAL >=2000 and SAL <=3000;
where SAL between 2000 and 3000;-- 闭区间

select ENAME AS 员工姓名  -- 给列名改名，员工 姓名中间不能加空格，除非‘员工 姓名’
from scott.emp;
select e.ename as '员工 姓名'
from scott.emp as e;

select *
from scott.emp
where COMM is null;-- 或者is not null

update scott.emp
set COMM = null
where EMPNO='7499';-- DML 将编号为7499的员工的奖金设为null

select ename,sal+ifnull(comm,0) -- 如果奖金不为空，sal+comm，奖金为空，sal+0
from scott.emp;

select * from scott.dept;

select e.* ,d.*
from scott.emp e
  inner join scott.dept d; -- 内连接
  -- 52条数据，emp有13条，dept有4条，13*4

select e.* ,d.*
from scott.emp e
       inner join scott.dept d
on e.DEPTNO=d.DEPTNO; -- 内连接

select e.ENAME ,e.DEPTNO,d.DNAME,d.DEPTNO
from scott.emp e
       inner join scott.dept d -- 内连接
#                   on e.DEPTNO=d.DEPTNO;
         using (depton);-- 仅限于两个表格中名字相同的
-- 12个人，少了一个boss因为他的部门号是null

select e.ENAME , d.DNAME , e.JOB
from scott.emp e left outer join scott.dept d
on e.DEPTNO = d.DEPTNO-- 左外连接，显示某一个表的落选记录

union

select e.ENAME ,d.DNAME , e.JOB
from scott.emp e right outer join scott.dept d
  on e.DEPTNO = d.DEPTNO;-- 右外链接

