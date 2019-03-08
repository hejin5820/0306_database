show databases ;
# show tables from db_school;

drop database if exists db_school;
create database db_school;

drop table if exists db_school.student;
create table db_school.student(
  -- 字段名 数据类型 【数据的范围】 [约束] 注释，primary key不能取空值
  Id int auto_increment primary key comment 'id pk',
#auto_increament自动增加
  sno varchar(255) unique comment '学号',
  gender varchar(255) default 'male' comment '性别',
  name varchar(10) comment '学生姓名',
  age int(2) comment '年龄',
  height double(3,2) comment '身高',
  dob date comment '出生年月日 Date of Birth',
  departmentId int comment '院系ID'
) comment '学生表';
select * from db_school.student;
desc db_school.student;-- desc:describe
alter table db_school.student auto_increment=20;

insert into db_school.student value (null,'1901','male','LIly',21,1.70,'1998-03-04',1);
insert into db_school.student value (null,'1902',null,'Tom',22,1.71,'1997-04-14',2);
insert into db_school.student value (null,'1903',null,'MaSu',21,1.58,'1998-05-25',3);
insert into db_school.student(sno,name,age,height) value ('1904','xiao',21,1.80);

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
    student_fk_departmentId   #自己取的  表名+fk（外界）+列名
    foreign key (departmentId)     # 外界约束
      references db_school.department (id);# 引用

desc db_school.student;-- desc:describe

delete from db_school.department
where Id=2;
# 在上面学生使用了这个Id所以不能删除，可以删除学生没有选的院系
# 同样的想要删除院系表，因为学生表有用院系表，所以不能删除
select  s.name,d.title
from db_school.student s
inner join db_school.department d
on d.id=s.departmentId;

# set foreign_key_checks =1;#临时禁用外界约束，接下来就可以删除表格了 =1就是启用了
# -- view Toolwindows
# drop table db_school.student;
# drop table db_school.department;
# drop database db_school;
# show databases ;
