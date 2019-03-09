# 1. 返回拥有员工的部门名、部门号
select distinct d.DNAME , d.DEPTNO
from scott.emp e join scott.dept d
where e.DEPTNO = d.DEPTNO;
# 2. 工资多于 scott 的员工信息
select * from scott.emp where SAL>(select SAL from scott.emp where ENAME='scott');
# 3. 返回员工和所属经理的姓名?
select e.ENAME,e.MGR , m.ename from scott.emp e right outer join scott.emp m on e.EMPNO=m.MGR;
# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
select e.ename,e.HIREDATE, m.ename ,m.HIREDATE from scott.emp e inner join scott.emp m on e.mgr = m.empno where e.hiredate < m.HIREDATE;
# 5. 返回员工姓名及其所在的部门名称
select e.ENAME,d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;
# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
select e.ENAME,d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO and e.JOB='clerk';