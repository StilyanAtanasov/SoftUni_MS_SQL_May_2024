USE [SoftUni]
GO

CREATE PROCEDURE [usp_GetEmployeesSalaryAboveNumber] (@MinSalary DECIMAL(18, 4))  AS (
SELECT
        [FirstName] AS [First Name],
        [LastName]  AS [Last Name]
FROM
        [dbo].[Employees]
WHERE
        [Salary] >= @MinSalary
)