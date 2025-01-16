USE [LibraryDb]
GO

SELECT
        [b].[Id],
        [b].[Title],
        [b].[ISBN],
        [g].[Name] AS [Genre]
FROM
        [Books] AS [b]
    INNER JOIN
        [Genres] AS [g]
        ON [b].[GenreId] = [g].[Id]
WHERE
        [g].[Name] IN ('Biography', 'Historical Fiction')
ORDER BY
        [Genre] ASC,
        [b].[Title] ASC