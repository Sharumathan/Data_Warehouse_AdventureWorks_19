--- stageing process
USE  AdventureWorks_staging

CREATE TABLE SalesOrderHeader(
	[SalesOrderID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[TerritoryID] [int] NULL,
	[TotalDue] [decimal](18, 2) NULL,
	)

CREATE TABLE SalesOrderDetail(
	[SalesOrderID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[LineTotal] [money] NOT NULL,
	)

	
CREATE TABLE Product(
	[ProductID] [int] NOT NULL,
	[Name] [NVARCHAR](100) NOT NULL,
	[ProductSubcategoryID] [int] NULL,
	)
	
CREATE TABLE ProductCategory(
	[ProductCategoryID] [int]  NOT NULL,
	[Name] [NVARCHAR] (100) NOT NULL,
	)
 
CREATE TABLE ProductSubcategory(
	[ProductSubcategoryID] [int] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[Name] [NVARCHAR] (100) NOT NULL,
	)

CREATE TABLE SalesTerritory(
	[TerritoryID] [int] NOT NULL,
	[Name] [NVARCHAR] (100)NOT NULL,
	[CountryRegionCode] [nvarchar](100)NOT NULL,
	)

CREATE TABLE SalesOrderForecast(
	[Year] [int] NOT NULL,
	[MonthName] [NVARCHAR](100)NOT NULL,
	[SalesOrder][decimal](18, 2),
	)

