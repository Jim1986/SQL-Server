use Northwind
drop procedure usp_prodList
go
create procedure usp_prodList
	@min int,
	@max int
as
	select * from Products
		where UnitPrice between @min and @max
go
execute usp_prodList 10, 12



drop procedure usp_prodList
go
create procedure usp_prodList
	@min int = null, @max int = null
as
	if (@min is null) set @min = 0
	if (@max is null)
		select @max = Max(unitPrice) from Products
	select * from Products
		where UnitPrice between @min and @max
go
execute usp_prodList 10, 12
execute usp_prodList @max=20 , @min=15
