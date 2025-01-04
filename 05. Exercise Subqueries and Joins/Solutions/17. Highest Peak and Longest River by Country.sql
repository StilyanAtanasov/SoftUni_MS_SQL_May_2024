USE [Geography]
GO

SELECT TOP (5)
        [res].[CountryName],
        MAX([res].[Elevation]) AS [HighestPeakElevation],
        MAX([res].[Length])    AS [LongestRiverLength]
FROM
        (
            SELECT
                    [c].[CountryName],
                    [p].[Elevation],
                    [r].[Length]
            FROM
                    [dbo].[Countries] AS [c]
                LEFT OUTER JOIN
                    [dbo].[MountainsCountries] AS [mc]
                    ON [c].[CountryCode] = [mc].[CountryCode]
                LEFT OUTER JOIN
                    [dbo].[Peaks] AS [p]
                    ON [mc].[MountainId] = [p].[MountainId]
                LEFT OUTER JOIN
                    [dbo].[CountriesRivers] AS [cr]
                    ON [c].[CountryCode] = [cr].[CountryCode]
                LEFT OUTER JOIN
                    [dbo].[Rivers] AS [r]
                    ON [cr].[RiverId] = [r].[Id]
        ) AS [res]

GROUP BY
        [res].[CountryName]
ORDER BY
        [HighestPeakElevation] DESC,
        [LongestRiverLength] DESC,
        [res].[CountryName]