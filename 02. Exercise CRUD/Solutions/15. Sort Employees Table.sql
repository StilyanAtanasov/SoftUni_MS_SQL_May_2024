USE [SoftUni]
GO

SELECT
        *
FROM
        [dbo].[Employees]
ORDER BY
        [Salary] DESC,
        [FirstName],
        [LastName] DESC,
        [MiddleName]