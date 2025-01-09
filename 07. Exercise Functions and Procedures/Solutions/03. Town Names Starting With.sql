USE [SoftUni]
GO

CREATE PROCEDURE [usp_GetTownsStartingWith] (@FirstLetter NVARCHAR(MAX)) AS (
SELECT
        [Name] AS [Towns]
FROM
        [dbo].[Towns]
WHERE
        LEFT([Name], LEN(@FirstLetter)) = @FirstLetter
)