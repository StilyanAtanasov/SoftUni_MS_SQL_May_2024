USE [RailwaysDb]
GO

SELECT TOP (3)
        [t].[Id] AS [TrainId],
        [t].[HourOfDeparture],
        [tc].[Price] AS [TicketPrice],
        [tw].[Name] AS [Destination]
FROM
        [Trains] AS [t]
    INNER JOIN
        [Tickets] AS [tc]
        ON [t].[Id] = [tc].[TrainId]
    INNER JOIN
        [Towns] AS [tw]
        ON [t].[ArrivalTownId] = [tw].[Id]
WHERE
        [t].[HourOfDeparture] LIKE '08:__'
        AND [tc].[Price] > 50
ORDER BY
        [TicketPrice] ASC