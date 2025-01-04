USE [SoftUni]
GO

SELECT
        [e].[EmployeeID],
        [e].[FirstName],
        [e].[LastName],
        [d].[Name] AS [DepartmentName]
FROM
        [dbo].[Employees] AS [e]
    INNER JOIN
        [dbo].[Departments] AS [d]
        ON [e].[DepartmentID] = [d].[DepartmentID]
WHERE
        [d].[Name] = 'Sales'
ORDER BY
        [e].[EmployeeID]