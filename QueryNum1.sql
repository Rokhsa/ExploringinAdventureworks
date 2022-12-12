Use AdventureWorks2014
Go

--TVF for our Bill Of Materials
Create Function ComponentUsedIn
(
	@Component int
)
Returns Table
As
Return
With ComponentUsed AS
(
Select Name, ProductID, ComponentID, ProductAssemblyID, Sum(PerAssemblyQty) AS RequiredAmount
From Production.BillOfMaterials
	Join Production.Product
	On Production.BillOfMaterials.ComponentID = Production.Product.ProductID 
Group By Name, ProductID, ComponentID, ProductAssemblyID
)
Select *
From ComponentUsed;


--Now We Use our TVF
Select ProductID, Name, ComponentID, productAssemblyID
From dbo.ComponentUsedIn(1)
