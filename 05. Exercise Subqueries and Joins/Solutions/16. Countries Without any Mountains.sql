USE [Geography]
GO

SELECT
        COUNT([c].[CountryCode]) AS [Count]
FROM
        [dbo].[Countries] AS [c]
    LEFT OUTER JOIN
        [dbo].[MountainsCountries] AS [mc]
        ON [c].[CountryCode] = [mc].[CountryCode]
WHERE
        [mc].[MountainId] IS NULL