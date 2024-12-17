USE [SoftUni]
GO

UPDATE
        [dbo].[Employees]
SET
        [Salary] *= 1.12
WHERE
    [DepartmentID] IN (1, 2, 4, 11)


SELECT
        [Salary]
FROM
        [dbo].[Employees]