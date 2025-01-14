USE [Geography]
GO

UPDATE
        [Countries]
SET
        [CountryName] = 'Burma'
WHERE
        [CountryName] = 'Myanmar'

INSERT INTO [dbo].[Monasteries] ([Name], [CountryCode])
    SELECT
            'Hanga Abbey',
            [CountryCode]
    FROM
            [Countries]
    WHERE
            [CountryName] = 'Tanzania'

INSERT INTO [dbo].[Monasteries] ([Name], [CountryCode])
    SELECT
            'Myin-Tin-Daik',
            [CountryCode]
    FROM
            [Countries]
    WHERE
            [CountryName] = 'Myanmar'

SELECT
        [c].[ContinentName],
        [co].[CountryName],
        COUNT([m].[Id]) AS [MonasteriesCount]
FROM
        [Continents] AS [c]
    INNER JOIN
        [dbo].[Countries] AS [co]
        ON [c].[ContinentCode] = [co].[ContinentCode]
    LEFT OUTER JOIN
        [dbo].[Monasteries] AS [m]
        ON [co].[CountryCode] = [m].[CountryCode]
WHERE
        [co].[IsDeleted] = 0
GROUP BY
        [c].[ContinentName],
        [co].[CountryName]
ORDER BY
        [MonasteriesCount] DESC,
        [co].[CountryName] ASC