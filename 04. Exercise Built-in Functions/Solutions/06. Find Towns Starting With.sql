USE [SoftUni]
GO

SELECT
        [TownID],
        [Name]
FROM
        [dbo].[Towns]
WHERE
        [Name] LIKE '[MKBE]%'
ORDER BY
        [Name]