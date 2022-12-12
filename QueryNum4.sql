Use AdventureWorks2014
Go

-- A query which show the location of products 

--First Query
Select 
		Production.Product.Name As ProductName, 
		production.ProductInventory.Shelf,
		production.ProductInventory.Bin,
		Production.Location.Name AS LocationName
	From 
		Production.Product
		Join Production.ProductInventory
			On Production.Product.ProductID = Production.ProductInventory.ProductID
		Join Production.Location
			On Production.Location.LocationID = Production.ProductInventory.LocationID;

--Create Temp table for our junction table
Create table #temp_Location4Product (
ProductName nvarchar(50), 
Shelf nvarchar(10), 
Bin tinyint, 
LocationName nvarchar(50)
)

INSERT INTO #temp_Location4Product
Select 
		Production.Product.Name As ProductName, 
		production.ProductInventory.Shelf,
		production.ProductInventory.Bin,
		Production.Location.Name AS LocationName
	From 
		Production.Product
		Join Production.ProductInventory
			On Production.Product.ProductID = Production.ProductInventory.ProductID
		Join Production.Location
			On Production.Location.LocationID = Production.ProductInventory.LocationID;

--Second
Select 
		Production.Product.Name As ProductName, 
		production.ProductInventory.Shelf,
		production.ProductInventory.Bin,
		CONCAT(Shelf, bin) AS LocationType,
		Production.Location.Name AS LocationName
	From 
		Production.Product
		Join Production.ProductInventory
			On Production.Product.ProductID = Production.ProductInventory.ProductID
		Join Production.Location
			On Production.Location.LocationID = Production.ProductInventory.LocationID;



