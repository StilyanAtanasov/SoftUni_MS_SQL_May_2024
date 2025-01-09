USE [SoftUni]
GO

CREATE PROCEDURE [usp_GetEmployeesFromTown] (@Town NVARCHAR(70)) AS (
SELECT
        [e].[FirstName],
        [e].[LastName]
FROM
        [dbo].[Towns] AS [t]
    INNER JOIN
        [Addresses] AS [a]
        ON [a].[TownID] = [t].[TownID]
    INNER JOIN
        [Employees] AS [e]
        ON [a].[AddressID] = [e].[AddressID]
WHERE
        [t].[Name] = @Town
)