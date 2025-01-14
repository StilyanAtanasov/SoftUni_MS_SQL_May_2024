USE [TouristAgency]
GO

SELECT
        [h].[Name]  AS [HotelName],
        [r].[Price] AS [RoomPrice]
FROM
        [Tourists] AS [t]
    INNER JOIN
        [Bookings] AS [b]
        ON [t].[Id] = [b].[TouristId]
    INNER JOIN
        [Hotels] AS [h]
        ON [b].[HotelId] = [h].[Id]
    INNER JOIN
        [Rooms] AS [r]
        ON [b].[RoomId] = [r].[Id]
WHERE
        [t].[Name] NOT LIKE '%EZ'
ORDER BY
        [RoomPrice] DESC