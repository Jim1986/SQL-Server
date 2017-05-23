use Northwind
go

create table t1
	(
	id int primary key,
	data varchar(20)
	)
select * from t1
go

insert into t1(id, data) values( 01, 123456789)

create table t2
	(
	id int primary key,
	data varchar(20)
	)
select * from t2
go

create trigger trigger1
	on t1 for insert
as
	insert into t2 select * from inserted
go

drop trigger trigger1
drop table t1
drop table t2
go


exec sp_depends trigger1       ---查詢相關與否
create view vTestT1 as select * from t1
exec sp_depends t1