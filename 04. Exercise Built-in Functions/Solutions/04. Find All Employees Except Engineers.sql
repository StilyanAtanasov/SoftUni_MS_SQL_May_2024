USE [SoftUni]
GO

SELECT
        [FirstName],
        [LastName]
FROM
        [dbo].[Employees]
WHERE
        [JobTitle] NOT LIKE '%engineer%'
