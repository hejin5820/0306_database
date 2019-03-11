drop database if exists db_csdn;
create database db_csdn;

drop table if exists db_csdn.user;
create table db_csdn.user(
  id int auto_increment primary key comment 'id PK',
  username varchar(255) not null comment 'usernameNN',
  password varchar(255) not null comment 'password NN',
  email varchar(255) not null comment 'email NN'
)comment 'user table';

load data local infile 'e:/csdn.txt'
into table db_csdn.user
  fields terminated by '♥'
  (username,password,email)
    set id=null;

select *
from db_csdn.user;

select password,count(password)
from db_csdn.user
group by password
order by 2 desc   -- 2的含义是以count为标准降序，如果写1则是以password为标准排序
limit 10 offset 0;    -- 以第1条为基础，查询10条