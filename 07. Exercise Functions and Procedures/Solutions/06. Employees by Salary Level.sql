USE [SoftUni]
GO

CREATE PROCEDURE [usp_EmployeesBySalaryLevel] (@LevelOfSalary VARCHAR(7)) AS 
BEGIN
SELECT
        [FirstName] AS [First Name],
        [LastName]  AS [Last Name]
FROM
        [Employees]
WHERE
        [dbo].[ufn_GetSalaryLevel]([Salary]) = @LevelOfSalary
END