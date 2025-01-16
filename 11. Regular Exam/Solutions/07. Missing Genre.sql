USE [LibraryDb]
GO

SELECT
        [l].[Name] AS [Library],
        [c].[Email]
FROM
        [Libraries] AS [l]
    INNER JOIN
        [Contacts] AS [c]
        ON [l].[ContactId] = [c].[Id]
WHERE
        [l].[Id] NOT IN (
            SELECT
                    [lb].[LibraryId]
            FROM
                    [LibrariesBooks] AS [lb]
                LEFT OUTER JOIN
                    [Books] AS [b]
                    ON [lb].[BookId] = [b].[Id]
                INNER JOIN
                    [Genres] AS [g]
                    ON [b].[GenreId] = [g].[Id]
            WHERE
                    [g].[Name] = 'Mystery'
        )
ORDER BY
        [Library] ASC