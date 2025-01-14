USE [Diablo]
GO

SELECT
        [u].[Username],
        [g].[Name]                                                          AS [Game],
        MAX([c].[Name])                                                     AS [Character],
        SUM([si].[Strength]) + MAX([sgt].[Strength]) + MAX([sc].[Strength]) AS [Strength],
        SUM([si].[Defence]) + MAX([sgt].[Defence]) + MAX([sc].[Defence])    AS [Defence],
        SUM([si].[Speed]) + MAX([sgt].[Speed]) + MAX([sc].[Speed])          AS [Speed],
        SUM([si].[Mind]) + MAX([sgt].[Mind]) + MAX([sc].[Mind])             AS [Mind],
        SUM([si].[Luck]) + MAX([sgt].[Luck]) + MAX([sc].[Luck])             AS [Luck]
FROM
        [dbo].[Users] AS [u]
    INNER JOIN
        [dbo].[UsersGames] AS [ug]
        ON [u].[Id] = [ug].[UserId]
    INNER JOIN
        [dbo].[Games] AS [g]
        ON [ug].[GameId] = [g].[Id]
    INNER JOIN
        [dbo].[Characters] AS [c]
        ON [ug].[CharacterId] = [c].[Id]
    INNER JOIN
        [dbo].[Statistics] AS [sc]
        ON [c].[StatisticId] = [sc].[Id]
    INNER JOIN
        [dbo].[GameTypes] AS [gt]
        ON [g].[GameTypeId] = [gt].[Id]
    INNER JOIN
        [dbo].[Statistics] AS [sgt]
        ON [gt].[BonusStatsId] = [sgt].[Id]
    INNER JOIN
        [dbo].[UserGameItems] AS [ugi]
        ON [ug].[Id] = [ugi].[UserGameId]
    INNER JOIN
        [dbo].[Items] AS [i]
        ON [ugi].[ItemId] = [i].[Id]
    INNER JOIN
        [dbo].[Statistics] AS [si]
        ON [i].[StatisticId] = [si].[Id]
GROUP BY
        [u].[Username],
        [g].[Name]
ORDER BY
        [Strength] DESC,
        [Defence] DESC,
        [Speed] DESC,
        [Mind] DESC,
        [Luck] DESC