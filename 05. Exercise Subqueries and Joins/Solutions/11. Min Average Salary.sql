USE [SoftUni]
GO

SELECT
        MIN([AvgSalaries].[AvgSalary]) AS [MinAverageSalary]
FROM
        (
            SELECT
                    AVG([e].[Salary]) AS [AvgSalary]
            FROM
                    [dbo].[Employees] AS [e]
            GROUP BY
                    [e].[DepartmentID]
        ) AS [AvgSalaries]