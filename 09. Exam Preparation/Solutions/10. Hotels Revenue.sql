USE [TouristAgency]
GO

SELECT
        [h].[Name]                                                               AS [HotelName],
        SUM([r].[Price] * DATEDIFF(DAY, [b].[ArrivalDate], [b].[DepartureDate])) AS [TotalRevenue]
FROM
        [Hotels] AS [h]
    INNER JOIN
        [Bookings] AS [b]
        ON [h].[Id] = [b].[HotelId]
    INNER JOIN
        [Rooms] AS [r]
        ON [b].[RoomId] = [r].[Id]
GROUP BY
        [h].[Name]
ORDER BY
        [TotalRevenue] DESC