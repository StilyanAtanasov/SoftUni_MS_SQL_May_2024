USE [SoftUni]
GO

SELECT
        *
INTO
        [#TempEmployeesSalaryFilter]
FROM
        [dbo].[Employees]
WHERE
        [Salary] > 30000

DELETE FROM
        [#TempEmployeesSalaryFilter]
WHERE
        [ManagerID] = 42

UPDATE
        [#TempEmployeesSalaryFilter]
SET
        [Salary] += 5000
WHERE
    [DepartmentID] = 1

SELECT
        [DepartmentID],
        AVG([Salary]) AS [AverageSalary]
FROM
        [#TempEmployeesSalaryFilter]
GROUP BY
        [DepartmentID]