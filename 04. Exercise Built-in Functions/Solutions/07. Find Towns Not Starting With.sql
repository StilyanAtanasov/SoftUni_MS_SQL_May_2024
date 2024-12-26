USE [SoftUni]
GO

SELECT
        [TownID],
        [Name]
FROM
        [dbo].[Towns]
WHERE
        [Name] LIKE '[^RBD]%'
ORDER BY
        [Name]