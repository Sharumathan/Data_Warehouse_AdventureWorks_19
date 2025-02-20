USE AdventureWorks_WareHouse

drop table DimProduct
CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    ProductName NVARCHAR(100) NOT NULL,
    ProductSubcategoryID INT NULL,
    ProductSubcategoryName NVARCHAR(100) NULL
);


CREATE TABLE DimProductCategory (
    CategoryKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductCategoryID INT NOT NULL,
    CategoryName NVARCHAR(100) NOT NULL
);


CREATE TABLE DimSalesTerritory (
    TerritoryKey INT IDENTITY(1,1) PRIMARY KEY,
    TerritoryID INT NOT NULL,
    TerritoryName NVARCHAR(100) NOT NULL,
    CountryRegionCode NVARCHAR(100) NOT NULL
);


CREATE TABLE DimDate (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    MonthName NVARCHAR(50) NOT NULL,
    DayOfMonth INT NOT NULL
);

CREATE TABLE FactSalesForecast (
    ForecastKey INT IDENTITY(1,1) PRIMARY KEY,
    Year INT NOT NULL,
    MonthName NVARCHAR(100) NOT NULL,
    DateKey INT NOT NULL,
    ForecastedSales DECIMAL(18,2),
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey)
);
CREATE TABLE FactSales (
    FactSalesID INT IDENTITY(1,1) PRIMARY KEY,
    SalesOrderID INT NOT NULL,
    OrderDateKey INT NOT NULL,
    DueDateKey INT NOT NULL,
    TerritoryKey INT NOT NULL,
    ProductKey INT NOT NULL,
    CategoryKey INT NOT NULL,  
    OrderQty SMALLINT NOT NULL,
    UnitPrice MONEY NOT NULL,
    TotalAmount MONEY NOT NULL,
    
    
    FOREIGN KEY (OrderDateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (DueDateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (TerritoryKey) REFERENCES DimSalesTerritory(TerritoryKey),
    FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
    FOREIGN KEY (CategoryKey) REFERENCES DimProductCategory(CategoryKey) 
);

