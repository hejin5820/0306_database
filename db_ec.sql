drop database if exists db_ec;
create database db_ec;
show databases;

-- user table
drop table if exists db_ec.user;
create table db_ec.user
(
  id       int auto_increment primary key comment '序号',
  email    varchar(255) not null unique comment 'email  UN  NN',-- UN:unique  NN:not null
  password varchar(255) not null comment '用户密码 NN',
  mobile   varchar(255) not null unique comment 'tel number NN'
) comment 'user table';
insert into db_ec.user
values (null, 'Jerry', md5('12345')),
       (null, 'Tom', md5('567889'));
select *
from db_ec.user;

-- creat a new table user info
drop table if exists db_ec.user_info;
create table db_ec.user_info
(
  id     int auto_increment primary key comment 'id PK',
  avatar varchar(255) comment 'avatar',
  gender char(2) comment 'gender',
  city   varchar(255) comment 'city',
  userId int comment 'user id pk' -- 两个表关联起来，user 和user info
) comment 'user info table';

-- 创建外键，使两个表关联
alter table db_ec.user_info
  add constraint
    user_info_fk_userId -- table name_fk_column    fk_table name_column  使用第一种，用fk来区分左边是表名，右边是列名
    foreign key (userId)
      references db_ec.user (id);

drop table if exists db_ec.product;
create table db_ec.product
(
  id    int auto_increment primary key comment '商品序号',
  title varchar(255) not null comment '商品名称 NN',
  price decimal(8,2) not null comment '商品价格 NN',   -- 一共八位，整数部分6位，小数2位
  originalprice decimal(8,2) not null comment '商品原始价格 NN',
  -- ... ...
  -- 下面为图片创建了一个表
  -- slidepicture text not null comment 'slidepicture', -- '1.jpg,2.jpg,3.jpg ... ...'
  -- detail pictures
  categoryId int comment 'category id pk'
) comment 'product table';

drop table if exists db_ec.picture;
create table db_ec.picture(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null  unique comment 'title NN UN',
  type int(1)not null comment 'type: 1=slide picture   2=detail picture',
  productId int comment 'product id FK'
);

drop table if exists db_ec.category;
create table db_ec.category(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'title NN',
  picture varchar(255) comment 'category picture',
  categoryId int comment 'parent category id FK'
)comment '商品类别';

alter table db_ec.category
add constraint
categroy_fk_categoryId
foreign key (categoryId)
references db_ec.category(id);

alter table db_ec.product
  add constraint
    product_fk_categoryId
    foreign key (categoryId)
      references db_ec.category(id);

alter table db_ec.picture
  add constraint
    picture_fk_productId
    foreign key (productId)
      references db_ec.product(id);

drop table if exists db_ec.order;
create table db_ec.order(
id int auto_increment primary key comment 'id PK',
title varchar(255) not null comment '商品名称',
picture varchar(255) comment '商品图片',
userId varchar(255) not null comment '用户id',
productId varchar(255) not null comment '产品Id'
)comment '订单';

insert into db_ec.product
values (null, '连衣裙', 123),
       (null, '鞋子', 300);
select *
from db_ec.product;

drop table if exists db_ec.order; -- order 订单
create table db_ec.order
(
  id        int auto_increment primary key comment 'id pk',
  productId int not null comment '产品Id号',
  userId    int not null comment '用户Id号'
) comment 'order table';
insert into db_ec.order
values (null, 1, 2),
       (null, 2, 1);
select *
from db_ec.order;

alter table db_ec.order
  add constraint
    order_fk_userId
    foreign key (userId)
      references db_ec.user (id);

alter table db_ec.order
  add constraint
    order_fk_productId
    foreign key (productId)
      references db_ec.product (id);

-- user sign in 'xxx' ,'yyy'
select *
from db_ec.user
where username = 'Jerry'
  and password = md5('12345');

select *
from db_ec.user
where username = 'Tom'
  and password = md5('567889');

-- admin sign in retrieve
select u.username, p.title
from db_ec.user u
       inner join db_ec.order o
                  on u.id = o.userId
       inner join db_ec.product p
                  on p.id = o.productId;
