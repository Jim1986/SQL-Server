declare @i int = 100
declare @x int = 1
select @i = ProductID, @x = UnitsInStock
	from Products order by ProductID
select @i, @x


declare @i int = 90
if @i >= 90
begin
	print 'Yes'
	print 'OK'
end
else
begin
	print 'No'
end