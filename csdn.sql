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

show full tables from db_csdn;
-- 提高速度(如果index只有好处，没有必要存在这个概念)，
-- 索引的创建一定要谨慎,列上有较多相同的值不建议创建索引
-- 索引会降低删除和更新速度，占用空间
create index ind_password on db_csdn.user(password);-- 442368 kb
create index ind_username on db_csdn.user(username);
create index ind_email on db_csdn.user(email);
show index from db_csdn.user;
-- 删除索引
drop index ind_password on db_csdn.user;
drop index ind_username on db_csdn.user;
drop index ind_email on db_csdn.user;
-- 这样运行接下来的命令，速度就会快很多
-- 排名前十的密码
select password,count(password)
from db_csdn.user
group by password
order by 2 desc   -- 2的含义是以count为标准降序，如果写1则是以password为标准排序
limit 10 offset 0;    -- 以第1条为基础，查询10条

-- 排名前十的邮箱
select email,count(email) number
from db_csdn.user
group by email
order by 2 desc
limit 10 offset 0;

select *
from db_csdn.user
limit 100 offset 0;

-- 密码可能是生日的数据
select password
from db_csdn.user
where password regexp '^\198[0-9]{1}[0-9]{1,2}[0-9]{1,2}$';-- rlike 正则表达式
