CREATE DATABASE [TouristAgency]
GO

USE [TouristAgency]
GO

CREATE TABLE [Countries] (
        [Id]    INT PRIMARY KEY IDENTITY,
	[Name]  NVARCHAR(50) NOT NULL
)

CREATE TABLE [Destinations] (
        [Id]        INT PRIMARY KEY IDENTITY,
	[Name]      VARCHAR(50) NOT NULL,
	[CountryId] INT NOT NULL CONSTRAINT [CK_Destinations-CountryId_Countries-Id] FOREIGN KEY REFERENCES [Countries]([Id])
)

CREATE TABLE [Rooms] (
	[Id]        INT PRIMARY KEY IDENTITY,
	[Type]      VARCHAR(40) NOT NULL,
	[Price]     DECIMAL(18, 2) NOT NULL,
	[BedCount]  INT NOT NULL CONSTRAINT [CK_Rooms_BedCount_Range] CHECK([BedCount] BETWEEN 1 and 10)
)

CREATE TABLE [Hotels] (
	[Id]            INT PRIMARY KEY IDENTITY,
	[Name]          VARCHAR(50) NOT NULL,
	[DestinationId] INT NOT NULL CONSTRAINT [CK_Hotels-DestinationId_Destinations-Id] FOREIGN KEY REFERENCES [Destinations]([Id])
)

CREATE TABLE [Tourists] (
	[Id]            INT PRIMARY KEY IDENTITY,
	[Name]          NVARCHAR(80) NOT NULL,
	[PhoneNumber]   VARCHAR(20) NOT NULL,
	[Email]         VARCHAR(80),
	[CountryId]     INT NOT NULL CONSTRAINT [CK_Tourists-CountryId_Countries-Id] FOREIGN KEY REFERENCES [Countries]([Id])
)

CREATE TABLE [Bookings] (
	[Id]            INT PRIMARY KEY IDENTITY,
	[ArrivalDate]   DATETIME2 NOT NULL,
	[DepartureDate] DATETIME2 NOT NULL,
	[AdultsCount]   INT NOT NULL CONSTRAINT [CK_Bookings_AdultsCount_Range] CHECK([AdultsCount] BETWEEN 1 and 10),
	[ChildrenCount] INT NOT NULL CONSTRAINT [CK_Bookings_ChildrenCount_Range] CHECK([ChildrenCount] BETWEEN 0 and 9),
	[TouristId]     INT NOT NULL CONSTRAINT [CK_Bookings-TouristId_Tourists-Id] FOREIGN KEY REFERENCES [Tourists]([Id]),
	[HotelId]       INT NOT NULL CONSTRAINT [CK_Bookings-HotelId_Hotels-Id] FOREIGN KEY REFERENCES [Hotels]([Id]),
	[RoomId]        INT NOT NULL CONSTRAINT [CK_Bookings-RoomId_Rooms-Id] FOREIGN KEY REFERENCES [Rooms]([Id])
)

CREATE TABLE [HotelsRooms] (
	[HotelId]   INT NOT NULL CONSTRAINT [CK_HotelsRooms-HotelId_Hotels-Id] FOREIGN KEY REFERENCES [Hotels]([Id]),
	[RoomId]    INT NOT NULL CONSTRAINT [CK_HotelsRooms-RoomId_Rooms-Id] FOREIGN KEY REFERENCES [Rooms]([Id]),
	CONSTRAINT [PK_HotelsRooms] PRIMARY KEY ([HotelId],[RoomId])
)