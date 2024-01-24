--Create Proc spEmployeeSalaryByDepartment
--AS
--BEGIN
--		select Employee.EmployeeName from Employee

--END

--EXEC spEmployeeSalaryByDepartment

--CREATE PROC spTopExpensiveProducts
--AS
--BEGIN
--	select top 10 Product.ProductName,Product.UnitPrice from Product

--END

--ALTER PROC spTopExpensiveProducts
--AS
--BEGIN
--	select top 10 Product.ProductName,Product.UnitPrice from Product order by Product.UnitPrice desc

--END

--EXEC spTopExpensiveProducts

--CREATE PROC spUpdateCustomerDetails
--@CustomerID int
--AS
--BEGIN
--		update Orders set Discription='Hello this column is updated' where Orders.CustomerID=@CustomerID 
--END
--select * from Orders

--EXEC spUpdateCustomerDetails @CustomerID=5


--CREATE PROC spInsertCUstomerOrderDetails
--@CustomerID int,
--@OrderNumber int,
--@PurchaseAmount float,
--@OrderDate date,
--@SalesmanID int,
--@Discription varchar

--As
--BEGIN
--		insert into Orders(OrderNumber,PurchaseAmount,OrderDate,CustomerID,SalesmanID,Discription)
--		values
--				(@OrderNumber,@PurchaseAmount,@OrderDate,@CustomerID,@SalesmanID,@Discription)

--END

--EXEC spInsertCUstomerOrderDetails @CustomerID=5,@OrderNumber=103,@PurchaseAmount=10023,@OrderDate='2023/09/09',@SalesmanID=10,@Discription='New Product introduse by xyz company'

--select * from Orders

--ALTER table Product add Sales int 

--select *from Product

--CREATE PROC spRetriveSalesByCategory
--as
--Begin
--		select Product.CategoryID,SUM(Product.Sales) as NumnerOfSales from Product Group by Product.CategoryID

--END

--EXEC spRetriveSalesByCategory

--ALTER table Product add YearOfSale date 

--select * from Product

--update Product set YearOfSale='2019' where SupplierID=3

--CREATE PROC spRetriveSalesByYear
--AS
--BEGIN
--	select sum(Product.Sales) as Sales,Product.YearOfSale from Product
--	Group by Product.YearOfSale
--END

--EXEC spRetriveSalesByYear
--select * from Product

--CREATE PROC spRetriveSalesByYear
--AS
--BEGIN
--	SELECT employees.employee_id, employees.first_name,employees.country, COALESCE(m.sales_count, 0) as sales_count
--FROM employees
--LEFT JOIN (
--    SELECT ship_country, COUNT(*) as sales_count
--    FROM newOrder
--    GROUP BY ship_country
--) as m ON m.ship_country = employees.country
--order by ship_country








---QUESTION 1
--CREATE PROCEDURE CalculateAverageFreight
--    @CustomerID NVARCHAR(5)
--AS
--BEGIN
--    DECLARE @AverageFreight MONEY;

--    SELECT @AverageFreight = AVG(Freight)
--    FROM newOrder
--    WHERE customer_id = @CustomerID;
--    PRINT 'Average Freight for Customer ' + @CustomerID + ': ' + CONVERT(NVARCHAR(20), @AverageFreight);
--END;
--ALTER TRIGGER tr_CheckFreightBeforeUpdateInsert
--ON newOrder
--INSTEAD OF UPDATE, INSERT
--AS
--BEGIN
--    SELECT * FROM newOrder;

--    DECLARE @CustomerID varchar;
--    DECLARE @Freight MONEY;

--    SELECT @CustomerID = customer_id, @Freight = Freight FROM inserted;

--    DECLARE @AverageFreight MONEY;

--    -- Assuming CalculateAverageFreight has only one input parameter
--    EXEC CalculateAverageFreight @CustomerID, @AverageFreight OUTPUT;

--    IF @Freight > @AverageFreight
--    begin
--        RAISERROR('Cannot Insert where salary > 1000',16,1); ROLLBACK;
--        end
--    ELSE
--    BEGIN
--        PRINT('WELCOME');
--    END
--END;

