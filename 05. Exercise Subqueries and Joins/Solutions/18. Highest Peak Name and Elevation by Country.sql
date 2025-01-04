USE [Geography]
GO

SELECT TOP (5)
        [res].[CountryName] AS [Country],
        CASE 
            WHEN [res].[PeakName] IS NULL
                THEN
                   '(no highest peak)'
            ELSE
               [res].[PeakName]
        END AS [Highest Peak Name],
        CASE 
            WHEN [res].[Elevation] IS NULL 
                THEN 0
            ELSE 
                [res].[Elevation]
        END AS [Highest Peak Elevation],
        CASE 
            WHEN [res].[MountainRange] IS NULL
                THEN
                   '(no mountain)'
            ELSE
               [res].[MountainRange]
        END AS [Mountain]
FROM
        (
            SELECT
                    [c].[CountryName],
                    [p].[PeakName],
                    [p].[Elevation],
                    [m].[MountainRange],
                    RANK() OVER (PARTITION BY [c].[CountryCode] ORDER BY [p].[Elevation] DESC) AS [Rank]
            FROM
                    [dbo].[Countries] AS [c]
                LEFT OUTER JOIN
                    [dbo].[MountainsCountries] AS [mc]
                    ON [c].[CountryCode] = [mc].[CountryCode]
                LEFT OUTER JOIN
                    [dbo].[Mountains] AS [m]
                    ON [mc].[MountainId] = [m].[Id]
                LEFT OUTER JOIN
                    [dbo].[Peaks] AS [p]
                    ON [m].[Id] = [p].[MountainId]
        ) AS [res]
WHERE
        [res].[Rank] = 1
ORDER BY
        [Country],
        [Highest Peak Name]