CREATE DATABASE ASSIGNMENT1;

CREATE TABLE Salesman (
    SalesmanId INT,
    SalesmanName VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);
INSERT INTO Salesman (SalesmanId, SalesmanName, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

	CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    );

	INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);


	CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money)

	INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

Select * From orders;
Select * From Salesman;
Select * from Customer;

--QUESTION NO 1 = INSERTED NEW COLUMN IN ORDER

Alter table Orders
ADD Email Varchar (20);

--QUESTION NO 6 = RIGHT JOINED SALESMAN AND ORDER TABLE

Select salesman.SalesmanId,salesman.SalesmanName,salesman.City,salesman.Age,orders.OrderId,orders.SalesmanId,orders.CustomerId,orders.Orderdate
FROM Salesman
RIGHT JOIN orders
ON salesman.SalesmanId=orders.SalesmanId;

--QUESTION NO 2 = ADDING PRIMARY KEY TO SALESMAN TABLE

alter table Salesman
alter column SalesmanId int not null

ALTER TABLE Salesman
ADD CONSTRAINT pk_table_name PRIMARY KEY (SalesmanId);

--QUESTION NO 2 = ADDING FORIENGN KEY TO SALESMANID FROM COUSTOMER TABLE

alter table Customer
alter column PurchaseAmount int not null

-- From not null constraint adding primary key

ALTER TABLE Customer
add CONSTRAINT pk_purchaseamount Primary Key (PurchaseAmount) 

-- Configuring Foreign key constraint

ALTER TABLE Customer with nocheck
ADD FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId);

--QUESTION NO 2 =ADDING DEFAULT CONSTRAIN TO CITY COLUMN IN SALESMAN TABLE

ALTER TABLE Salesman
ADD CONSTRAINT df_City
DEFAULT 'Chicago' FOR City;

--QUESTION NO 3 = Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500
SELECT * FROM Customer
 where CustomerName like '%N' and PurchaseAmount > 500;

 --QUESTION NO 4 = Using SET operators, retrieve the first result with unique SalesmanId values from two
---tables, and the other result containing SalesmanId with duplicates from two tables.

SELECT SalesmanId from Salesman
UNION
SELECT SalesmanId from Customer;

-- Retrieve SalesmanId with duplicates from two tables
SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Customer;

----QUESTION NO 5 = Display the below columns which has the matching data.Orderdate, Salesman Name, Customer Name, Commission, and City which has the-
----range of Purchase Amount between 500 to 150
SELECT orderdate,SalesmanName, CustomerName, commission, City
FROM SALESMAN as S 
join Customer as C
ON  S.SalesmanId = C.SalesmanId
join orders as O
on S.salesmanid = O.SalesmanId
where PurchaseAmount between 500  and 1500;
