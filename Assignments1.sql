CREATE DATABASE OrderDb
use OrderDb
/*Customer Table*/

CREATE TABLE Customer(
CustomerId int PRIMARY KEY,
FirstName nvarchar(40),
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(40),);

--Index for customer name
CREATE INDEX IndexOrderCustomerId
ON Customer(FirstName,LastName);

--insert data into customer table

INSERT INTO dbo.Customer(CustomerId,FirstName,LastName,City,Country,Phone)
VALUES (1,'KORRAI','BHARGAV','VIZAG','INDIA','8639293390'),
(2,'K','Pravallika','MUMBAI','INDIA','8639293390'),
(3,'B','Rajput','CHEENAI','INDIA','030-0074321'),
(4,'Kavya','CHARN','BANGALORE','INDIA','7894561230'),
(5,'Lalitha','DHeera','PUNE','INDIA','1234567890');


INSERT INTO dbo.Customer(CustomerId,FirstName,LastName,City,Country,Phone)
VALUES (6,'Ram','Indira','TEXAS','USA','0321456789'),
(7,'K','ARJUN','MUMBAI','INDIA','8639293390');


--SELECT * FROM Customer
--use OrderDb

/*OrderTable*/

CREATE TABLE OrderTable(
OrderId int PRIMARY KEY,
OrderDate datetime,
OrderNumber nvarchar(40),
CustomerId int FOREIGN KEY REFERENCES Customer(CustomerId),
TotalAmount decimal(12,2));

--insert data into Order

INSERT INTO OrderTable(OrderId,OrderDate,OrderNumber,CustomerId,TotalAmount)
values (1,05-04-2022,101,1,100.00),
(2,01-04-2022,101,1,200.00),
(3,02-04-2022,101,1,100.00);

--create index 

CREATE INDEX IndexOrderCustomerId
ON OrderTable(CustomerId);
CREATE INDEX IndexOrderOrderDate
ON OrderTable(OrderDate);

/*product table*/
CREATE TABLE ProductTable(
ProductId int PRIMARY KEY,
ProductName nvarchar(50),
UnitPrice decimal(12,2),
Package nvarchar(30),
IsDiscontinued bit);

--create index 

CREATE INDEX IndexProductSupplierId
ON ProductTable(ProductId);
CREATE INDEX IndexProductName
ON ProductTable(ProductName);

--insert data into product

INSERT INTO ProductTable(ProductId,ProductName,UnitPrice,Package,IsDiscontinued)
VALUES (1,'SEAFOOD',100.00,'EXOTIC LIQIDS',0),
(2,'TOYS',100.00,'ABC PACKAGE',0),
(3,'SEAFOOD',100.00,'ATZ',0);

/*Orderitemtable*/
CREATE TABLE OrderItemTable(
OrderItemId int PRIMARY KEY,
OrderId int FOREIGN KEY REFERENCES OrderTable(OrderId),
ProductId int FOREIGN KEY REFERENCES ProductTable(ProductId),
UnitPrice decimal(12,2),
Quantity int);

--create index 

CREATE INDEX IndexOrderItemOrderId
ON OrderItemTable(OrderItemId);
CREATE INDEX IndexOrderItemProductId
ON OrderItemTable(ProductID);

--insert data into OrderItem

INSERT INTO OrderItemTable(OrderItemId,OrderId,ProductId,UnitPrice,Quantity)
VALUES(1,1,1,100.00,1),
(2,2,2,200.00,2),
(3,3,3,200.00,1),
(4,4,4,100.00,1);

3)--Alter customer firstname and OrderTable by adding not null

ALTER TABLE dbo.Customer
Alter Column FirstName nvarchar(40) Not NULL;

--Alter customer OrderTable by adding not null DateTime

4)ALTER TABLE OrderTable
Alter Column OrderDate DateTime Not NULL;


--Display Customer details

5)SELECT * FROM Customer;

6)--DISPLAY COUNTER NAME STARTS WITH A OR I
SELECT Country FROM Customer
WHERE LastName like 'A%' or LastName like 'I%'







7)-- DISPLAY WHOSE NAME THIRD LETTER IS 'I'
SELECT Customer.FirstName,Customer.LastName
FROM dbo.Customer 
WHERE LastName LIKE '__I%';




