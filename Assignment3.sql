--Assignment 3


--select * from Employee
--select * from Depatment


--write a SQL query to find Employees who have the biggest salary in their Department

--select  Employee.DepartmentID,Depatment.DepartmentName,Employee.EmployeeName,Employee.Salary
--from Employee 
--join Depatment on Employee.DepartmentID=Depatment.DepartmentID
--join(select Employee.DepartmentID, MAX(Employee.Salary) as max_slary
--	From Employee
--	Group by Employee.DepartmentID
--	)AS m on Employee.DepartmentID=m.DepartmentID and Employee.Salary=m.max_slary
--group by Employee.DepartmentID,Depatment.DepartmentName

-- write a SQL query to find Departments that have less than 3 people in it

--select COUNT(Employee.DepartmentID) as [Number of Employee in Department],Depatment.DepartmentName 
--from Employee 
--join Depatment on Employee.DepartmentID=Depatment.DepartmentID
--group by Depatment.DepartmentName
--having COUNT(Employee.DepartmentID)<10


-- write a SQL query to find All Department along with the number of people there/*select COUNT(Employee.DepartmentID) as [Number of Employee in Department],Depatment.DepartmentName from Employee join Depatment on Employee.DepartmentID=Depatment.DepartmentID
group by Depatment.DepartmentName

*/


-- write a SQL query to find All Department along with the total salary there

--select Sum(Employee.Salary) as [Total salary of the department],Depatment.DepartmentName from Employee join Depatment on Employee.DepartmentID=Depatment.DepartmentID
--group by Depatment.DepartmentName