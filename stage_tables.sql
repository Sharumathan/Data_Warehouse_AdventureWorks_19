CREATE DATABASE AdventureWorks_staging
USE AdventureWorks_staging

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


CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    PersonID INT NULL,
    StoreID INT NULL,
    TerritoryID INT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE DimPerson (
    BusinessEntityID INT PRIMARY KEY,
    PersonType NCHAR(2) NOT NULL,
    NameStyle BIT NOT NULL,
    Title NVARCHAR(8) NULL,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(50) NULL,
    LastName NVARCHAR(50) NOT NULL,
    Suffix NVARCHAR(10) NULL,
    EmailPromotion INT NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO


CREATE TABLE DimProduct (
    ProductID INT NOT NULL,                   
    Name NVARCHAR(255),
    ListPrice MONEY,
    SellStartDate DATETIME,
    ProductSubcategoryID INT,                  
    ModifiedDate DATETIME,
);
GO

CREATE TABLE DimSalesTerritory (
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


CREATE TABLE DimSalesOrderDetail (
    SalesOrderID INT NOT NULL,
    SalesOrderDetailID INT  NOT NULL,
    CarrierTrackingNumber NVARCHAR(25) NULL,
    OrderQty SMALLINT NOT NULL,
    ProductID INT NOT NULL,
    SpecialOfferID INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    UnitPriceDiscount MONEY NOT NULL,
    LineTotal MONEY NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY (SalesOrderID, SalesOrderDetailID)
);
GO

CREATE TABLE DimSalesOrderHeader (
    SalesOrderID INT  NOT NULL PRIMARY KEY,
    RevisionNumber TINYINT NOT NULL,
    OrderDate DATETIME NOT NULL,
    DueDate DATETIME NOT NULL,
    ShipDate DATETIME NULL,
    Status TINYINT NOT NULL,
    OnlineOrderFlag BIT NOT NULL,
    SalesOrderNumber NVARCHAR(200),
    PurchaseOrderNumber NVARCHAR(50) NULL,
    AccountNumber NVARCHAR(50) NULL,
    CustomerID INT NOT NULL,
    SalesPersonID INT NULL,
    TerritoryID INT NULL,
    BillToAddressID INT NOT NULL,
    ShipToAddressID INT NOT NULL,
    ShipMethodID INT NOT NULL,
    CreditCardID INT NULL,
    CreditCardApprovalCode VARCHAR(15) NULL,
    CurrencyRateID INT NULL,
    SubTotal MONEY NOT NULL,
    TaxAmt MONEY NOT NULL,
    Freight MONEY NOT NULL,
    TotalDue DECIMAL(18, 2),
    Comment NVARCHAR(128) NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO
