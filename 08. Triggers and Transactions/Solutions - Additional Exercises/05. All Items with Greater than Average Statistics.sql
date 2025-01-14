USE [Diablo]
GO

SELECT
        [i].[Name],
        [i].[Price],
        [i].[MinLevel],
        [s].[Strength],
        [s].[Defence],
        [s].[Speed],
        [s].[Luck],
        [s].[Mind]
FROM
        [dbo].[Items] AS [i]
    INNER JOIN
        [dbo].[Statistics] AS [s]
        ON [i].[StatisticId] = [s].[Id]
WHERE 
        [s].[Speed] > (SELECT AVG([Speed]) FROM [dbo].[Statistics])
        AND [s].[Luck] > (SELECT AVG([Luck]) FROM [dbo].[Statistics])
        AND [s].[Mind] > (SELECT AVG([Mind]) FROM [dbo].[Statistics])
ORDER BY
        [i].[Name]