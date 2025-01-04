USE [SoftUni]
GO

SELECT TOP (5)
        [e].[EmployeeID],
        [e].[FirstName],
        [p].[Name] AS [ProjectName]
FROM
        [dbo].[Employees] AS [e]
    INNER JOIN
        [dbo].[EmployeesProjects] AS [ep]
        ON [e].[EmployeeID] = [ep].[EmployeeID]
    INNER JOIN
        [dbo].[Projects] AS [p]
        ON [ep].[ProjectID] = [p].[ProjectID]
WHERE
        [p].[StartDate] > '2002-08-13'
        AND [p].[EndDate] IS NULL
ORDER BY
        [e].[EmployeeID]