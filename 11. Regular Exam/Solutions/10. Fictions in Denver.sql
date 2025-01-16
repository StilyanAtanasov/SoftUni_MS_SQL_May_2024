USE [LibraryDb]
GO

SELECT
        [a].[Name]        AS [Author],
        [b].[Title],
        [l].[Name]        AS [Library],
        [c].[PostAddress] AS [Library Address]
FROM
        [Books] AS [b]
    INNER JOIN
        [Authors] AS [a]
        ON [b].[AuthorId] = [a].[Id]
    INNER JOIN
        [Genres] AS [g]
        ON [b].[GenreId] = [g].[Id]
    INNER JOIN
        [LibrariesBooks] AS [lb]
        ON [b].[Id] = [lb].[BookId]
    INNER JOIN
        [Libraries] AS [l]
        ON [lb].[LibraryId] = [l].[Id]
    INNER JOIN
        [Contacts] AS [c]
        ON [l].[ContactId] = [c].[Id]
WHERE
        [g].[Name] = 'Fiction'
        AND [c].[PostAddress] LIKE '%Denver%'
ORDER BY
        [Title] ASC