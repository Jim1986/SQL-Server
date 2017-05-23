/* 010 
  確定打開的是 Northwind 資料庫 */
use Northwind
go

/* 110 
  請寫一道指令, 列出:
  products 資料表的所有產品資料
 */ 
 select * from products


/* 120 
  請寫一道指令. 列出:
  products 資料表的所有產品, 條列資料時, 請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
from products

/* 130 
  請寫一道指令, 列出:
  products 資料表 "庫存量低於再訂購量" 的產品資料, 條列資料時, 
  請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 from products
 where UnitsInStock < ReorderLevel
 go

/* 140 
  請寫一道指令, 列出:
  products 資料表 (庫存量 + 訂購中數量) 低於再訂購量的產品資料, 條列資料時, 
  請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 from Products
 where (UnitsInStock + UnitsOnOrder) < ReorderLevel
 go


/* 150 
  請寫一道指令, 列出:
  products 資料表 "庫存量低於再訂購量" 的產品資料, 條列資料時, 
  請列出以下欄位
  SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel

  並且, 相同供應商代號(SupplierID)的產品請排在一起
 */ 
 select SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 from products
 order by supplierID asc   /* desc */
 go




/* 160 
  請寫一道 指令 列出:
  products table 產品名稱以 C 開頭的資料
 */ 
 select * 
 from products
 where productName like '[B-e]%'
go

/* 170 
  請寫一道指令, 列出:
  products 資料表之類別編號(CategoryID)為 1, 4, 8 的產品資料
  排序時, 請按"類別編號"排序, 相同類別編號的產品按產品名稱(ProductName)排列
 */ 
 select *
 from products
 where CategoryID IN ( 1, 4, 8)
 order by categoryID desc , ProductName asc
 go



/* 180 
  請寫一道指令, 列出:
  products 資料表之單價介於 10 到 20 元之間(包含 10, 20)的產品資料
  並且按照單價(UnitPrice)由大到小排序
 */ 
 select *
 from products
 where UnitPrice between 10 and 20
 order by UnitPrice desc
 go


/* 190 
  請寫一道指令, 列出:
  products 資料表之所有產品, 條列資料時, 
  請列出以下欄位
  ProductID, ProductName, UnitPrice, 

  不過, 各欄位名稱請用中文顯示:
  產品編號, 產品名稱, 單價
 */ 






-- 210 請列出單價最高的前三項產品。
use Northwind
select top 3 with ties CategoryID, ProductID, ProductName, UnitPrice
	from Products
	order by UnitPrice Desc




-- 220 請列出產品的平均單價。
--use Northwind
select * from Products
select avg(UnitPrice) from products




-- 230 請以類別編號(CategoryID)等於 1, 4, 8 為計算範圍, 計算產品的平均單價。
select * from products
select * from products

select avg(UnitPrice) from Products
where CategoryID IN ( 1, 4, 8)



-- 240 請列出各類產品的平均單價。

select CategoryID, avg(UnitPrice) 
	from Products
	group by CategoryID


-- 250 請列出平均單價最高的前三類產品。

select CategoryID, avg(UnitPrice) as avgprice 
	from Products
	group by CategoryID


/* 310
  請寫一道指令, 列出 products 資料表的以下欄位
  ProductID, ProductName, SupplierID
 */ 
 select ProductID, ProductName, SupplierID 
 from Products



/* 320
   同上, 但請一併列出該供應商名稱(CompanyName)、
   聯絡電話(Phone)、聯絡人(ContactName)好嗎?
   另外, 相同供應商的資料請列在一起
 */ 
 select ProductID, ProductName, s.SupplierID, S.CompanyName, S.Phone, S.ContactName
	from Products P join Suppliers S on P.SupplierID = S.supplierID
	order by P.SupplierID





/* 330
   我想列出「所有」供應商目前各自提供我們哪些產品資料的對照表,
   目前沒提供我們產品的供應商也要列出

   <note>
   下指令前, 請先執行下列指令:
   -- begin --
   insert into suppliers
     (CompanyName, ContactName, Phone)
      values
     ('Taiwan First', 'A-Ban', '(001) 000-0001')
   -- end --
 */ 




-- (Optional)
-- 340 請列出員工及其員工直屬老闆（ReportsTo）的清單。




/* 410
  請列出各項產品的類別、編號、品名、單價、
  該類產品平均單價、單價與產品平均單價的「價差」。
*/
-- select * from Suppliers
use Northwind
go

select CategoryID,AVG(UnitPrice) from Products group by CategoryID

s


/* 420
   請列出有訂第三類產品的訂單。
*/





/* 430
  請列出賣得最好前三項產品。
*/




use Northwind
go

/* 500 
  1. 以 SQL Enterprise Manager 檢視 Shippers table 的欄位定義
  2. 請寫一道指令, 新增一筆運輸公司的資料到 Shippers table
     Shippers(CompanyName): Never Lose
     電話(Phone): (040) 0048126
  執行之後, 確認一下那筆新加入的運輸公司, 編號是幾號?
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
  請寫一道指令, 將剛才那筆 Never Lose 的公司名稱(CompanyName)改成
  'Never Lost', 電話(Phone)改成'(123) 1234567', 
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
  請寫一道指令, 將產品類別(CategoryID) = 1 的產品資料(products) 
  的單價(UnitPrice)調高百分之 5, 其餘類別不變
 */ 





/* 530
  對不起, 不小心講錯了, 不是產品類別(CategoryID) = 1 啦..., 什麼!?
  你已經改了...., hmmm..., 可以麻煩請你改回來嗎?
 */ 





/* 540
  請寫一道指令 刪除剛才那筆 Never Lost 運輸公司的資料
 */ 





