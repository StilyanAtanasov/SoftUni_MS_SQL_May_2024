USE [ShoesApplicationDatabase]
GO

CREATE FUNCTION [udf_OrdersByEmail] (@email NVARCHAR(100)) 
RETURNS INT
AS
BEGIN
DECLARE @ordersCount INT;
SELECT
        @ordersCount = COUNT([o].[Id])
FROM
        [Orders] AS [o]
    INNER JOIN
        [Users] AS [u]
        ON [o].[UserId] = [u].[Id]
WHERE
        [u].[Email] = @email

RETURN @ordersCount
END