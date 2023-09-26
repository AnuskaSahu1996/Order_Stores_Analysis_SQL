CREATE DATABASE Order_Stores_Data 
 (Order_Id INT PRIMARY KEY,
 OrderDate DATE,
 Region VARCHAR(30),
 Rep VARCHAR(30),
 Order_Item varchar(50),
 Units int,
 Unit_Cost DECIMAL(10,2),
 Total_Price DECIMAL(10,2))


 CREATE TABLE Stores_Table
 (Store_Id INT PRIMARY KEY,
 StoreType VARCHAR(30),
 Assortment int,
 CompetitionDistance INT,
 [Month] INT,
 [Year] INT,
 PromoInterval VARCHAR(30))


 INSERT INTO Orders_Table (OrderDate,Region,Rep,Order_Item,Units,Unit_Cost,Total_Price,Order_Id)
 values
 ('1/6/21','East','Aruna','Pencil',95,1.99,189.05,1),
 ('1/23/21','Central','Kivell','Eraser',50,	19.99,999.50,2),
('2/9/21','Central','Ganesh',null,36, 4.99,179.64,3),
('2/26/21','Central','Payal',null,27,19.99,539.73,4),
('3/15/21','West','Sorvino',null,56, 2.99,167.44,5),
('4/1/21','East','Hitesh','Pencil',60,4.99,299.40,6),
('4/18/21','Central','Akshita',null,75,1.99,149.25,7),
('5/5/21','Central','Ruchika','Books',90,4.99,449.10,8),
('5/22/21',	'West','Surbhi',null,32,1.99,63.68,9),
('6/8/21','East','Jones','Suitcase',60,8.99,539.40,10)


INSERT INTO Stores_Table (Store_Id,StoreType,Assortment,CompetitionDistance,[Month],[Year],PromoInterval)
 values
(1,	'c',	16,	1270,	9,	2008,	'Jan'),
(2,	'a',	35,	570,11,	2007,	'Feb'),
(3,	'a',	21,	14130,	12,	2006,	'Mar'),
(4,	'c',	38,	620,	9,	2009,	null),
(5,	'a',	20,	29910,	4,	2015,	'May'),
(6,	'a',	31,	310,	12,	2013,	'June'),
(7,	'a',	37,	24000,	4,2013,	null),
(8,	'a',	18,	7520,	10,	2014,	'Aug'),
(9,	'a',	37,	2030,	8,2000,	null),
(10,'a',	50,	3160,	9,	2009,	'Oct')

select * from Stores_Table

--Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.
ALTER TABLE Stores_Table
ADD Store_Names varchar(50)

SET Store_Names = 
case
WHEN Store_Id = 1 then 'Car' 
WHEN Store_Id = 2 then 'Bikes'
WHEN Store_Id = 3 then 'Hardware'
WHEN Store_Id = 4 then 'Electrics'
WHEN Store_Id = 5 then 'Fibers'
WHEN Store_Id = 6 then 'Elastics'
WHEN Store_Id = 7 then 'Books'
WHEN Store_Id = 8 then 'Shoes'
WHEN Store_Id = 9 then 'Clothes'
WHEN Store_Id = 10 then 'Scraps'
END
WHERE Store_Id in (1, 2, 3,4,5,6,7,8,9,10)

--Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table

ALTER TABLE Stores_Table
ADD FOREIGN KEY (Store_Id) REFERENCES Orders_Table (Order_Id)

--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet
SET Order_Item = 
case
WHEN Order_Id = 3 then 'Compass' 
WHEN Order_Id = 4 then 'Torch'
WHEN Order_Id = 5 then 'Phone'
WHEN Order_Id = 7 then 'Laptop'
WHEN Order_Id = 9 then 'Box'

END
WHERE Order_Id

 in ( 3,4,5,7,9)

 --Q7) Update the missing records in the PromoInterval Column in Stores Table.
SET PromoInterval = 
case
WHEN Store_Id = 4 then 'Compass' 
WHEN Store_Id = 7 then 'Torch'
WHEN Store_Id = 9 then 'Phone'

END
WHERE Store_Id
 in ( 4,7,9)

 --Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.