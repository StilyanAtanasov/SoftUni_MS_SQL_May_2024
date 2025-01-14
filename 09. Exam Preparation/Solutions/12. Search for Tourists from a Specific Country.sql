USE [TouristAgency]
GO

CREATE PROCEDURE [usp_SearchByCountry](@country NVARCHAR (50))
AS
BEGIN
SELECT
        [t].[Name],
        [t].[PhoneNumber],
        [t].[Email],
        COUNT([b].[Id]) AS [CountOfBookings]
FROM
        [Tourists] AS [t]
    INNER JOIN
        [Countries] AS [c]
        ON [t].[CountryId] = [c].[Id]
    INNER JOIN
        [Bookings] AS [b]
        ON [t].[Id] = [b].[TouristId]
WHERE
        [c].[Name] = @country
GROUP BY
        [t].[Name],
        [t].[PhoneNumber],
        [t].[Email]
END