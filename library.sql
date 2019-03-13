drop database if exists db_l;
create database db_l;
show databases ;

drop table if exists db_l.user;
create table db_l.user
(
  id       int auto_increment primary key comment '序号',
  username varchar(255) not null comment '管理员用户名',
  password varchar(255) not null comment '管理员密码',
  role     int(3)       not null default 0 comment '0代表学生，1代表管理员'
) comment 'user table';
-- add admin
insert into db_l.user value  (null,'admin', md5('1123'),1);

-- admin sign in 'xxx' ,'yyy'
select *
from db_l.user
where username = 'admin'
  and password = md5('123');
select *
from db_l.user;

drop table if exists db_l.student;
create table db_l.student
(
  id        int auto_increment  primary key comment '序号',
  sno       varchar(255) not null comment '学号',
  name      varchar(255) not null comment '学生用户名',
  password  varchar(255) not null comment '密码',
  startdata date         not null comment '借书日期',
  lastdata  date         not null comment '最晚归还日期'
) comment 'user table';
-- student sign up
insert into db_l.student value (null, '1801', 'Tom', md5('abc'), '2019-2-28', '2019-3-28');
insert into db_l.student value (null, '1803', 'Jerry', md5('def'), '2019-3-13', '2019-4-13');
-- student sign in 'xxx','yyy'
select *
from db_l.student
where name = 'Tom'
  and password = md5('abc');

select *
from db_l.student
where name = 'Jerry'
  and password = md5('def');
select *
from db_l.student;

drop table if exists db_l.book;
create table db_l.book
(
  id       int auto_increment primary key comment 'id pk',
  booksno  varchar(255) not null comment '书编号',
  bookname varchar(255) not null comment '书名'
) comment 'db_l.book';
insert into db_l.book
values (null, '01-1', '《平凡的世界》'),
       (null, '01-2', '《辛亥革命》');
select *
from db_l.book;

drop table if exists db_l.enroll;
create table db_l.enroll
(
  id     int auto_increment primary key comment 'id pk',
  sId varchar(255) not null comment 'sId',
  bookId varchar(255) not null comment 'bookId'
) comment 'enroll table';
insert into db_l.enroll values (null,1,2),
                               (null,2,1);
select *
from db_l.enroll;

-- admin sign in retrieve
select s.name,s.startdata,s.lastdata,b.bookname
from db_l.student s
       inner join db_l.enroll e
                  on s.id=e.sId
       inner join db_l.book b
                  on b.id=e.bookId;





