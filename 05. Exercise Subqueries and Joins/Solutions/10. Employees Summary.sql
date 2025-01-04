USE [SoftUni]
GO

SELECT TOP (50)
        [e].[EmployeeID],
        CONCAT_WS(' ', [e].[FirstName], [e].[LastName]) AS [EmployeeName],
        CONCAT_WS(' ', [e1].[FirstName], [e1].[LastName]) AS [ManagerName],
        [d].[Name] AS [DepartmentName]
FROM
        [dbo].[Employees] AS [e]
    INNER JOIN 
        [dbo].[Employees] AS [e1]
        ON [e].[ManagerID] = [e1].[EmployeeID]
    INNER JOIN 
        [dbo].[Departments] AS [d]
        ON [e].[DepartmentID] = [d].[DepartmentID]
ORDER BY
        [e].[EmployeeID]