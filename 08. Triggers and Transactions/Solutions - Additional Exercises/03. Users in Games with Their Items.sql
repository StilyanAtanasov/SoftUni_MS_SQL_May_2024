USE [Diablo]
GO

SELECT
        [u].[Username],
        [g].[Name]       AS [Game],
        COUNT([i].[Id])  AS [Items Count],
        SUM([i].[Price]) AS [Items Price]
FROM
        [dbo].[Users] AS [u]
    INNER JOIN
        [dbo].[UsersGames] AS [ug]
        ON [u].[Id] = [ug].[UserId]
    INNER JOIN
        [dbo].[Games] AS [g]
        ON [ug].[GameId] = [g].[Id]
    INNER JOIN
        [dbo].[UserGameItems] AS [ugi]
        ON [ug].[Id] = [ugi].[UserGameId]
    INNER JOIN
        [dbo].[Items] AS [i]
        ON [ugi].[ItemId] = [i].[Id]
GROUP BY
        [u].[Username],
        [g].[Name]
HAVING
        COUNT([i].[Id]) >= 10
ORDER BY
        [Items Count] DESC,
        [Items Price] DESC,
        [u].[Username] ASC