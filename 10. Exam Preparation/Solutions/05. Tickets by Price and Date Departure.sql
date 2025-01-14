USE [RailwaysDb]
GO

SELECT
        [DateOfDeparture],
        [Price] AS [TicketPrice]
FROM
        [Tickets]
ORDER BY
        [TicketPrice] ASC,
        [DateOfDeparture] DESC