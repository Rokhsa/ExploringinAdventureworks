--A Query which show for each Product'Color, what is Ordered Quantity in diffrenet years
--1
Use AdventureWorks2014
Select * From 
(
	Select 
		OrderQty, Color, DueDate 
	From 
		Production.WorkOrder w
		Inner Join Production.Product p
			On p.ProductID = w.ProductID
) t
Pivot(
	Count(OrderQty)
	For Color In (
		[Black], [Blue], [Grey], [Multi], [Null],
		[Red], [Silver], [Silver/Black], [White],
		[Yellow])
		
) As Pivot_table;

--2

Select * From 
(
	Select 
		OrderQty, Color, DueDate 
	From 
		Production.WorkOrder w
		Inner Join Production.Product p
			On p.ProductID = w.ProductID
) t
Pivot(
	Count (Orderqty)
	For Duedate In (
		[2011], [2012], [2013], [2014])
		
) As Pivot_table;


--3

With ColorByOrder (DueDate, Color, OrderQty)
As(
	Select DueDate, Color, Count(OrderQty) As OrderQuantity
	From Production.WorkOrder w
		Right Join Production.Product p
			On p.ProductID = w.ProductID
	Group By DueDate, Color 
)
select *
From ColorByOrder;


--what is Standard Cost in diffrenet years

Select * From 
(
	Select 
		StandardCost, Color, DueDate 
	From 
		Production.WorkOrder w
		Inner Join Production.Product p
			On p.ProductID = w.ProductID
) t
Pivot(
	Sum (StandardCost)
	For Duedate In (
		[2011], [2012], [2013], [2014])
		
) As Pivot_table
