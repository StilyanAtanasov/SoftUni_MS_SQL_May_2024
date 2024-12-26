USE [SoftUni]
GO

SELECT
        [FirstName],
        [LastName]
FROM
        [dbo].[Employees]
WHERE
        [FirstName] LIKE 'Sa%'