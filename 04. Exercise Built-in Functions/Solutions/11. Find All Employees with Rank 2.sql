USE [SoftUni]
GO

WITH CTO_RankedEmployees AS
   (
       SELECT
               [EmployeeID],
               [FirstName],
               [LastName],
               [Salary],
               DENSE_RANK() OVER (PARTITION BY [Salary] ORDER BY [EmployeeID]) AS [Rank]
       FROM
               [dbo].[Employees]
       WHERE
               [Salary] BETWEEN 10000 AND 50000
   )

SELECT
        *
FROM
        [CTO_RankedEmployees]
WHERE
        [Rank] = 2
ORDER BY
        [Salary] DESC