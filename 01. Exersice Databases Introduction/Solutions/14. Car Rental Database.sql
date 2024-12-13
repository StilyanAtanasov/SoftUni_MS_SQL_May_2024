CREATE DATABASE [CarRental]
GO

USE [CarRental]
GO

CREATE TABLE [Categories] (
[Id] INT PRIMARY KEY NOT NULL,
[CategoryName] VARCHAR(70) NOT NULL,
[DailyRate] DECIMAL(9, 4) NOT NULL,
[WeeklyRate] DECIMAL(9, 4) NOT NULL,
[MonthlyRate] DECIMAL(9, 4) NOT NULL,
[WeekendRate] DECIMAL(9, 4) NOT NULL
)

CREATE TABLE [Cars] (
[Id] INT PRIMARY KEY NOT NULL,
[PlateNumber] VARCHAR(70) NOT NULL,
[Manufacturer] VARCHAR(70) NOT NULL,
[Model] VARCHAR(70) NOT NULL,
[CarYear] SMALLINT NOT NULL,
[CategoryId] INT NOT NULL,
[Doors] TINYINT,
[Picture] VARBINARY,
[Condition] VARCHAR(20),
[Available] BIT NOT NULL
)

CREATE TABLE [Employees] (
[Id] INT PRIMARY KEY NOT NULL,
[FirstName] VARCHAR(50) NOT NULL,
[LastName] VARCHAR(50) NOT NULL,
[Title] VARCHAR(70) NOT NULL,
[Notes] VARCHAR(70)
)

CREATE TABLE [Customers] (
[Id] INT PRIMARY KEY NOT NULL,
[DriverLicenceNumber] INT NOT NULL,
[FullName] VARCHAR(100) NOT NULL,
[Address] VARCHAR(120) NOT NULL,
[City] VARCHAR(70) NOT NULL,
[ZIPCode] INT,
[Notes] VARCHAR(70)
)

CREATE TABLE [RentalOrders] (
[Id] INT PRIMARY KEY NOT NULL,
[EmployeeId] INT NOT NULL,
[CustomerId] INT NOT NULL,
[CarId] INT NOT NULL,
[TankLevel] INT NOT NULL,
[KilometrageStart] INT NOT NULL,
[KilometrageEnd] INT NOT NULL,
[TotalKilometrage] INT NOT NULL,
[StartDate] DATETIME2 NOT NULL,
[EndDate] DATETIME2 NOT NULL, 
[TotalDays] SMALLINT NOT NULL,
[RateApplied] DECIMAL(7, 2) NOT NULL,
[TaxRate] DECIMAL(7, 4) NOT NULL,
[OrderStatus] BIT NOT NULL,
[Notes] VARCHAR(70)
)

INSERT INTO [Categories] ([Id], [CategoryName], [DailyRate], [WeeklyRate], [MonthlyRate], [WeekendRate])
VALUES (1, 'Economy', 29.99, 199.99, 799.99, 49.99),
       (2, 'Luxury', 99.99, 599.99, 2199.99, 149.99),
       (3, 'SUV', 49.99, 299.99, 1199.99, 69.99);

INSERT INTO [Cars] ([Id], [PlateNumber], [Manufacturer], [Model], [CarYear], [CategoryId], [Doors], [Condition], [Available])
VALUES (1, 'ABC123', 'Toyota', 'Corolla', 2021, 1, 4, 'Excellent', 1),
       (2, 'XYZ789', 'Mercedes', 'S-Class', 2022, 2, 4, 'New', 1),
       (3, 'SUV456', 'Ford', 'Explorer', 2020, 3, 5, 'Good', 1);

INSERT INTO [Employees] ([Id], [FirstName], [LastName], [Title], [Notes])
VALUES (1, 'John', 'Doe', 'Manager', 'Experienced'),
       (2, 'Jane', 'Smith', 'Assistant Manager', 'Detail-oriented'),
       (3, 'Robert', 'Brown', 'Customer Service', 'Friendly');

INSERT INTO [Customers] ([Id], [DriverLicenceNumber], [FullName], [Address], [City], [ZIPCode], [Notes])
VALUES (1, 123456, 'Alice Johnson', '123 Maple St', 'Springfield', 12345, NULL),
       (2, 789012, 'Bob Davis', '456 Oak Ave', 'Rivertown', 67890, 'New customer'),
       (3, 345678, 'Cathy Lee', '789 Pine Blvd', 'Lakeside', 54321, 'VIP member');

INSERT INTO [RentalOrders] ([Id], [EmployeeId], [CustomerId], [CarId], [TankLevel], [KilometrageStart], [KilometrageEnd], [TotalKilometrage], [StartDate], [EndDate], [TotalDays], [RateApplied], [TaxRate], [OrderStatus], [Notes])
VALUES (1, 1, 1, 1, 100, 20000, 20500, 500, '2024-12-01', '2024-12-05', 4, 29.99, 0.07, 1, NULL),
       (2, 2, 2, 2, 80, 15000, 15100, 100, '2024-12-02', '2024-12-03', 1, 99.99, 0.07, 1, 'Late return'),
       (3, 3, 3, 3, 60, 30000, 30250, 250, '2024-12-03', '2024-12-07', 4, 49.99, 0.07, 0, 'Pending payment');