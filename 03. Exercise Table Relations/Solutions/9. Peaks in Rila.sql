USE [Geography]
GO

SELECT
        [m].[MountainRange],
        [p].[PeakName],
        [p].[Elevation]
FROM
        [dbo].[Peaks] AS [p]
    JOIN
        [dbo].[Mountains] AS [m]
        ON [p].[MountainId] = [m].[Id]
WHERE
        [m].[MountainRange] = 'Rila'
ORDER BY
        [p].[Elevation] DESC