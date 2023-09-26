CREATE DATABASE Order_Stores_Data Use Order_Stores_DataCREATE TABLE Orders_Table
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
UPDATE Stores_Table
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

--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheetUPDATE Orders_Table
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

 --Q7) Update the missing records in the PromoInterval Column in Stores Table. UPDATE Stores_Table
SET PromoInterval = 
case
WHEN Store_Id = 4 then 'Compass' 
WHEN Store_Id = 7 then 'Torch'
WHEN Store_Id = 9 then 'Phone'

END
WHERE Store_Id
 in ( 4,7,9)

 --Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.EXEC sp_rename 'Stores_Table.[Assortment]', 'Store_Nos'SELECT * FROM Orders_Table--Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.EXEC sp_rename 'Orders_Table.[Order_Item]', 'Item_name'EXEC sp_rename 'Orders_Table.[Rep]', 'Customers_name'--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.SELECT Unit_Cost,Total_Price from Orders_TableORDER BY Unit_Cost DESC, Total_Price ASC--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.SELECT Region, COUNT(Customers_name) AS  Cus_NameFROM Orders_Table GROUP BY Region--Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table SELECT SUM(Total_Price + Unit_Cost) AS TOTALFROM Orders_Table--Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.SELECT OrderDate,Unit_Cost,StoreType,[Year] FROM Orders_Table INNER JOIN Stores_Table ON Orders_Table.Order_Id = Stores_Table.Store_Id--Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9SELECT Item_name, Region from Orders_TableWHERE Order_Id IN (4,5,6,9)--Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160SELECT [Year] FROM Stores_TableWHERE CompetitionDistance IN (29910  , 310 , 3160)--Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400SELECT Item_name FROM Orders_TableWHERE Total_Price >=200 and Total_Price <=400--Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.EXEC SP_RENAME 'Stores_Table.CompetitionDistance', 'CD'SELECT SUM(CD) AS CD FROM Stores_Table--Q18) What is the Total Count of Stores_Type and CD columnsSELECT COUNT(StoreType) AS Stores_Type, COUNT(CD) AS CDFROM Stores_Table--Q19) Apply the Cross Join in  Orders_Table and Stores_Table.SELECT *FROM Orders_Table Cross JoinStores_Table--Q20) DROP both the databasesDROP TABLE Orders_TableDROP TABLE Stores_Table