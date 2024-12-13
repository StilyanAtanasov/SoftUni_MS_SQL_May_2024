USE [Minions]
GO

CREATE TABLE [Minions] (
  [Id] INT PRIMARY KEY, 
  [Name] NVARCHAR(50), 
  [Age] SMALLINT
)

CREATE TABLE [Towns] (
  [Id] INT PRIMARY KEY, 
  [Name] NVARCHAR(50),
)