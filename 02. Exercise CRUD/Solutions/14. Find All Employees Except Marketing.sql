USE [SoftUni]
GO

SELECT
        [FirstName],
        [LastName]
FROM
        [dbo].[Employees]
WHERE
        [DepartmentID] <> 4