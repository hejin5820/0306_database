-- SQL 命令式
# Ctrl+Enter
show databases ;
create database db_school;
show tables from  db_school;
# use db_school;使用这句话后，下面一行的db_school,school,不用写.之前的。一般不推荐用
create table db_school.student(
  -- 字段名 数据类型 【数据的范围】 [约束] 注释，
  sno varchar(255) unique comment '学号',
  name varchar(10) comment '学生姓名',
  age int(2) comment '年龄',
  height double(3,2) comment '身高',
  dob date comment '出生年月日 Date of Birth'
) comment '学生表';

show full columns from db_school.student;# 可以展示数据的含义，例如dob的含义
select  *
from db_school.student;
insert into db_school.student value ('001','Tom',19,1.75,'2000-01-24');
insert into db_school.student value ('002','Jerry',17,1.55,'2001-02-04');
insert into db_school.student value ('003','Tester',18,null,'2002-03-14');
update db_school.student
set age = 20
where sno = '001';

delete
from db_school.student
where sno = '001';
drop table db_school.student;
drop database db_school;

select 1 /*hello mysql*/+1;
