CREATE DATABASE AdventureWorks_WareHouse

USE AdventureWorks_WareHouse

CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL, 
    FirstName  NVARCHAR(100),
    LastName  NVARCHAR(100),
    TerritoryID INT,         
    ModifiedDate DATETIME,
    -- SCD Type 2 Columns
    StartDate DATETIME,
    EndDate DATETIME,
    IsCurrent BIT
);
GO

CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,   
    FullDate DATE NOT NULL,
    [Year] INT NOT NULL,
    Quarter INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    MonthName VARCHAR(20),
    QuarterName VARCHAR(10)
);
GO


DECLARE @StartDate DATE = '2010-01-01';
DECLARE @EndDate DATE = '2030-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO DimDate (
        DateKey,
        FullDate,
        [Year],
        Quarter,
        Month,
        Day,
        MonthName,
        QuarterName
    )
    VALUES (
        CONVERT(INT, CONVERT(VARCHAR(8), @StartDate, 112)), 
        @StartDate,
        DATEPART(YEAR, @StartDate),
        DATEPART(QUARTER, @StartDate),
        DATEPART(MONTH, @StartDate),
        DATEPART(DAY, @StartDate),
        DATENAME(MONTH, @StartDate),
        'Q' + CONVERT(VARCHAR(1), DATEPART(QUARTER, @StartDate))
    );
    
    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;


-- Create DimProduct
CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,  
    ProductID INT NOT NULL,                   
    Name NVARCHAR(255),
    ListPrice MONEY,
    SellStartDate DATETIME,
    ProductSubcategoryID INT,                  
    ModifiedDate DATETIME,
    -- SCD Type 2 Columns
    StartDate DATETIME,
    EndDate DATETIME,
    IsCurrent BIT
);
GO


-- Create DimSalesTerritory
CREATE TABLE DimSalesTerritory (
    TerritoryKey INT IDENTITY(1,1) PRIMARY KEY,
    TerritoryID INT NOT NULL, 
    Name VARCHAR(100),
    CountryRegionCode NVARCHAR(3),
    SalesYTD MONEY,
    SalesLastYear MONEY,
    ModifiedDate DATETIME
);
GO
ALTER TABLE DimSalesTerritory
ALTER COLUMN Name NVARCHAR(200);


-- Create FactSales Table
CREATE TABLE FactSales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    SalesOrderID INT,         
    ProductKey INT,          
    CustomerKey INT,         
    TerritoryKey INT,         
    OrderDateKey INT,         
    DueDateKey INT,          
    OrderQty SMALLINT,
    SalesAmount MONEY,       
    CONSTRAINT FK_FactSales_Product FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
    CONSTRAINT FK_FactSales_Customer FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey)
    
);
GO





