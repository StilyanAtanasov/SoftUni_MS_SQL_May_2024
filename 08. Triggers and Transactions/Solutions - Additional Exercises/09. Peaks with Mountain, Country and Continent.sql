USE [Geography]
GO

SELECT
        [p].[PeakName],
        [m].[MountainRange] AS [Mountain],
        [c].[CountryName],
        [cn].[ContinentName]
FROM
        [Peaks] AS [p]
    INNER JOIN
        [Mountains] AS [m]
        ON [p].[MountainId] = [m].[Id]
    INNER JOIN
        [MountainsCountries] AS [mc]
        ON [m].[Id] = [mc].[MountainId]
    INNER JOIN
        [Countries] AS [c]
        ON [mc].[CountryCode] = [c].[CountryCode]
    INNER JOIN 
        [Continents] AS [cn]
        ON [c].[ContinentCode] = [cn].[ContinentCode]
ORDER BY
        [p].[PeakName] ASC,
        [c].[CountryName] ASC