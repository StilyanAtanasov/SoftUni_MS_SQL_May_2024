USE [Bank]
GO

CREATE OR ALTER PROCEDURE [usp_GetHoldersFullName] AS
BEGIN
SELECT
        CONCAT_WS(' ', [FirstName], [LastName]) AS [Full Name]
FROM
        [dbo].[AccountHolders]
END