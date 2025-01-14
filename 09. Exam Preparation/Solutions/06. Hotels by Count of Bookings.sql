USE [TouristAgency]
GO

SELECT
        [h].[Id],
        [h].[Name]
FROM
        [Hotels] AS [h]
    INNER JOIN
        [HotelsRooms] AS [hr]
        ON [h].[Id] = [hr].[HotelId]
    INNER JOIN
        [Rooms] AS [r]
        ON [hr].[RoomId] = [r].[Id]
    INNER JOIN
        [Bookings] AS [b]
        ON [h].[Id] = [b].[HotelId]
WHERE
        [r].[Type] = 'VIP Apartment'
GROUP BY
        [h].[Id],
        [h].[Name]
ORDER BY
        COUNT([b].[Id]) DESC