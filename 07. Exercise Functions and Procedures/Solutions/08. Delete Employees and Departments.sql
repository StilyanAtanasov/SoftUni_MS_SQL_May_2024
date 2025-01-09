USE [SoftUni]
GO

CREATE PROCEDURE [usp_DeleteEmployeesFromDepartment] (@DepartmentId INT) AS 
BEGIN
DECLARE @EmployeesInDepartment TABLE ([Id] INT PRIMARY KEY)

INSERT INTO @EmployeesInDepartment
    SELECT
            [EmployeeID]
    FROM
            [dbo].[Employees]
    WHERE
            [DepartmentID] = @DepartmentId;

UPDATE
        [dbo].[Employees]
SET
        [ManagerID] = NULL
WHERE
    [ManagerID] IN (
        SELECT
                [eid].[Id]
        FROM
                @EmployeesInDepartment AS [eid]
    );

ALTER TABLE [dbo].[Departments]
ALTER COLUMN [ManagerID] INT NULL;

UPDATE
        [dbo].[Departments]
SET
        [ManagerID] = NULL
WHERE
    [ManagerID] IN (
        SELECT
                [eid].[Id]
        FROM
                @EmployeesInDepartment AS [eid]
    );

DELETE FROM
        [dbo].[EmployeesProjects]
WHERE
        [EmployeeID] IN (
            SELECT
                    [eid].[Id]
            FROM
                    @EmployeesInDepartment AS [eid]
        );

DELETE FROM
        [dbo].[Employees]
WHERE
        [DepartmentID] = @DepartmentId;

DELETE FROM
        [dbo].[Departments]
WHERE
        [DepartmentID] = @DepartmentId;

SELECT
        COUNT([EmployeeID])
FROM
        [Employees]
WHERE
        [DepartmentID] = @DepartmentId;
END