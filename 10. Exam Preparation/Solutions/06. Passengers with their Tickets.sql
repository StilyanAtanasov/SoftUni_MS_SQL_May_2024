USE [RailwaysDb]
GO

SELECT
        [p].[Name]    AS [PassengerName],
        [t].[Price]   AS [TicketPrice],
        [t].[DateOfDeparture],
        [t].[TrainId] AS [TrainID]
FROM
        [Tickets] AS [t]
    INNER JOIN
        [Passengers] AS [p]
        ON [t].[PassengerId] = [p].[Id]
ORDER BY
        [TicketPrice] DESC,
        [PassengerName] ASC