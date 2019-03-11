drop database if exists db_ip;
create database db_ip;

drop table if exists db_ip.ip;
create table db_ip.ip(
  id int auto_increment primary key comment 'id pk',
  min varchar(255) not null comment 'min ip NN',
  max varchar(255) not null comment 'max ip NN',
  loc varchar(255) not null comment 'location NN'
  ) comment 'ip';

load data local infile 'e:/ip.txt'
into table db_ip.ip
fields terminated by '|'
  (min,max,loc)
set id=null;

update db_ip.ip
set min=trim(min),
    max=trim(max),
    loc=trim(loc);-- 删除空格，trim裁剪

select *
from db_ip.ip;

select inet_aton('166.111.3.123');  -- inet:internet aton: adress to number
select inet_ntoa('2792293243');

select *
from db_ip.ip
where inet_aton('166.111.3.123')between inet_aton(min) and inet_aton(max);
