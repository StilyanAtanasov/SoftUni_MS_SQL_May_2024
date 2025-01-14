USE [RailwaysDb]
GO

CREATE FUNCTION [udf_TownsWithTrains] (@name VARCHAR(30))
RETURNS INT
AS
BEGIN
DECLARE @result INT;
SELECT
        @result = COUNT([t].[Id])
FROM
        [Trains] AS [t]
    INNER JOIN
        [Towns] AS [tw] 
        ON [t].[DepartureTownId] = [tw].[Id] OR [t].[ArrivalTownId] = [tw].[Id]
WHERE 
        [tw].[Name] = @name

RETURN @result;
END