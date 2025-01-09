USE [SoftUni]
GO

CREATE PROCEDURE [usp_GetEmployeesSalaryAbove35000] AS (
SELECT
        [FirstName],
        [LastName]
FROM
        [dbo].[Employees]
WHERE
        [Salary] > 35000
)