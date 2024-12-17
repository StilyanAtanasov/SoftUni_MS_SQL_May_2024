USE [SoftUni]
GO

SELECT TOP (10)
        *
FROM
        [dbo].[Projects]
ORDER BY
        [StartDate],
        [Name]