Use AdventureWorks2014
Go
--A query that identifies the top 2 valuable currencies of each year and season 


--First Query
Select ToCurrencyCode, CurrencyRateDate, Max(AverageRate) as MostValuableCurrency,
Case
	When month(CurrencyRateDate) In (12, 01, 02) Then 'Winter'
	When Month(CurrencyRateDate) In (03, 04, 05) Then 'Spring'
	When Month(CurrencyRateDate) In (06, 07, 08) Then 'Summer'
	Else 'Autumn'
end AS Season
From Sales.CurrencyRate
Group By AverageRate, ToCurrencyCode, CurrencyRateDate;

--Second Query
Select * from 
	(select 
		ToCurrencyCode, CurrencyRateDate, AverageRate,
		dense_rank() OVER (Partition By CurrencyRateDate Order By AverageRate desc) as ranking,
		Case
			When Year(CurrencyRateDate) In (12, 01, 02) Then 'Winter'
			When Month(CurrencyRateDate) In (03, 04, 05) Then 'Spring'
			When Month(CurrencyRateDate) In (06, 07, 08) Then 'Summer'
			Else 'Autumn'
		end AS Season
	From  Sales.CurrencyRate) a
Where a.ranking <=2;
		

