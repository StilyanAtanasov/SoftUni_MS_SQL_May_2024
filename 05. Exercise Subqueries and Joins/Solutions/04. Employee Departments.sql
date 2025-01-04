USE [SoftUni]
GO

SELECT TOP (5)
        [e].[EmployeeID],
        [e].[FirstName],
        [e].[Salary],
        [d].[Name] AS [DepartmentName]
FROM
        [dbo].[Employees] AS [e]
    INNER JOIN
        [dbo].[Departments] AS [d]
        ON [e].[DepartmentID] = [d].[DepartmentID]
WHERE
        [e].[Salary] > 15000
ORDER BY
        [d].[DepartmentID]