show databases ;
show tables from db_school;

drop database if exists db_school;
create database db_school;

drop table if exists db_school.student;
create table db_school.student(
  -- 字段名 数据类型 【数据的范围】 [约束] 注释，primary key不能取空值
  Id int auto_increment primary key comment 'id pk',
#auto_increament自动增加
  sno varchar(255) unique comment '学号',
  name varchar(10) comment '学生姓名',
  age int(2) comment '年龄',
  height double(3,2) comment '身高',
  dob date comment '出生年月日 Date of Birth',
  departmentId int comment '院系ID'
) comment '学生表';
select * from db_school.student;
desc db_school.student;-- desc:describe

insert into db_school.student value (null,'1901','LIly',21,1.70,'1998-03-04',1);
insert into db_school.student value (null,'1902','Tom',22,1.71,'1997-04-14',2);
insert into db_school.student value (null,'1903','MaSu',21,1.58,'1998-05-25',3);

update db_school.student
set  dob='2000-4-1'
where sno='1901';

drop table if exists db_school.department;
create table db_school.department(
  Id int auto_increment primary key comment 'id pk',
  title varchar(255) comment '院系名称',
  tel varchar(255) comment '院系电话'
)comment '院系表';

insert into db_school.department value (null,'cs','010-123456');
insert into db_school.department value (null,'ss','010-123489');
insert into db_school.department value (null,'EE','010-123567');

select * from db_school.department;

#为学生增加外界约束
alter table db_school.student
  add constraint
    student_fk_departmentId   #自己取的
    foreign key (departmentId)
      references db_school.department (id);

desc db_school.student;-- desc:describe

select  s.name,d.title
from db_school.student s
inner join db_school.department d
on d.id=s.departmentId;

drop database db_school;
show databases ;
