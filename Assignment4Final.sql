
--1

CREATE PROC spCalculateAverageFreight
@CustomerID nvarchar(50),
@AverageFreight money OUT

AS 
BEGIN
		SELECT Orders.CustomerID,avg(Orders.Freight) from Orders
		WHERE CustomerID=@CustomerID
		group by CustomerID

END

ALTER TRIGGER trForOrderInsertUpdate
ON Orders
INSTEAD OF UPDATE, INSERT 
AS
BEGIN
		DECLARE @CustomerID nvarchar(5)
		DECLARE @Freight money
		SELECT @CustomerID = CustomerID, @Freight = Freight  FROM inserted;

		DECLARE @AverageFreight money
		EXEC spCalculateAverageFreight @CustomerID,@AverageFreight OUT

		IF @Freight>@AverageFreight
			BEGIN
				RAISERROR('NOT allowd inser or update because of Freight exceed ',16,1); ROLLBACK;
			END
			ELSE
			BEGIN
			    PRINT('SUCESSFULLY INSERTED/UPDATED');
			END
END

select * from Orders;
INSERT INTO "Orders"
("CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES ('BLONP',2,'7/25/1996','8/22/1996','8/12/1996',1,5000,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')



--2 Employee SalesByCountry

ALTER procedure spEmployeeSalesbyCountry 

AS
BEGIN
	SELECT Employees.Country, Employees.LastName +' '+ Employees.FirstName AS EmployeeName,  Sum(CONVERT(money, ([Order Details].UnitPrice * Quantity * (1 - Discount) / 100)) * 100) as Sales
	FROM Employees 
	INNER JOIN (Orders INNER JOIN [Order Details] 
		ON Orders.OrderID = [Order Details].OrderID) 
		ON Employees.EmployeeID = Orders.EmployeeID
	GROUP BY Employees.Country, Employees.LastName, Employees.FirstName
END
GO

exec spEmployeeSalesbyCountry



--3

create procedure spSalesbyYear
	@Beginning_Date DateTime, 
	@Ending_Date DateTime 
AS
BEGIN
	SELECT 
    Orders.ShippedDate, 
    Orders.OrderID, 
    Sum(CONVERT(money, ([Order Details].UnitPrice * Quantity * (1 - Discount) / 100)) * 100) as Sales,
    DATENAME(yy, Orders.ShippedDate) AS Year
FROM 
    Orders 
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE 
    Orders.ShippedDate BETWEEN @Beginning_Date AND @Ending_Date
GROUP BY 
    Orders.ShippedDate, 
    Orders.OrderID, 
    DATENAME(yy, Orders.ShippedDate);

END
GO

exec spSalesbyYear
    @Beginning_Date = '1970-01-01', 
    @Ending_Date = '2000-01-01'



select * from [Order Details]



--4

select * from Products
select * from [Order Details]

CREATE PROC spTopExpensiveProducts
AS
BEGIN
		SELECT TOP 10	Products.ProductID,Products.ProductName,Products.UnitPrice FROM Products ORDER BY Products.UnitPrice DESC

END

EXEC spTopExpensiveProducts




--5

select *from Categories
select *from [Order Details]
select * from Products

ALTER PROC spSalesByCategory
--@CategoryID int
AS
BEGIN
		select Categories.CategoryID, Categories.CategoryName,Sum(CONVERT(money,([Order Details].UnitPrice*Quantity*(1-Discount)/100))*100) as Sales from  Products
		join [Order Details] on Products.ProductID=[Order Details].ProductID
		join Categories on Products.CategoryID=Categories.CategoryID
		--where Categories.CategoryID=@CategoryID
		group by Categories.CategoryID,Categories.CategoryName		
		
END

exec spSalesByCategory --@CategoryID=3

select Categories.CategoryID,Categories.CategoryName,Sum(CONVERT(money,([Order Details].UnitPrice*Quantity*(1-Discount)/100))*100) as Sales from  Products
join [Order Details] on Products.ProductID=[Order Details].ProductID
join Categories on Products.CategoryID=Categories.CategoryID
group by Categories.CategoryID,Categories.CategoryName



--6

CREATE PROCEDURE spInsertCustomerOrderDetails
(
  @CustomerID nvarchar(50),
  @OrderID int,
  @ProductID int,
  @UnitPrice money,
  @Quantity smallint,
  @Discount float
)
AS
BEGIN
  DECLARE @ErrorMessage nvarchar(max);

  -- Validate CustomerID
  IF NOT EXISTS (SELECT * FROM Customers WHERE CustomerID = @CustomerID)
  
  -- Validate OrderID
  IF NOT EXISTS (SELECT * FROM Orders WHERE OrderID = @OrderID)
  -- Validate ProductID
  IF NOT EXISTS (SELECT * FROM Products WHERE ProductID = @ProductID)
  -- Insert OrderDetail
  INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
  VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount);

  PRINT 'Customer order detail inserted successfully.';
END
GO

EXEC spInsertCustomerOrderDetails @CustomerID='ALFKI',@OrderID=10249,@ProductID=51,@UnitPrice=200,@Quantity=50,@Discount=0.7

select *from [Order Details] where Quantity=50




--7

select *from [order details]
select *from customers
select * from orders

CREATE PROC spUpdateOrderDetais
@CustomerID varchar(5),
@UnitPrice money,
@Quantity smallint,
@Discount real 

AS
BEGIN
		UPDATE [order details]
		SET UnitPrice=@UnitPrice,Quantity=@Quantity,Discount=@Discount
		WHERE OrderID IN (
			SELECT Orders.OrderID
			FROM Orders
			JOIN Customers ON Orders.CustomerID = Customers.CustomerID
			WHERE Customers.CustomerID = @CustomerID
		);
END

EXEC spUpdateOrderDetais @CustomerID='ANATR',@UnitPrice=100,@Quantity=10,@Discount=06

