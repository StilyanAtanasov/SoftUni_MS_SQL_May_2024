USE [RailwaysDb]
GO

SELECT
        [t].[Name]  AS [Town],
        [rs].[Name] AS [RailwayStation]
FROM
        [RailwayStations] AS [rs]
    INNER JOIN
        [Towns] AS [t]
        ON [rs].[TownId] = [t].[Id]
    LEFT OUTER JOIN
        [TrainsRailwayStations] AS [trs]
        ON [rs].[Id] = [trs].[RailwayStationId]
WHERE
        [trs].[TrainId] IS NULL
ORDER BY
        [Town] ASC,
        [RailwayStation] ASC