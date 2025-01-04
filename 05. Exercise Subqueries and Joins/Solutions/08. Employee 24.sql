USE [SoftUni]
GO

SELECT
        [e].[EmployeeID],
        [e].[FirstName],
        CASE
            WHEN DATEPART(YEAR, [p].[StartDate]) >= 2005
                THEN
                   NULL
            ELSE
               [p].[Name]
        END AS [ProjectName]
FROM
        [dbo].[Employees] AS [e]
    INNER JOIN
        [dbo].[EmployeesProjects] AS [ep]
        ON [e].[EmployeeID] = [ep].[EmployeeID]
    INNER JOIN
        [dbo].[Projects] AS [p]
        ON [ep].[ProjectID] = [p].[ProjectID]
WHERE
        [e].[EmployeeID] = 24
