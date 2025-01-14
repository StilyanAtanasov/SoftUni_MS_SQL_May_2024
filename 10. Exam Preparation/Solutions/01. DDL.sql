CREATE DATABASE [RailwaysDb];
GO

USE [RailwaysDb];
GO

CREATE TABLE [Passengers] (
        [Id]    INT PRIMARY KEY IDENTITY,
        [Name]  NVARCHAR(80) NOT NULL
);

CREATE TABLE [Towns] (
        [Id]    INT PRIMARY KEY IDENTITY,
        [Name]  VARCHAR(30) NOT NULL
);

CREATE TABLE [RailwayStations] (
        [Id]        INT PRIMARY KEY IDENTITY,
        [Name]      VARCHAR(50) NOT NULL,
        [TownId]    INT NOT NULL CONSTRAINT [FK_RailwayStations-TownId_Towns-Id] FOREIGN KEY ([TownId]) REFERENCES [Towns]([Id])
);

CREATE TABLE [Trains] (
        [Id]                INT PRIMARY KEY IDENTITY,
        [HourOfDeparture]   VARCHAR(5) NOT NULL,
        [HourOfArrival]     VARCHAR(5) NOT NULL,
        [DepartureTownId]   INT NOT NULL CONSTRAINT [FK_Trains-DepartureTownId_Towns-Id] FOREIGN KEY ([DepartureTownId]) REFERENCES [Towns]([Id]),
        [ArrivalTownId]     INT NOT NULL CONSTRAINT [FK_Trains-ArrivalTownId_Towns-Id] FOREIGN KEY ([ArrivalTownId]) REFERENCES [Towns]([Id])
);

CREATE TABLE [TrainsRailwayStations] (
        [TrainId]           INT NOT NULL CONSTRAINT [FK_TrainsRailwayStations-TrainId_Trains-Id] FOREIGN KEY ([TrainId]) REFERENCES [Trains]([Id]),
        [RailwayStationId]  INT NOT NULL CONSTRAINT [FK_TrainsRailwayStations-RailwayStationId_RailwayStations-Id] FOREIGN KEY ([RailwayStationId]) REFERENCES [RailwayStations]([Id]),
        PRIMARY KEY ([TrainId], [RailwayStationId]),
);

CREATE TABLE [MaintenanceRecords] (
        [Id]                INT PRIMARY KEY IDENTITY,
        [DateOfMaintenance] DATE NOT NULL,
        [Details]           VARCHAR(2000) NOT NULL,
        [TrainId]           INT NOT NULL CONSTRAINT [FK_MaintenanceRecords-TrainId_Trains-Id] FOREIGN KEY ([TrainId]) REFERENCES [Trains]([Id])
);

CREATE TABLE [Tickets] (
        [Id]                INT PRIMARY KEY IDENTITY,
        [Price]             DECIMAL(18, 2) NOT NULL,
        [DateOfDeparture]   DATE NOT NULL,
        [DateOfArrival]     DATE NOT NULL,
        [TrainId]           INT NOT NULL CONSTRAINT [FK_Tickets-TrainId_Trains-Id] FOREIGN KEY ([TrainId]) REFERENCES [Trains]([Id]),
        [PassengerId]       INT NOT NULL CONSTRAINT [FK_Tickets-PassengerId_Passengers-Id] FOREIGN KEY ([PassengerId]) REFERENCES [Passengers]([Id])
);