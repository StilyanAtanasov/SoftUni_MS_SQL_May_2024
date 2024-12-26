USE [SoftUni]
GO

SELECT
        [FirstName],
        [LastName]
FROM
        [dbo].[Employees]
WHERE
        [LastName] LIKE '%ei%'