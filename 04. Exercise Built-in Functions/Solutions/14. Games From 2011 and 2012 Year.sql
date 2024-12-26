USE [Diablo]
GO

SELECT TOP (50)
        [Name],
        FORMAT([Start], 'yyyy-MM-dd') AS [Start]
FROM
        [dbo].[Games]
WHERE
        DATEPART(YEAR, [Start]) BETWEEN 2011 AND 2012
ORDER BY
        [Start],
        [Name]