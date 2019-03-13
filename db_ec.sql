drop database if exists db_ec;
create database db_ec;
show databases ;

drop table if exists db_ec.user;
create table db_ec.user
(
  id       int auto_increment primary key comment '序号',
  username varchar(255) not null comment '用户名',
  password varchar(255)  not null comment '用户密码'
) comment 'user table';
insert into db_ec.user values (null, 'Jerry', md5('12345')),
                              (null, 'Tom', md5('567889'));
select *
from db_ec.user;

drop table if exists db_ec.product;
create table db_ec.product
(
  id    int auto_increment primary key comment '商品序号',
  title varchar(255) not null comment '商品名称',
  price varchar(255) not null comment '商品价格'
) comment 'product table';
insert into db_ec.product values (null,'连衣裙',123),
                                 (null,'鞋子',300);
select *
from db_ec.product;

drop table if exists db_ec.order;
create table db_ec.order
(
  id        int auto_increment primary key comment 'id pk',
  productId int not null comment '产品Id号',
  userId    int not null comment '用户Id号'
) comment 'order table';
insert into db_ec.order values (null,1,2),
                               (null,2,1);
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
select u.username,p.title
from db_ec.user u
       inner join db_ec.order o
                  on u.id = o.userId
       inner join db_ec.product p
                  on p.id=o.productId;
