USE [Geography]
GO

SELECT
        [mc].[CountryCode],
        COUNT([mc].[MountainId]) AS [MountainRanges]
FROM
        [dbo].[MountainsCountries] AS [mc]
WHERE
        [mc].[CountryCode] IN ('US', 'RU', 'BG')
GROUP BY
        [mc].[CountryCode]