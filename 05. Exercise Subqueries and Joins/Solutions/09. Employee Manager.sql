USE [SoftUni]
GO

SELECT
        [e].[EmployeeID],
        [e].[FirstName],
        [e].[ManagerID],
        [e1].[FirstName] AS [ManagerName]
FROM
        [dbo].[Employees] AS [e]
    INNER JOIN
        [dbo].[Employees] AS [e1]
        ON [e].[ManagerID] = [e1].[EmployeeID]
WHERE
        [e].[ManagerID] IN (3, 7)
ORDER BY
        [e].[EmployeeID]