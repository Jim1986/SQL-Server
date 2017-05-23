use Northwind

select 
	(
	case
		when ProductID % 2 = 1 then ProductID
	end
	) as printNum 
from Products
order by ProductID ASC

select 
	(
	case
		when ProductID % 2 = 0 then ProductID
	end
	) as printNum 
from Products
order by ProductID ASC



select ProductID, ProductName,
	case when ProductID % 2 = 0 then 0 else 1 end as Test
	from Products
	order by
	(
	case
		when ProductID % 2 = 0 then 0
		else 1
		end
	) DESC
go