/* 
	Create table Products
	ProductID
	ProductName
	SupplierID
	CategoryID
	QuantityPerUnit
	UnitPrice
	UnitsInStock
	UnitsOnOrder
	ReorderLevel
	Discontinued

*/


CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[QuantityPerUnit] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[UnitsOnOrder] [int] NULL,
	[ReorderLeve] [int] NULL,
	[Discontinued] [int] NULL
) ON [PRIMARY]
GO


--Write a Query to get a Product list(id,name,unitprice) where current product cost is less then $20

select Product.ProductID,Product.ProductName,Product.UnitPrice from Product where Product.UnitPrice<20

-- Write a query to get Product list (id, name, unit price) where products cost between $15 and $25

select Product.ProductID,Product.ProductName,Product.UnitPrice from Product where Product.UnitPrice between 20 and 25

--Write a query to get Product list (name, unit price) of above average price.

Select Product.ProductID,Product.UnitPrice from Product where UnitPrice>AVG(UnitPrice)

-- Write a query to get Product list (name, unit price) of ten most expensive products

Select TOP 10 Product.ProductID,Product.UnitPrice from Product order by UnitPrice asc

--Write a query to count current and discontinued products

Select sum(Product.UnitsInStock),sum(Product.Discontinued) from Product

--Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order

Select Product.ProductName,Product.UnitsOnOrder,Product.UnitsInStock from Product where UnitsInStock<UnitsOnOrder

