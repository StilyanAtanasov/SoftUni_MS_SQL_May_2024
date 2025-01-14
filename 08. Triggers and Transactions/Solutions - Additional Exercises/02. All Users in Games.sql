USE [Diablo]
GO

SELECT
        [g].[Name]  AS [Game],
        [gt].[Name] AS [Game Type],
        [u].[Username],
        [ug].[Level],
        [ug].[Cash],
        [c].[Name]
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
        [dbo].[GameTypes] AS [gt]
        ON [g].[GameTypeId] = [gt].[Id]
ORDER BY
        [ug].[Level] DESC,
        [u].[Username] ASC,
        [Game] ASC