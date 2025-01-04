USE [SoftUni]
GO

SELECT
        COUNT([Salary]) AS [Count]
FROM
        [dbo].[Employees]
WHERE
        [ManagerID] IS NULL