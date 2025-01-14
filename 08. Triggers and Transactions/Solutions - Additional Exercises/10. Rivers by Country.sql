USE [Geography]
GO

SELECT
        [c].[CountryName],
        [cn].[ContinentName],
        COUNT([r].[Id]) AS [RiversCount],
        CASE
            WHEN SUM([r].[Length]) IS NOT NULL
                THEN
                   SUM([r].[Length])
            ELSE
               0
        END             AS [TotalLength]
FROM
        [Countries] AS [c]
    LEFT OUTER JOIN
        [CountriesRivers] AS [cr]
        ON [c].[CountryCode] = [cr].[CountryCode]
    LEFT OUTER JOIN
        [Rivers] AS [r]
        ON [cr].[RiverId] = [r].[Id]
    INNER JOIN
        [Continents] AS [cn]
        ON [c].[ContinentCode] = [cn].[ContinentCode]
GROUP BY
        [c].[CountryName],
        [cn].[ContinentName]
ORDER BY
        [RiversCount] DESC,
        [TotalLength] DESC,
        [c].[CountryName] ASC