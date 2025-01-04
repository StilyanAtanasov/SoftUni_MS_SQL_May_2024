USE [SoftUni]
GO

SELECT TOP (3)
        [e].[EmployeeID],
        [e].[FirstName]
FROM
        [dbo].[Employees] AS [e]
    LEFT OUTER JOIN
        [dbo].[EmployeesProjects] AS [ep]
        ON [e].[EmployeeID] = [ep].[EmployeeID]
WHERE
        [ep].[EmployeeID] IS NULL
ORDER BY
        [e].[EmployeeID]