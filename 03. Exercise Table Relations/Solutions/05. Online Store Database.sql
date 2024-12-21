CREATE DATABASE [OnlineStore]
GO

USE [OnlineStore]
GO

CREATE TABLE [Orders] (
    [OrderID]    INT NOT NULL,
    [CustomerID] INT NOT NULL
);

CREATE TABLE [OrderItems] (
    [OrderID] INT NOT NULL,
    [ItemID]  INT NOT NULL
);

CREATE TABLE [Items] (
    [ItemID]     INT           NOT NULL,
    [Name]       NVARCHAR(255) NOT NULL,
    [ItemTypeID] INT           NOT NULL
);

CREATE TABLE [Customers] (
    [CustomerID] INT           NOT NULL,
    [Name]       NVARCHAR(255) NOT NULL,
    [Birthday]   DATE          NOT NULL,
    [CityID]     INT           NOT NULL
);

CREATE TABLE [ItemTypes] (
    [ItemTypeID] INT           NOT NULL,
    [Name]       NVARCHAR(255) NOT NULL
);

CREATE TABLE [Cities] (
    [CityID] INT           NOT NULL,
    [Name]   NVARCHAR(255) NOT NULL
);

ALTER TABLE [Orders] 
ADD CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderID]);

ALTER TABLE [OrderItems] 
ADD CONSTRAINT [PK_OrderItems] PRIMARY KEY ([OrderID], [ItemID]);

ALTER TABLE [Items] 
ADD CONSTRAINT [PK_Items] PRIMARY KEY ([ItemID]);

ALTER TABLE [Customers] 
ADD CONSTRAINT [PK_Customers] PRIMARY KEY ([CustomerID]);

ALTER TABLE [ItemTypes] 
ADD CONSTRAINT [PK_ItemTypes] PRIMARY KEY ([ItemTypeID]);

ALTER TABLE [Cities] 
ADD CONSTRAINT [PK_Cities] PRIMARY KEY ([CityID]);

---

ALTER TABLE [OrderItems] 
ADD CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY ([OrderID]) REFERENCES [Orders] ([OrderID]);

ALTER TABLE [OrderItems] 
ADD CONSTRAINT [FK_OrderItems_Items] FOREIGN KEY ([ItemID]) REFERENCES [Items] ([ItemID]);

ALTER TABLE [Items] 
ADD CONSTRAINT [FK_Items_ItemTypes] FOREIGN KEY ([ItemTypeID]) REFERENCES [ItemTypes] ([ItemTypeID]);

ALTER TABLE [Customers] 
ADD CONSTRAINT [FK_Customers_Cities] FOREIGN KEY ([CityID]) REFERENCES [Cities] ([CityID]);

ALTER TABLE [Orders] 
ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Customers] ([CustomerID]);