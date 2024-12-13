USE [SoftUni]
GO

UPDATE [Employees]
SET [Salary] = [Salary] * 1.1

SELECT [Salary] FROM [Employees]