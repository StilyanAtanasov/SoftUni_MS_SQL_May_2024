USE [SoftUni]
GO


CREATE VIEW [V_EmployeesHiredAfter2000] AS
        SELECT
                [FirstName],
                [LastName]
        FROM
                [dbo].[Employees]
        WHERE
                DATEPART(YEAR, [HireDate]) > 2000