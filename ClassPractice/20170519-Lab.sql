/* 010 
  �T�w���}���O Northwind ��Ʈw */
use Northwind
go

/* 110 
  �мg�@�D���O, �C�X:
  products ��ƪ��Ҧ����~���
 */ 
 select * from products


/* 120 
  �мg�@�D���O. �C�X:
  products ��ƪ��Ҧ����~, ���C��Ʈ�, �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
from products

/* 130 
  �мg�@�D���O, �C�X:
  products ��ƪ� "�w�s�q�C��A�q�ʶq" �����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 from products
 where UnitsInStock < ReorderLevel
 go

/* 140 
  �мg�@�D���O, �C�X:
  products ��ƪ� (�w�s�q + �q�ʤ��ƶq) �C��A�q�ʶq�����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 from Products
 where (UnitsInStock + UnitsOnOrder) < ReorderLevel
 go


/* 150 
  �мg�@�D���O, �C�X:
  products ��ƪ� "�w�s�q�C��A�q�ʶq" �����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���
  SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel

  �åB, �ۦP�����ӥN��(SupplierID)�����~�бƦb�@�_
 */ 
 select SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 from products
 order by supplierID asc   /* desc */
 go




/* 160 
  �мg�@�D ���O �C�X:
  products table ���~�W�٥H C �}�Y�����
 */ 
 select * 
 from products
 where productName like '[B-e]%'
go

/* 170 
  �мg�@�D���O, �C�X:
  products ��ƪ����O�s��(CategoryID)�� 1, 4, 8 �����~���
  �ƧǮ�, �Ы�"���O�s��"�Ƨ�, �ۦP���O�s�������~�����~�W��(ProductName)�ƦC
 */ 
 select *
 from products
 where CategoryID IN ( 1, 4, 8)
 order by categoryID desc , ProductName asc
 go



/* 180 
  �мg�@�D���O, �C�X:
  products ��ƪ�������� 10 �� 20 ������(�]�t 10, 20)�����~���
  �åB���ӳ��(UnitPrice)�Ѥj��p�Ƨ�
 */ 
 select *
 from products
 where UnitPrice between 10 and 20
 order by UnitPrice desc
 go


/* 190 
  �мg�@�D���O, �C�X:
  products ��ƪ��Ҧ����~, ���C��Ʈ�, 
  �ЦC�X�H�U���
  ProductID, ProductName, UnitPrice, 

  ���L, �U���W�ٽХΤ������:
  ���~�s��, ���~�W��, ���
 */ 






-- 210 �ЦC�X����̰����e�T�����~�C
use Northwind
select top 3 with ties CategoryID, ProductID, ProductName, UnitPrice
	from Products
	order by UnitPrice Desc




-- 220 �ЦC�X���~����������C
--use Northwind
select * from Products
select avg(UnitPrice) from products




-- 230 �ХH���O�s��(CategoryID)���� 1, 4, 8 ���p��d��, �p�ⲣ�~����������C
select * from products
select * from products

select avg(UnitPrice) from Products
where CategoryID IN ( 1, 4, 8)



-- 240 �ЦC�X�U�����~����������C

select CategoryID, avg(UnitPrice) 
	from Products
	group by CategoryID


-- 250 �ЦC�X��������̰����e�T�����~�C

select CategoryID, avg(UnitPrice) as avgprice 
	from Products
	group by CategoryID


/* 310
  �мg�@�D���O, �C�X products ��ƪ��H�U���
  ProductID, ProductName, SupplierID
 */ 
 select ProductID, ProductName, SupplierID 
 from Products



/* 320
   �P�W, ���Ф@�֦C�X�Ө����ӦW��(CompanyName)�B
   �p���q��(Phone)�B�p���H(ContactName)�n��?
   �t�~, �ۦP�����Ӫ���ƽЦC�b�@�_
 */ 
 select ProductID, ProductName, s.SupplierID, S.CompanyName, S.Phone, S.ContactName
	from Products P join Suppliers S on P.SupplierID = S.supplierID
	order by P.SupplierID





/* 330
   �ڷQ�C�X�u�Ҧ��v�����ӥثe�U�۴��ѧڭ̭��ǲ��~��ƪ���Ӫ�,
   �ثe�S���ѧڭ̲��~�������Ӥ]�n�C�X

   <note>
   �U���O�e, �Х�����U�C���O:
   -- begin --
   insert into suppliers
     (CompanyName, ContactName, Phone)
      values
     ('Taiwan First', 'A-Ban', '(001) 000-0001')
   -- end --
 */ 




-- (Optional)
-- 340 �ЦC�X���u�Ψ���u���ݦ���]ReportsTo�^���M��C




/* 410
  �ЦC�X�U�����~�����O�B�s���B�~�W�B����B
  �������~��������B����P���~����������u���t�v�C
*/
-- select * from Suppliers
use Northwind
go

select CategoryID,AVG(UnitPrice) from Products group by CategoryID

s


/* 420
   �ЦC�X���q�ĤT�����~���q��C
*/





/* 430
  �ЦC�X��o�̦n�e�T�����~�C
*/




use Northwind
go

/* 500 
  1. �H SQL Enterprise Manager �˵� Shippers table �����w�q
  2. �мg�@�D���O, �s�W�@���B�餽�q����ƨ� Shippers table
     Shippers(CompanyName): Never Lose
     �q��(Phone): (040) 0048126
  ���椧��, �T�{�@�U�����s�[�J���B�餽�q, �s���O�X��?
 */ 
 use northwind
 go
 select * from shippers
INSERT INTO Shippers (CompanyName, Phone)
Values ('Never Lose', '(040) 0048126')
select @@IDENTITY
INSERT INTO Shippers (CompanyName, Phone)
Values ('Test7', '(040)022222222244')



select * into #custTest from Shippers
select * from #custTest



/* 510 
  �мg�@�D���O, �N��~���� Never Lose �����q�W��(CompanyName)�令
  'Never Lost', �q��(Phone)�令'(123) 1234567', 
 */ 
 select * from Shippers
 update shippers
 set CompanyName = 'No.9',
	 Phone = '04-12345678'
 where ShipperID = '9'
 Go

Delete from Shippers
Where ShipperID = '5'
select * from Shippers
select * from #custTest

Delete from #custTest
Where ShipperID = '3'
Select * from #custTest

use northwind
select * into #customerTest from Customers
select * from #customerTest
delete from #customerTest
where CustomerID IN ('A%')


/* 520
  �мg�@�D���O, �N���~���O(CategoryID) = 1 �����~���(products) 
  �����(UnitPrice)�հ��ʤ��� 5, ��l���O����
 */ 





/* 530
  �藍�_, ���p�������F, ���O���~���O(CategoryID) = 1 ��..., ����!?
  �A�w�g��F...., hmmm..., �i�H�·нЧA��^�Ӷ�?
 */ 





/* 540
  �мg�@�D���O �R����~���� Never Lost �B�餽�q�����
 */ 





