USE [SoftUni]
GO

SELECT TOP (50)
        [e].[FirstName],
        [e].[LastName],
        [t].[Name] AS [Town],
        [a].[AddressText]
FROM
        [dbo].[Employees] AS [e]
    INNER JOIN
        [dbo].[Addresses] AS [a]
        ON [e].[AddressID] = [a].[AddressID]
    INNER JOIN
        [dbo].[Towns] AS [t]
        ON [a].[TownID] = [t].[TownID]
ORDER BY
        [e].[FirstName],
        [e].[LastName]