drop database if exists db_a;
create database db_a;

drop table if exists db_a.user;
create table db_a.user
(
  id       int auto_increment primary key comment '序号',
  username varchar(255) not null comment '管理员用户名',
  password varchar(255) not null comment '管理员密码',
  role     int(1)       not null default 0 comment '0代表学生，1代表管理员'
  -- 如果给表中的某个字段添加了default约束，当向表中插入记录数据时，该字段如果不指定值，则系统自动填充default指定的值。
) comment 'user table';

drop table if exists db_a.activity;
create table db_a.activity
(
  id    int auto_increment primary key comment 'id pk',
  title varchar(255) not null comment '活动名称'
) comment 'activity table';

drop table if exists db_a.enroll;
create table db_a.enroll
(
  id         int auto_increment primary key comment 'id pk',
  time       datetime not null default now() comment 'enroll time NN',
  userld     int      not null comment 'user id fk',
  activityId int      not null comment 'activity id FK'
) comment 'enroll table';

alter table db_a.enroll
  add constraint
    enroll_fk_userId
    foreign key (userld)
      references db_a.user (id);

alter table db_a.enroll
  add constraint
    enroll_fk_activityId
    foreign key (activityId)
      references db_a.activity (id);

-- add admin
insert into db_a.user value (null, 'admin', md5('1123'), 1);

-- admin sign in 'xxx' ,'yyy'
select *
from db_a.user
where username = 'admin'
  and password = md5('123');

-- creat activity
insert into db_a.activity value (null, '植物园一日游');
insert into db_a.activity value (null, '动物园一日游');

-- delete（清除之后，序号不从1开始）
delete
from db_a.activity
where id = 1;

-- updata(更改)
update db_a.activity
set title=' '
where id = 1;

-- retrieve
select *
from db_a.activity;

-- student sign up
insert into db_a.user(username, password) value ('Tom', md5('abc'));
insert into db_a.user(username, password) value ('Jerry', md5('def'));
insert into db_a.user(username, password) value ('Teter', md5('gkl'));

-- student sign in 'xxx','yyy'
select *
from db_a.user
where username = 'Tom'
  and password = md5('abc');

select *
from db_a.user
where username = 'Jerry'
  and password = md5('def');

-- student enroll
insert into db_a.enroll(id, userld, activityId) value (null, 2, 1);
insert into db_a.enroll(id, userld, activityId) value (null, 3, 2);

-- admin sign in retrieve
select u.username,a.title
from db_a.user u
       inner join db_a.enroll e
                  on u.id = e.userld
       inner join db_a.activity a
                  on e.activityId = a.id;

select u.username,a.title
from db_a.user u
       inner join db_a.enroll e
                  on u.id = e.userld
       inner join db_a.activity a
                  on e.activityId = a.id
where a.id=1;

select *
from db_a.user;
select *
from db_a.activity;
select *
from db_a.enroll;




-- 清除表的数据，序号从头开始
set foreign_key_checks = 0;
set foreign_key_checks = 1;
truncate db_a.user;
-- 事务控制不了他，不能回滚，参考0311.sql

-- rm -f * 强制删除
