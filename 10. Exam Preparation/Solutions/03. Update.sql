USE [RailwaysDb]
GO

UPDATE [Tickets]
SET [DateOfArrival] = DATEADD(DAY, 7, [DateOfArrival]),
    [DateOfDeparture] = DATEADD(DAY, 7, [DateOfDeparture])
WHERE DATEPART(MONTH, [DateOfDeparture]) > 10