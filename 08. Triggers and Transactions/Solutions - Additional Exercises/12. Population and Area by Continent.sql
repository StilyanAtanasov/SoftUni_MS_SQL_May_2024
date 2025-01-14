USE [Geography]
GO

SELECT
        [c].[ContinentName],
        SUM([co].[AreaInSqKm])                  AS [CountriesArea],
        SUM(CONVERT(BIGINT, [co].[Population])) AS [CountriesPopulation]
FROM
        [Continents] AS [c]
    INNER JOIN
        [Countries] AS [co]
        ON [c].[ContinentCode] = [co].[ContinentCode]
GROUP BY
        [c].[ContinentName]
ORDER BY
        [CountriesPopulation] DESC