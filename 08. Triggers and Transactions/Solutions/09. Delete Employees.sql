USE [SoftUni]
GO

CREATE TABLE [Deleted_Employees] (
        [EmployeeId]    INT PRIMARY KEY IDENTITY, 
        [FirstName]     VARCHAR(70), 
        [LastName]      VARCHAR(70), 
        [MiddleName]    VARCHAR(70), 
        [JobTitle]      VARCHAR(70), 
        [DepartmentId]  INT, 
        [Salary]        MONEY
)

GO

CREATE TRIGGER [tr_Employees_OnDelete] 
ON [Employees]
FOR DELETE
AS
INSERT INTO [dbo].[Deleted_Employees] ([FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentId], [Salary])
    SELECT
            [FirstName],
            [LastName],
            [MiddleName],
            [JobTitle],
            [DepartmentId],
            [Salary]
    FROM
            [DELETED] AS [d]