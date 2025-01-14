USE [RailwaysDb]
GO

SELECT
        [t].[Id]    AS [TrainID],
        [tw].[Name] AS [DepartureTown],
        [mr].[Details]
FROM
        [MaintenanceRecords] AS [mr]
    INNER JOIN
        [Trains] AS [t]
        ON [mr].[TrainId] = [t].[Id]
    INNER JOIN
        [Towns] AS [tw]
        ON [t].[DepartureTownId] = [tw].[Id]
WHERE
        [mr].[Details] LIKE '%inspection%'
ORDER BY
        [TrainID] ASC