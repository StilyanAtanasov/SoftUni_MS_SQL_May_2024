USE [RailwaysDb]
GO

SELECT
         [tw].[Name] AS [TownName],
         COUNT([t].[Id]) AS [PassengersCount]
FROM
        [Tickets] AS [t]
    INNER JOIN 
        [Trains] AS [tr]
        ON [t].[TrainId] = [tr].[Id]
    INNER JOIN 
        [Towns] AS [tw]
        ON [tr].[ArrivalTownId] = [tw].[Id]
WHERE 
        [t].[Price] > 76.99
GROUP BY
        [tw].[Name]
ORDER BY
        [TownName] ASC