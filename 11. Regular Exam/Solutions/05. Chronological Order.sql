USE [LibraryDb]
GO

SELECT
        [Title] AS [Book Title],
        [ISBN],
        [YearPublished] AS [YearReleased]
FROM
        [Books]
ORDER BY
        [YearReleased] DESC,
        [Book Title] ASC