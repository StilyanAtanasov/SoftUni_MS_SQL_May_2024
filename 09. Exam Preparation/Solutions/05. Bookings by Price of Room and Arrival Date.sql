USE [TouristAgency]
GO

SELECT
        FORMAT([b].[ArrivalDate], 'yyyy-MM-dd') AS [ArrivalDate],
        [b].[AdultsCount],
        [b].[ChildrenCount]
FROM
        [Bookings] AS [b]
    INNER JOIN
        [Rooms] AS [r]
        ON [b].[RoomId] = [r].[Id]
ORDER BY
        [r].[Price] DESC,
        [b].[ArrivalDate] ASC