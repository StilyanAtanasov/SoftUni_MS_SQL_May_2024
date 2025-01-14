USE [RailwaysDb]
GO

CREATE PROCEDURE [usp_SearchByTown](@townName VARCHAR(30))
AS
SELECT
        [p].[Name] AS [PassengerName],
        [tc].[DateOfDeparture],
        [t].[HourOfDeparture]
FROM
        [Trains] AS [t]
    INNER JOIN
        [Tickets] AS [tc]
        ON [t].[Id] = [tc].[TrainId]
    INNER JOIN
        [Passengers] AS [p]
        ON [tc].[PassengerId] = [p].[Id]
    INNER JOIN
        [Towns] AS [tw]
        ON [t].[ArrivalTownId] = [tw].[Id]
WHERE
        [tw].[Name] = @townName
ORDER BY
        [DateOfDeparture] DESC,
        [PassengerName] ASC