--INSERT INTO newOrder VALUES (10531, 'OCEAN', 7, '1997-05-08', '1997-06-05', '1997-05-19', 1, 5, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina',1002);

--delete newOrder where order_id=10500

--select customer_id,avg(freight) from newOrder Group by customer_id


--2
INSERT "Order_Details" VALUES(10248,11,14,12,0)
INSERT "Order_Details" VALUES(10248,42,9.8,10,0)
INSERT "Order_Details" VALUES(10248,72,34.8,5,0)
INSERT "Order_Details" VALUES(10249,14,18.6,9,0)
INSERT "Order_Details" VALUES(10249,51,42.4,40,0)
INSERT "Order_Details" VALUES(10250,41,7.7,10,0)
INSERT "Order_Details" VALUES(10250,51,42.4,35,0.15)
INSERT "Order_Details" VALUES(10250,65,16.8,15,0.15)
INSERT "Order_Details" VALUES(10251,22,16.8,6,0.05)
INSERT "Order_Details" VALUES(10251,57,15.6,15,0.05)
go			 _
INSERT "Order_Details" VALUES(10251,65,16.8,20,0)
INSERT "Order_Details" VALUES(10252,20,64.8,40,0.05)
INSERT "Order_Details" VALUES(10252,33,2,25,0.05)
INSERT "Order_Details" VALUES(10252,60,27.2,40,0)
INSERT "Order_Details" VALUES(10253,31,10,20,0)
INSERT "Order_Details" VALUES(10253,39,14.4,42,0)
INSERT "Order_Details" VALUES(10253,49,16,40,0)
INSERT "Order_Details" VALUES(10254,24,3.6,15,0.15)
INSERT "Order_Details" VALUES(10254,55,19.2,21,0.15)
INSERT "Order_Details" VALUES(10254,74,8,21,0)
go			 _
INSERT "Order_Details" VALUES(10255,2,15.2,20,0)
INSERT "Order_Details" VALUES(10255,16,13.9,35,0)
INSERT "Order_Details" VALUES(10255,36,15.2,25,0)
INSERT "Order_Details" VALUES(10255,59,44,30,0)
INSERT "Order_Details" VALUES(10256,53,26.2,15,0)
INSERT "Order_Details" VALUES(10256,77,10.4,12,0)
INSERT "Order_Details" VALUES(10257,27,35.1,25,0)
INSERT "Order_Details" VALUES(10257,39,14.4,6,0)
INSERT "Order_Details" VALUES(10257,77,10.4,15,0)
INSERT "Order_Details" VALUES(10258,2,15.2,50,0.2)
go			 _
INSERT "Order_Details" VALUES(10258,5,17,65,0.2)
INSERT "Order_Details" VALUES(10258,32,25.6,6,0.2)
INSERT "Order_Details" VALUES(10259,21,8,10,0)
INSERT "Order_Details" VALUES(10259,37,20.8,1,0)
INSERT "Order_Details" VALUES(10260,41,7.7,16,0.25)
INSERT "Order_Details" VALUES(10260,57,15.6,50,0)
INSERT "Order_Details" VALUES(10260,62,39.4,15,0.25)
INSERT "Order_Details" VALUES(10260,70,12,21,0.25)
INSERT "Order_Details" VALUES(10261,21,8,20,0)
INSERT "Order_Details" VALUES(10261,35,14.4,20,0)
go			 _
INSERT "Order_Details" VALUES(10262,5,17,12,0.2)
INSERT "Order_Details" VALUES(10262,7,24,15,0)
INSERT "Order_Details" VALUES(10262,56,30.4,2,0)
INSERT "Order_Details" VALUES(10263,16,13.9,60,0.25)
INSERT "Order_Details" VALUES(10263,24,3.6,28,0)
INSERT "Order_Details" VALUES(10263,30,20.7,60,0.25)
INSERT "Order_Details" VALUES(10263,74,8,36,0.25)
INSERT "Order_Details" VALUES(10264,2,15.2,35,0)
INSERT "Order_Details" VALUES(10264,41,7.7,25,0.15)
INSERT "Order_Details" VALUES(10265,17,31.2,30,0)
go			 _
INSERT "Order_Details" VALUES(10265,70,12,20,0)
INSERT "Order_Details" VALUES(10266,12,30.4,12,0.05)
INSERT "Order_Details" VALUES(10267,40,14.7,50,0)
INSERT "Order_Details" VALUES(10267,59,44,70,0.15)
INSERT "Order_Details" VALUES(10267,76,14.4,15,0.15)
INSERT "Order_Details" VALUES(10268,29,99,10,0)
INSERT "Order_Details" VALUES(10268,72,27.8,4,0)
INSERT "Order_Details" VALUES(10269,33,2,60,0.05)
INSERT "Order_Details" VALUES(10269,72,27.8,20,0.05)
INSERT "Order_Details" VALUES(10270,36,15.2,30,0)
go			 _
INSERT "Order_Details" VALUES(10270,43,36.8,25,0)
INSERT "Order_Details" VALUES(10271,33,2,24,0)
INSERT "Order_Details" VALUES(10272,20,64.8,6,0)
INSERT "Order_Details" VALUES(10272,31,10,40,0)
INSERT "Order_Details" VALUES(10272,72,27.8,24,0)
INSERT "Order_Details" VALUES(10273,10,24.8,24,0.05)
INSERT "Order_Details" VALUES(10273,31,10,15,0.05)
INSERT "Order_Details" VALUES(10273,33,2,20,0)
INSERT "Order_Details" VALUES(10273,40,14.7,60,0.05)
INSERT "Order_Details" VALUES(10273,76,14.4,33,0.05)
go			 _
INSERT "Order_Details" VALUES(10274,71,17.2,20,0)
INSERT "Order_Details" VALUES(10274,72,27.8,7,0)
INSERT "Order_Details" VALUES(10275,24,3.6,12,0.05)
INSERT "Order_Details" VALUES(10275,59,44,6,0.05)
INSERT "Order_Details" VALUES(10276,10,24.8,15,0)
INSERT "Order_Details" VALUES(10276,13,4.8,10,0)
INSERT "Order_Details" VALUES(10277,28,36.4,20,0)
INSERT "Order_Details" VALUES(10277,62,39.4,12,0)
INSERT "Order_Details" VALUES(10278,44,15.5,16,0)
INSERT "Order_Details" VALUES(10278,59,44,15,0)
go			 _
INSERT "Order_Details" VALUES(10278,63,35.1,8,0)
INSERT "Order_Details" VALUES(10278,73,12,25,0)
INSERT "Order_Details" VALUES(10279,17,31.2,15,0.25)
INSERT "Order_Details" VALUES(10280,24,3.6,12,0)
INSERT "Order_Details" VALUES(10280,55,19.2,20,0)
INSERT "Order_Details" VALUES(10280,75,6.2,30,0)
INSERT "Order_Details" VALUES(10281,19,7.3,1,0)
INSERT "Order_Details" VALUES(10281,24,3.6,6,0)
INSERT "Order_Details" VALUES(10281,35,14.4,4,0)
INSERT "Order_Details" VALUES(10282,30,20.7,6,0)
go			 _
INSERT "Order_Details" VALUES(10282,57,15.6,2,0)
INSERT "Order_Details" VALUES(10283,15,12.4,20,0)
INSERT "Order_Details" VALUES(10283,19,7.3,18,0)
INSERT "Order_Details" VALUES(10283,60,27.2,35,0)
INSERT "Order_Details" VALUES(10283,72,27.8,3,0)
INSERT "Order_Details" VALUES(10284,27,35.1,15,0.25)
INSERT "Order_Details" VALUES(10284,44,15.5,21,0)
INSERT "Order_Details" VALUES(10284,60,27.2,20,0.25)
INSERT "Order_Details" VALUES(10284,67,11.2,5,0.25)
INSERT "Order_Details" VALUES(10285,1,14.4,45,0.2)
go			 _
INSERT "Order_Details" VALUES(10285,40,14.7,40,0.2)
INSERT "Order_Details" VALUES(10285,53,26.2,36,0.2)
INSERT "Order_Details" VALUES(10286,35,14.4,100,0)
INSERT "Order_Details" VALUES(10286,62,39.4,40,0)
INSERT "Order_Details" VALUES(10287,16,13.9,40,0.15)
INSERT "Order_Details" VALUES(10287,34,11.2,20,0)
INSERT "Order_Details" VALUES(10287,46,9.6,15,0.15)
INSERT "Order_Details" VALUES(10288,54,5.9,10,0.1)
INSERT "Order_Details" VALUES(10288,68,10,3,0.1)
INSERT "Order_Details" VALUES(10289,3,8,30,0)
go			 _
INSERT "Order_Details" VALUES(10289,64,26.6,9,0)
INSERT "Order_Details" VALUES(10290,5,17,20,0)
INSERT "Order_Details" VALUES(10290,29,99,15,0)
INSERT "Order_Details" VALUES(10290,49,16,15,0)
INSERT "Order_Details" VALUES(10290,77,10.4,10,0)
INSERT "Order_Details" VALUES(10291,13,4.8,20,0.1)
INSERT "Order_Details" VALUES(10291,44,15.5,24,0.1)
INSERT "Order_Details" VALUES(10291,51,42.4,2,0.1)
INSERT "Order_Details" VALUES(10292,20,64.8,20,0)
INSERT "Order_Details" VALUES(10293,18,50,12,0)
go			 _
INSERT "Order_Details" VALUES(10293,24,3.6,10,0)
INSERT "Order_Details" VALUES(10293,63,35.1,5,0)
INSERT "Order_Details" VALUES(10293,75,6.2,6,0)
INSERT "Order_Details" VALUES(10294,1,14.4,18,0)
INSERT "Order_Details" VALUES(10294,17,31.2,15,0)
INSERT "Order_Details" VALUES(10294,43,36.8,15,0)
INSERT "Order_Details" VALUES(10294,60,27.2,21,0)
INSERT "Order_Details" VALUES(10294,75,6.2,6,0)
INSERT "Order_Details" VALUES(10295,56,30.4,4,0)
INSERT "Order_Details" VALUES(10296,11,16.8,12,0)
go			 _
INSERT "Order_Details" VALUES(10296,16,13.9,30,0)
INSERT "Order_Details" VALUES(10296,69,28.8,15,0)
INSERT "Order_Details" VALUES(10297,39,14.4,60,0)
INSERT "Order_Details" VALUES(10297,72,27.8,20,0)
INSERT "Order_Details" VALUES(10298,2,15.2,40,0)
INSERT "Order_Details" VALUES(10298,36,15.2,40,0.25)
INSERT "Order_Details" VALUES(10298,59,44,30,0.25)
INSERT "Order_Details" VALUES(10298,62,39.4,15,0)
INSERT "Order_Details" VALUES(10299,19,7.3,15,0)
INSERT "Order_Details" VALUES(10299,70,12,20,0)
go			 _
INSERT "Order_Details" VALUES(10300,66,13.6,30,0)
INSERT "Order_Details" VALUES(10300,68,10,20,0)
INSERT "Order_Details" VALUES(10301,40,14.7,10,0)
INSERT "Order_Details" VALUES(10301,56,30.4,20,0)
INSERT "Order_Details" VALUES(10302,17,31.2,40,0)
INSERT "Order_Details" VALUES(10302,28,36.4,28,0)
INSERT "Order_Details" VALUES(10302,43,36.8,12,0)
INSERT "Order_Details" VALUES(10303,40,14.7,40,0.1)
INSERT "Order_Details" VALUES(10303,65,16.8,30,0.1)
INSERT "Order_Details" VALUES(10303,68,10,15,0.1)
go			 _
INSERT "Order_Details" VALUES(10304,49,16,30,0)
INSERT "Order_Details" VALUES(10304,59,44,10,0)
INSERT "Order_Details" VALUES(10304,71,17.2,2,0)
INSERT "Order_Details" VALUES(10305,18,50,25,0.1)
INSERT "Order_Details" VALUES(10305,29,99,25,0.1)
INSERT "Order_Details" VALUES(10305,39,14.4,30,0.1)
INSERT "Order_Details" VALUES(10306,30,20.7,10,0)
INSERT "Order_Details" VALUES(10306,53,26.2,10,0)
INSERT "Order_Details" VALUES(10306,54,5.9,5,0)
INSERT "Order_Details" VALUES(10307,62,39.4,10,0)
go			 _
INSERT "Order_Details" VALUES(10307,68,10,3,0)
INSERT "Order_Details" VALUES(10308,69,28.8,1,0)
INSERT "Order_Details" VALUES(10308,70,12,5,0)
INSERT "Order_Details" VALUES(10309,4,17.6,20,0)
INSERT "Order_Details" VALUES(10309,6,20,30,0)
INSERT "Order_Details" VALUES(10309,42,11.2,2,0)
INSERT "Order_Details" VALUES(10309,43,36.8,20,0)
INSERT "Order_Details" VALUES(10309,71,17.2,3,0)
INSERT "Order_Details" VALUES(10310,16,13.9,10,0)
INSERT "Order_Details" VALUES(10310,62,39.4,5,0)
go			 _
INSERT "Order_Details" VALUES(10311,42,11.2,6,0)
INSERT "Order_Details" VALUES(10311,69,28.8,7,0)
INSERT "Order_Details" VALUES(10312,28,36.4,4,0)
INSERT "Order_Details" VALUES(10312,43,36.8,24,0)
INSERT "Order_Details" VALUES(10312,53,26.2,20,0)
INSERT "Order_Details" VALUES(10312,75,6.2,10,0)
INSERT "Order_Details" VALUES(10313,36,15.2,12,0)
INSERT "Order_Details" VALUES(10314,32,25.6,40,0.1)
INSERT "Order_Details" VALUES(10314,58,10.6,30,0.1)
INSERT "Order_Details" VALUES(10314,62,39.4,25,0.1)
go			 _
INSERT "Order_Details" VALUES(10315,34,11.2,14,0)
INSERT "Order_Details" VALUES(10315,70,12,30,0)
INSERT "Order_Details" VALUES(10316,41,7.7,10,0)
INSERT "Order_Details" VALUES(10316,62,39.4,70,0)
INSERT "Order_Details" VALUES(10317,1,14.4,20,0)
INSERT "Order_Details" VALUES(10318,41,7.7,20,0)
INSERT "Order_Details" VALUES(10318,76,14.4,6,0)
INSERT "Order_Details" VALUES(10319,17,31.2,8,0)
INSERT "Order_Details" VALUES(10319,28,36.4,14,0)
INSERT "Order_Details" VALUES(10319,76,14.4,30,0)
go			 _
INSERT "Order_Details" VALUES(10320,71,17.2,30,0)
INSERT "Order_Details" VALUES(10321,35,14.4,10,0)
INSERT "Order_Details" VALUES(10322,52,5.6,20,0)
INSERT "Order_Details" VALUES(10323,15,12.4,5,0)
INSERT "Order_Details" VALUES(10323,25,11.2,4,0)
INSERT "Order_Details" VALUES(10323,39,14.4,4,0)
INSERT "Order_Details" VALUES(10324,16,13.9,21,0.15)
INSERT "Order_Details" VALUES(10324,35,14.4,70,0.15)
INSERT "Order_Details" VALUES(10324,46,9.6,30,0)
INSERT "Order_Details" VALUES(10324,59,44,40,0.15)
go			 _
INSERT "Order_Details" VALUES(10324,63,35.1,80,0.15)
INSERT "Order_Details" VALUES(10325,6,20,6,0)
INSERT "Order_Details" VALUES(10325,13,4.8,12,0)
INSERT "Order_Details" VALUES(10325,14,18.6,9,0)
INSERT "Order_Details" VALUES(10325,31,10,4,0)
INSERT "Order_Details" VALUES(10325,72,27.8,40,0)
INSERT "Order_Details" VALUES(10326,4,17.6,24,0)
INSERT "Order_Details" VALUES(10326,57,15.6,16,0)
INSERT "Order_Details" VALUES(10326,75,6.2,50,0)
INSERT "Order_Details" VALUES(10327,2,15.2,25,0.2)
go			 _
INSERT "Order_Details" VALUES(10327,11,16.8,50,0.2)
INSERT "Order_Details" VALUES(10327,30,20.7,35,0.2)
INSERT "Order_Details" VALUES(10327,58,10.6,30,0.2)
INSERT "Order_Details" VALUES(10328,59,44,9,0)
INSERT "Order_Details" VALUES(10328,65,16.8,40,0)
INSERT "Order_Details" VALUES(10328,68,10,10,0)
INSERT "Order_Details" VALUES(10329,19,7.3,10,0.05)
INSERT "Order_Details" VALUES(10329,30,20.7,8,0.05)
INSERT "Order_Details" VALUES(10329,38,210.8,20,0.05)
INSERT "Order_Details" VALUES(10329,56,30.4,12,0.05)
go			 _
INSERT "Order_Details" VALUES(10330,26,24.9,50,0.15)
INSERT "Order_Details" VALUES(10330,72,27.8,25,0.15)
INSERT "Order_Details" VALUES(10331,54,5.9,15,0)
INSERT "Order_Details" VALUES(10332,18,50,40,0.2)
INSERT "Order_Details" VALUES(10332,42,11.2,10,0.2)
INSERT "Order_Details" VALUES(10332,47,7.6,16,0.2)
INSERT "Order_Details" VALUES(10333,14,18.6,10,0)
INSERT "Order_Details" VALUES(10333,21,8,10,0.1)
INSERT "Order_Details" VALUES(10333,71,17.2,40,0.1)
INSERT "Order_Details" VALUES(10334,52,5.6,8,0)
go			 _
INSERT "Order_Details" VALUES(10334,68,10,10,0)
INSERT "Order_Details" VALUES(10335,2,15.2,7,0.2)
INSERT "Order_Details" VALUES(10335,31,10,25,0.2)
INSERT "Order_Details" VALUES(10335,32,25.6,6,0.2)
INSERT "Order_Details" VALUES(10335,51,42.4,48,0.2)
INSERT "Order_Details" VALUES(10336,4,17.6,18,0.1)
INSERT "Order_Details" VALUES(10337,23,7.2,40,0)
INSERT "Order_Details" VALUES(10337,26,24.9,24,0)
INSERT "Order_Details" VALUES(10337,36,15.2,20,0)
INSERT "Order_Details" VALUES(10337,37,20.8,28,0)
go			 _
INSERT "Order_Details" VALUES(10337,72,27.8,25,0)
INSERT "Order_Details" VALUES(10338,17,31.2,20,0)
INSERT "Order_Details" VALUES(10338,30,20.7,15,0)
INSERT "Order_Details" VALUES(10339,4,17.6,10,0)
INSERT "Order_Details" VALUES(10339,17,31.2,70,0.05)
INSERT "Order_Details" VALUES(10339,62,39.4,28,0)
INSERT "Order_Details" VALUES(10340,18,50,20,0.05)
INSERT "Order_Details" VALUES(10340,41,7.7,12,0.05)
INSERT "Order_Details" VALUES(10340,43,36.8,40,0.05)
INSERT "Order_Details" VALUES(10341,33,2,8,0)
go			 _
INSERT "Order_Details" VALUES(10341,59,44,9,0.15)
INSERT "Order_Details" VALUES(10342,2,15.2,24,0.2)
INSERT "Order_Details" VALUES(10342,31,10,56,0.2)
INSERT "Order_Details" VALUES(10342,36,15.2,40,0.2)
INSERT "Order_Details" VALUES(10342,55,19.2,40,0.2)
INSERT "Order_Details" VALUES(10343,64,26.6,50,0)
INSERT "Order_Details" VALUES(10343,68,10,4,0.05)
INSERT "Order_Details" VALUES(10343,76,14.4,15,0)
INSERT "Order_Details" VALUES(10344,4,17.6,35,0)
INSERT "Order_Details" VALUES(10344,8,32,70,0.25)
go			 _
INSERT "Order_Details" VALUES(10345,8,32,70,0)
INSERT "Order_Details" VALUES(10345,19,7.3,80,0)
INSERT "Order_Details" VALUES(10345,42,11.2,9,0)
INSERT "Order_Details" VALUES(10346,17,31.2,36,0.1)
INSERT "Order_Details" VALUES(10346,56,30.4,20,0)
INSERT "Order_Details" VALUES(10347,25,11.2,10,0)
INSERT "Order_Details" VALUES(10347,39,14.4,50,0.15)
INSERT "Order_Details" VALUES(10347,40,14.7,4,0)
INSERT "Order_Details" VALUES(10347,75,6.2,6,0.15)
INSERT "Order_Details" VALUES(10348,1,14.4,15,0.15)
go			 _
INSERT "Order_Details" VALUES(10348,23,7.2,25,0)
INSERT "Order_Details" VALUES(10349,54,5.9,24,0)
INSERT "Order_Details" VALUES(10350,50,13,15,0.1)

create view "Sales" AS
SELECT "Order_Details".OrderID, Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS Sales
FROM "Order_Details"
GROUP BY "Order_Details".OrderID