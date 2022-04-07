USE OrderDb
GO
1)--Display the details from Customer table who is from country Germany

SELECT * FROM Customer
WHERE Country= 'GERMANY';

select * from OrderTable

update OrderTable
set OrderDate='20220402'
where OrderId=3

CREATE TABLE Employee(
EmployeeId int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(40),
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(40),);



INSERT INTO dbo.Employee(FirstName,LastName,City,Country,Phone)
VALUES ('KORRAI','Kavya','VIZAG','INDIA','8639293390'),
('K','Pravallika','MUMBAI','INDIA','8639293390'),
('B','Rajput','CHEENAI','UK','030-0074321'),
('RAM','Hari','BANGALORE','GERMANY','7894561230'),
('Mahni','DHeeraj','PUNE','INDIA','1234567890');

2)--Display the  full name of the employee  

SELECT * FROM Employee
--Display the  customer details  who has Fax number

3)SELECT * FROM Customer 
WHERE FaxNumber like '[+]%'or FaxNumber like '%-%'

4)--display the customer details whose name holds second letter as U

SELECT * FROM Customer
WHERE LastName LIKE '%U'

5)--select order Details where unit price is greater than 10 and less than 20

SELECT * FROM OrderItemTable
WHERE UnitPrice > 10 AND UnitPrice < 20

6)--Display order details which contains shipping date and arrange the order by date

SELECT OrderDate AS SHIPPING_DATE 
FROM OrderTable
ORDER BY OrderDate ASC

7)--Print the orders shipped by ship name 'La corned'abondance' between 2 dates(Choose dates of your choice)

SELECT ShipName
FROM OrderTable
where ShipName =''La corned abondance' AND'OrderDate BETWEEN '2022-04-02' AND '2022-04-05' 
ORDER BY OrderDate ASC

8)--Print the products supplied by 'Exotic Liquids'

SELECT * FROM ProductTable
WHERE Package ='EXOTIC LIQUIDS'

--print the average quantity ordered for every product

SELECT AVG(QUANTITY) AS Avg_Quantity
FROM OrderItemTable
GROUP BY ProductId

--Print all the Shipping company name and the ship names if they are operational

SELECT ShipCompany, ShipName
From ShippingTable
Where Operational = 'yes'

--Print all Employees with Manager Name

SELECT E.NAME AS EMPLOYEE_NAME,M.NAME AS MANAGER_NAME
FROM Employee E JOIN Employee M
ON E.MANAGER=M.MANAGER

--Print the bill for a given order id .bill should contain Productname, Categoryname,price after discount

SELECT OI.OrderId,P.ProductName,P.Category,P.Discount
FROM ProductTable P INNER JOIN OrderItemTable OI
ON P.ProductId=OI.ProductId

--Print the Total price of orders which have the products supplied by 'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name

SELECT SUM(UnitPrice) As Total,CompanyName 
FROM ProductTable 
GROUP BY ProductSupplied
having ProductSupplied ='exotic liquids' and UnitPrice >50;
