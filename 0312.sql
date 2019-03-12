-- 显示索引
show index from scott.emp;
-- my SQL 当中，primary key (主键)& foreign key 默认为索引
-- 创建索引
create index idx_ename on scott.emp(ENAME);
-- 删除索引
drop index idx_ename on scott.emp;

