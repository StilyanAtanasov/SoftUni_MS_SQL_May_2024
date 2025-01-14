USE [TouristAgency]
GO

CREATE FUNCTION [udf_RoomsWithTourists] (@name VARCHAR(40)) 
RETURNS INT
AS
BEGIN
 
DECLARE @result INT;
SELECT
        @result = SUM([b].[ChildrenCount]) + SUM([b].[AdultsCount])
FROM
        [Bookings] AS [b]
    INNER JOIN
        [Rooms] AS [r]
        ON [b].[RoomId] = [r].[Id]
WHERE
        [r].[Type] = @name

RETURN @result
END