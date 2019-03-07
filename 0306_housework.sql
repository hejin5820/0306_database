show databases ;

drop database if exists db_school;
create database db_school ;
show tables from db_school ;

drop table if exists db_school.student;
create table db_school.student(
  id int auto_increment primary key comment 'id pk',
  number varchar(10) unique comment '学号' ,
  name varchar(20)comment '姓名' ,
  sex varchar(10) comment '性别' ,
  age int(2) comment '年龄' ,
  dob date comment '出生年月日',
  courseId int comment '课程ID'
) comment '学生表';
insert into db_school.student value (null,'1901','LIly','male',21,'1998-03-04',1);
insert into db_school.student value (null,'1902','Tom','female',22,'1997-04-14',3);
insert into db_school.student value (null,'1903','MaSu','male',21,'1998-05-25',2);

select * from db_school.student;

drop table if exists db_school.course;
create table db_school.course(
  id int auto_increment primary key comment 'id pk',
  title varchar(20) comment '课程内容',
  teacher varchar(20) comment '教师名字'
) comment '课程';
insert into db_school.course value (null,'math','Mr wang');
insert into db_school.course value (null,'chinese','Mr Li');
insert into db_school.course value (null,'English','Mr Xue');
select * from db_school.course;

create table db_school.sc(
   sn varchar(20) comment '学生姓名',
   title varchar(20) comment '课程内容',
   teacher varchar(20) comment '教师名字'
) comment '选课';
insert into db_school.sc value ('LIly','math','Mr wang');
insert into db_school.sc value ('Tom','chinese','Mr Li');
insert into db_school.sc value ('MaSu','English','Mr Xue');
select * from db_school.sc;

alter table db_school.student
  add constraint
student_fk_courseId
foreign key (courseId)
references db_school.course (id);

select s.name,c.title,c.teacher
from db_school.student s
inner join db_school.course c
on  c.id =s.courseId;

drop database db_school;