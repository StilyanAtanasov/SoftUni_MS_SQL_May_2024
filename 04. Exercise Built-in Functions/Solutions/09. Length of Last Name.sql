USE [SoftUni]
GO

SELECT
        [FirstName],
        [LastName]
FROM
        [dbo].[Employees]
WHERE
        LEN([LastName]) = 5