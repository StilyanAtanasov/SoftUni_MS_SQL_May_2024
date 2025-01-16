USE [LibraryDb]
GO

CREATE PROCEDURE [usp_SearchByGenre] (@genreName NVARCHAR(30))
AS
SELECT
        [b].[Title],
        [b].[YearPublished] AS [Year],
        [b].[ISBN],
        [a].[Name]          AS [Author],
        [g].[Name]          AS [Genre]
FROM
        [Books] AS [b]
    INNER JOIN
        [Authors] AS [a]
        ON [b].[AuthorId] = [a].[Id]
    INNER JOIN
        [Genres] AS [g]
        ON [b].[GenreId] = [g].[Id]
WHERE
        [g].[Name] = @genreName
ORDER BY
        [Title] ASC