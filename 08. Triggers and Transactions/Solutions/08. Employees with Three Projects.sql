USE [SoftUni]
GO

CREATE Or ALTER PROCEDURE [usp_AssignProject] (@employeeId INT, @projectID INT)
AS
BEGIN
BEGIN TRANSACTION

DECLARE @EmployeeProjectsCount INT;

INSERT INTO [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID])
VALUES ( @employeeId, @projectID );

SELECT
        @EmployeeProjectsCount = COUNT([EmployeeID])
FROM
        [dbo].[EmployeesProjects]
WHERE
        [EmployeeID] = @employeeId;

IF (@EmployeeProjectsCount > 3)
BEGIN
RAISERROR ('The employee has too many projects!', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;

COMMIT TRANSACTION;
END;