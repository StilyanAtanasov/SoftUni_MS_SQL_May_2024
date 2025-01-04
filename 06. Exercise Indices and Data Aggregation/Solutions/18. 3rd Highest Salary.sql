USE [SoftUni]
GO

SELECT
        [DepartmentID],
        [Salary] AS [ThirdHighestSalary]
FROM
        (
            SELECT
                    [DepartmentID],
                    [Salary],
                    DENSE_RANK() OVER (PARTITION BY [DepartmentID] ORDER BY [Salary] DESC) AS [Rank]
            FROM
                    [dbo].[Employees]
        ) AS [res]
WHERE
        [res].[Rank] = 3
GROUP BY [DepartmentID], [Salary]