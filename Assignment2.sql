/* 
Sample table1: salesman 

-salesman_id   

-name   

-city   

-commission  

 

Sample table2: customer  

-customer_id   

-cust_name   

-city   

-grade   

-salesman_id   

  

Sample table3: orders  

-ord_no   

-purch_amt   

-ord_date   

-customer_id   

-salesman_id  

  
*/

-- write a SQL query to find the salesperson and customer who reside in the same city.Return Salesman, cust_name and city 
 

USE [mohammadpatel_db]  

GO  

select dbo.SalesMan.Names, dbo.Customer.CustomerName, SalesMan.City from dbo.Customer inner join dbo.SalesMan on dbo.Customer.SalesmanID=dbo.SalesMan.SalesmanID where dbo.Customer.City=dbo.SalesMan.CIty  

-- write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city  

USE [mohammadpatel_db]  

GO  

select dbo.Orders.OrderNumber,dbo.Orders.PurchaseAmount,dbo.Customer.CustomerName,dbo.Customer.City from dbo.Orders inner join dbo.Customer on dbo.Customer.CustomerID=dbo.Orders.CustomerID where dbo.Orders.PurchaseAmount between 500 and 2000 

-- write a SQL query to find the salesperson(s) and the customer(s) he represents.Return Customer Name, city, Salesman, commission  

USE [mohammadpatel_db]  

GO  

select Customer.CustomerName, Customer.City,SalesMan.Names,SalesMan.Commissiom from Customer inner join SalesMan on Customer.SalesmanID=SalesMan.SalesmanID  

-- write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman,commission 

USE [mohammadpatel_db]  

GO  

select Customer.CustomerName,Customer.CIty,SalesMan.Names,SalesMan.Commissiom from Customer inner join SalesMan on Customer.SalesmanID=SalesMan.SalesmanID where SalesMan.Commissiom>12  


--write a SQL query to locate those salespeople who do not live in the same city where  their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city,  commission  

USE [mohammadpatel_db]  

GO  

  

select Customer.CustomerName,Customer.CIty,SalesMan.Names,SalesMan.City,SalesMan.Commissiom from Customer inner join SalesMan on Customer.SalesmanID=SalesMan.SalesmanID where NOT SalesMan.City = Customer.City and SalesMan.Commissiom>10  

--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission  

select Orders.OrderNumber,Orders.OrderDate,Orders.PurchaseAmount,Customer.CustomerName,Customer.Grade,SalesMan.Names as salesPerson,SalesMan.Commissiom from Orders left join Customer on Orders.SalesmanID=Customer.SalesmanID left join SalesMan on Orders.SalesmanID=SalesMan.SalesmanID  


--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.  

select *  from SalesMan inner join Customer on SalesMan.SalesmanID=Customer.CustomerID inner  join Orders on SalesMan.SalesmanID=Orders.SalesmanID   

--write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.


select Customer.CustomerName,Customer.City,Customer.Grade,SalesMan.Names,SalesMan.CIty from Customer left join SalesMan on Customer.SalesmanID=SalesMan.SalesmanID  order by Customer.CustomerID  

--write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be  ordered by ascending customer_id.

select Customer.CustomerName,Customer.City,Customer.Grade,SalesMan.Names,SalesMan.CIty from Customer left join SalesMan on Customer.SalesmanID=SalesMan.SalesmanID where Customer.Grade>300 order by Customer.CustomerID  

--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not  

select Customer.CustomerName,Customer.City,Orders.OrderNumber,Orders.OrderDate,Orders.PurchaseAmount  from Customer left join Orders on Customer.SalesmanID=Orders.SalesmanID where Orders.CustomerID is not null order by Orders.OrderDate asc  

--Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves

select Customer.CustomerName,Customer.City,Orders.OrderNumber,Orders.OrderDate,Orders.PurchaseAmount,SalesMan.Names as SalesPerson, SalesMan.Commissiom from Customer left join Orders on Customer.SalesmanID=Orders.SalesmanID left join SalesMan on Customer.SalesmanID=SalesMan.SalesmanID where Customer.CustomerID is null or Customer.SalesmanID is not null  

--Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers  

SELECT  
	SalesMan.Names as SalesPerson  
FROM SalesMan  
LEFT join Customer on SalesMan.SalesmanID=Customer.CustomerID  
WHERE Customer.CustomerID is not null or SalesMan.SalesmanID is null  

-- write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. 

SELECT SalesMan.Names as SalesPerson,Customer.CustomerName,Customer.City,Customer.Grade,Orders.OrderNumber,Orders.OrderDate,Orders.PurchaseAmount from SalesMan Join Customer on SalesMan.SalesmanID=Customer.SalesmanID join Orders on Orders.SalesmanID=SalesMan.SalesmanID  

-- Write a SQL statement to generate a list of all the salesmen who either work for one or more customers or have yet to join any of them. The customer may have placed  one or more orders at or above order amount 2000, and must have a grade, or he  may not have placed any orders to the associated supplier

USE [mohammadpatel_db]  

GO  

SELECT  
	SalesMan.SalesmanID,SalesMan.Names as SalesPerson,  
	Customer.CustomerName,  
	Customer.City,  
	Customer.Grade,  
	Orders.OrderNumber,  
	Orders.OrderDate,  
	Orders.PurchaseAmount  
FROM  
	SalesMan  
RIGHT OUTER JOIN  
	Orders on SalesMan.SalesmanID=Orders.SalesmanID  

LEFT OUTER JOIN  
	Customer on SalesMan.SalesmanID=Customer.SalesmanID  

WHERE   
	Orders.PurchaseAmount>=2000 and Customer.Grade is not NULL


-- Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a  grade and placed one or more orders or which order(s) have been placed by the  customer who neither is on the list nor has a grade.

USE [mohammadpatel_db]  

GO  
SELECT  
	Customer.CustomerName,  
	Customer.City,  
	Orders.OrderNumber,  
	Orders.OrderDate,  
	Orders.PurchaseAmount  
FROM   
	Customer  
LEFT JOIN  
	Orders on Customer.SalesmanID=Orders.SalesmanID  
WHERE   
	((SELECT count(Customer.CustomerID) from Customer)>=1 AND Customer.Grade IS NOT NULL)  
	OR  
	(Customer.CustomerID NOT IN (SELECT Customer.CustomerID from Customer) AND 		Customer.Grade IS NULL)   
GROUP BY  
	Customer.CustomerName,  
	Customer.City,  
	Orders.OrderNumber,  
	Orders.OrderDate,  
	Orders.PurchaseAmount  


--Write a SQL query to combine each row of the salesman table with each row of the customer table 

SELECT * FROM SalesMan CROSS JOIN Customer  

--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that  salesperson who belongs to that city.  

SELECT * FROM SalesMan CROSS JOIN Customer WHERE SalesMan.CIty=Customer.City  

--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade  

SELECT SalesMan.Names,Customer.CustomerName FROM SalesMan CROSS JOIN Customer WHERE SalesMan.CIty=Customer.City AND Customer.Grade IS NOT NULL

-- Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to city which is not the same as his customer and the customers should have their own grade  

  

SELECT SalesMan.Names,SalesMan.CIty,Customer.CustomerName,Customer.City FROM SalesMan CROSS JOIN Customer WHERE NOT SalesMan.CIty=Customer.City AND Customer.Grade IS NOT NULL 