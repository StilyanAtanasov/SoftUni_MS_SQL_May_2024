CREATE DATABASE [Hotel]
GO

USE [Hotel]
GO

CREATE TABLE [Employees] (
    [Id] INT PRIMARY KEY NOT NULL,
    [FirstName] VARCHAR(50) NOT NULL,
    [LastName] VARCHAR(50) NOT NULL,
    [Title] VARCHAR(70) NOT NULL,
    [Notes] VARCHAR(255)
);

CREATE TABLE [Customers] (
    [AccountNumber] INT PRIMARY KEY NOT NULL,
    [FirstName] VARCHAR(50) NOT NULL,
    [LastName] VARCHAR(50) NOT NULL,
    [PhoneNumber] VARCHAR(15) NOT NULL,
    [EmergencyName] VARCHAR(50),
    [EmergencyNumber] VARCHAR(15),
    [Notes] VARCHAR(255)
);

CREATE TABLE [RoomStatus] (
    [RoomStatus] VARCHAR(50) PRIMARY KEY,
    [Notes] VARCHAR(255)
);

CREATE TABLE [RoomTypes] (
    [RoomType] VARCHAR(50) PRIMARY KEY,
    [Notes] VARCHAR(255)
);

CREATE TABLE [BedTypes] (
    [BedType] VARCHAR(50) PRIMARY KEY,
    [Notes] VARCHAR(255)
);

CREATE TABLE [Rooms] (
    [RoomNumber] INT PRIMARY KEY,
    [RoomType] VARCHAR(50) NOT NULL,
    [BedType] VARCHAR(50) NOT NULL,
    [Rate] DECIMAL(10, 2) NOT NULL,
    [RoomStatus] VARCHAR(50) NOT NULL,
    [Notes] VARCHAR(255)
);

CREATE TABLE [Payments] (
    [Id] INT PRIMARY KEY NOT NULL,
    [EmployeeId] INT NOT NULL,
    [PaymentDate] DATETIME2 NOT NULL,
    [AccountNumber] INT NOT NULL,
    [FirstDateOccupied] DATETIME2 NOT NULL,
    [LastDateOccupied] DATETIME2 NOT NULL,
    [TotalDays] INT NOT NULL,
    [AmountCharged] DECIMAL(10, 2) NOT NULL,
    [TaxRate] DECIMAL(5, 4) NOT NULL,
    [TaxAmount] DECIMAL(10, 2) NOT NULL,
    [PaymentTotal] DECIMAL(10, 2) NOT NULL,
    [Notes] VARCHAR(255)
);

CREATE TABLE [Occupancies] (
    [Id] INT PRIMARY KEY NOT NULL,
    [EmployeeId] INT NOT NULL,
    [DateOccupied] DATETIME2 NOT NULL,
    [AccountNumber] INT NOT NULL,
    [RoomNumber] INT NOT NULL,
    [RateApplied] DECIMAL(10, 2) NOT NULL,
    [PhoneCharge] DECIMAL(10, 2),
    [Notes] VARCHAR(255)
);

-- Insert sample data
INSERT INTO [Employees] ([Id], [FirstName], [LastName], [Title], [Notes])
VALUES (1, 'John', 'Doe', 'Manager', 'Long-time employee'),
       (2, 'Jane', 'Smith', 'Receptionist', 'Works mornings'),
       (3, 'Robert', 'Brown', 'Cleaner', 'Evening shift');

INSERT INTO [Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [EmergencyName], [EmergencyNumber], [Notes])
VALUES (1, 'Alice', 'Johnson', '555-1234', 'Bob Johnson', '555-5678', 'VIP customer'),
       (2, 'Charlie', 'Davis', '555-2345', 'Diana Davis', '555-6789', NULL),
       (3, 'Eve', 'Williams', '555-3456', 'Frank Williams', '555-7890', 'Regular guest');

INSERT INTO [RoomStatus] ([Id], [RoomStatus], [Notes])
VALUES (1, 'Available', 'Ready for check-in'),
       (2, 'Occupied', 'Currently in use'),
       (3, 'Out of Service', 'Requires maintenance');

INSERT INTO [RoomTypes] ([Id], [RoomType], [Notes])
VALUES (1, 'Single', 'One bed, ideal for one person'),
       (2, 'Double', 'Two beds, suitable for two people'),
       (3, 'Suite', 'Luxury accommodation with extra space');

INSERT INTO [BedTypes] ([Id], [BedType], [Notes])
VALUES (1, 'Twin', 'Two separate beds'),
       (2, 'Queen', 'One large bed'),
       (3, 'King', 'One extra-large bed');

INSERT INTO [Rooms] ([Id], [RoomNumber], [RoomType], [BedType], [Rate], [RoomStatus], [Notes])
VALUES (1, 101, 'Single', 'Twin', 100.00, 'Available', 'Near the elevator'),
       (2, 102, 'Double', 'Queen', 150.00, 'Occupied', 'Sea view'),
       (3, 201, 'Suite', 'King', 300.00, 'Available', 'Includes a kitchenette');

INSERT INTO [Payments] ([Id], [EmployeeId], [PaymentDate], [AccountNumber], [FirstDateOccupied], [LastDateOccupied], [TotalDays], [AmountCharged], [TaxRate], [TaxAmount], [PaymentTotal], [Notes])
VALUES (1, 1, '2024-12-01', 1, '2024-11-25', '2024-11-30', 5, 500.00, 0.07, 35.00, 535.00, 'Paid in full'),
       (2, 2, '2024-12-02', 2, '2024-11-29', '2024-12-01', 2, 300.00, 0.07, 21.00, 321.00, 'Late payment'),
       (3, 3, '2024-12-03', 3, '2024-11-28', '2024-12-02', 4, 1200.00, 0.07, 84.00, 1284.00, 'Paid in full');

INSERT INTO [Occupancies] ([Id], [EmployeeId], [DateOccupied], [AccountNumber], [RoomNumber], [RateApplied], [PhoneCharge], [Notes])
VALUES (1, 1, '2024-11-25', 1, 101, 100.00, 10.00, 'No issues'),
       (2, 2, '2024-11-29', 2, 102, 150.00, 15.00, 'Minor phone use'),
       (3, 3, '2024-11-28', 3, 201, 300.00, 20.00, 'Extended stay');
