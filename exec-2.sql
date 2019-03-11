# 1. 返回拥有员工的部门名、部门号
select distinct d.DNAME, d.DEPTNO
from scott.emp e
       join scott.dept d
where e.DEPTNO = d.DEPTNO;
# 2. 工资多于 scott 的员工信息
select *
from scott.emp
where SAL > (select SAL from scott.emp where ENAME = 'scott');
# 3. 返回员工和所属经理的姓名?
select e.ENAME, e.MGR, m.ename
from scott.emp e
       right outer join scott.emp m on e.EMPNO = m.MGR;
# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
select e.ename, e.HIREDATE, m.ename, m.HIREDATE
from scott.emp e
       inner join scott.emp m
         on e.mgr = m.empno
where e.hiredate < m.HIREDATE;
# 5. 返回员工姓名及其所在的部门名称
select e.ENAME, d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;
# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
select e.ENAME, d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO and e.JOB = 'clerk';
-- on e.DEPTNO = d.DEPTNO where e.JOB='clerk';
# 7. 返回部门号及其本部门的最低工资
select DEPTNO, min(SAL)
from scott.emp
group by DEPTNO;
# 8. 返回销售部 sales 所有员工的姓名
select e.ENAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO where d.DNAME = 'sales';
# 9. 返回工资多于平均工资的员工
select *
from scott.emp
where SAL>(select avg(SAL) from scott.emp);
# 10. 返回与 scott 从事相同工作的员工
select *
from scott.emp
where JOB=(select JOB from scott.emp where ENAME='scott');
# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
select ENAME,SAL
from scott.emp
where SAL>(select avg(SAL) from scott.emp where DEPTNO=30);
# 12. 返回工资高于30部门所有员工工资的员工信息
select ENAME,SAL
from scott.emp
where SAL>(select max(SAL) from scott.emp where DEPTNO=30);
# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
select d.DEPTNO,d.DNAME,d.LOC,count(e.DEPTNO)number
from scott.emp e
inner join scott.dept d
where e.DEPTNO=d.DEPTNO
group by d.DEPTNO;
# 14. 返回员工的姓名、所在部门名及其工资
select emp.ENAME, dept.DNAME,emp.SAL
from scott.emp inner join scott.dept
on emp.DEPTNO = dept.DEPTNO;
# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
select *
from scott.emp e
inner join scott.emp m
on e.JOB=m.JOB;
# 16. 返回员工的详细信息，包括部门名
select emp.* , dept.DNAME
from scott.emp
            inner join scott.dept;
# 17. 返回员工工作及其从事此工作的最低工资
select JOB,min(SAL) minsal
from scott.emp
group by JOB;
# 18. 返回不同部门经理的最低工资
select job,min(SAL)
from scott.emp
where JOB='manager'
group by DEPTNO ;
# 19. 计算出员工的年薪，并且以年薪排序
select ENAME,sal*12 yearsal
from scott.emp
order by sal*12;
# 20. 返回工资处于第 4 级别的员工的姓名
select e.ENAME,s.GRADE,e.SAL
from scott.emp e
inner join scott.salgrade s
where e.SAL>s.LOSAL and e.SAL<s.HISAL and
      s.GRADE=4;