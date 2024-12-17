USE [SoftUni]
GO

CREATE VIEW [V_EmployeeNameJobTitle]
    AS
        (   SELECT
                    CONCAT_WS(' ', [FirstName], COALESCE([MiddleName], ' '), [LastName]) AS [FullName],
                    [JobTitle]
            FROM
                    [dbo].[Employees])
