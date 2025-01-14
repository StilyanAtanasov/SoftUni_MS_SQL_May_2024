USE [RailwaysDb]
GO

BEGIN TRANSACTION

DECLARE @RowsToDelete TABLE ([Id] INT PRIMARY KEY)
INSERT INTO @RowsToDelete ([Id])
    SELECT
            [t].[Id]
    FROM
            [Trains] AS [t]
        INNER JOIN
            [Towns] AS [tw]
            ON [t].[DepartureTownId] = [tw].[Id]
    WHERE
            [tw].[Name] = 'Berlin'

DELETE FROM
        [TrainsRailwayStations]
WHERE
        [TrainId] IN (
            SELECT
                    [Id]
            FROM
                    @RowsToDelete
        )

DELETE FROM
        [MaintenanceRecords]
WHERE
        [TrainId] IN (
            SELECT
                    [Id]
            FROM
                    @RowsToDelete
        )

DELETE FROM
        [Tickets]
WHERE
        [TrainId] IN (
            SELECT
                    [Id]
            FROM
                    @RowsToDelete
        )

DELETE FROM
        [Trains]
WHERE
        [Id] IN (
            SELECT
                    [Id]
            FROM
                    @RowsToDelete
        )

COMMIT TRANSACTION