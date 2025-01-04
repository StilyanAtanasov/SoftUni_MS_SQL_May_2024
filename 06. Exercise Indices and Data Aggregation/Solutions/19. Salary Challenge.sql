USE [SoftUni]
GO

SELECT TOP (10)
        [e].[FirstName],
        [e].[LastName],
        [e].[DepartmentID]
FROM
        [dbo].[Employees] AS [e]
WHERE
        [e].[Salary] > (
            SELECT
                    AVG([e1].[Salary]) AS [AverageSalary]
            FROM
                    [dbo].[Employees] AS [e1]
            WHERE
                    [e].[DepartmentID] = [e1].[DepartmentID]
            GROUP BY
                    [DepartmentID]
        )
ORDER BY
        [e].[DepartmentID]