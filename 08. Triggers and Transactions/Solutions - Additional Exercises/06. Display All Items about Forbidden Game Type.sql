USE [Diablo]
GO

SELECT
        [i].[Name],
        [i].[Price],
        [i].[MinLevel],
        [gt].[Name] As [Forbidden Game Type]
FROM
        [dbo].[Items] AS [i]
    LEFT OUTER JOIN
        [dbo].[GameTypeForbiddenItems] AS [gtfi]
        ON [i].[Id] = [gtfi].[ItemId]
    LEFT OUTER JOIN
        [dbo].[GameTypes] AS [gt]
        ON [gtfi].[GameTypeId] = [gt].[Id]
ORDER BY
        [Forbidden Game Type] DESC,
        [i].[Name] ASC