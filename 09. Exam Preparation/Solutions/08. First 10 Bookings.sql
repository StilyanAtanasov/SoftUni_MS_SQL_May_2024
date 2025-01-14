USE [TouristAgency]
GO

SELECT TOP (10)
        [h].[Name] AS [HotelName],
        [d].[Name] AS [DestinationName],
        [c].[Name] AS [CountryName]
FROM
        [Bookings] AS [b]
    INNER JOIN
        [Hotels] AS [h]
        ON [b].[HotelId] = [h].[Id]
    INNER JOIN
        [Destinations] AS [d]
        ON [h].[DestinationId] = [d].[Id]
    INNER JOIN
        [Countries] AS [c]
        ON [d].[CountryId] = [c].[Id]
WHERE
        [b].[ArrivalDate] < '2023-12-31'
        AND [h].[Id] % 2 = 1
ORDER BY
        [CountryName],
        [b].[ArrivalDate]