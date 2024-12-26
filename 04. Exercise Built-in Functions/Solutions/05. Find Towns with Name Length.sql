USE [SoftUni]
GO

SELECT
        [Name]
FROM
        [dbo].[Towns]
WHERE
        LEN([Name]) IN (5, 6)
ORDER BY
        [Name]