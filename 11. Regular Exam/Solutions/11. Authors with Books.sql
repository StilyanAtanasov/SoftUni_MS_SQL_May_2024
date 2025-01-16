USE [LibraryDb]
GO

CREATE FUNCTION [udf_AuthorsWithBooks] (@name NVARCHAR(100))
RETURNS INT
AS
BEGIN
DECLARE @count INT;
SELECT
        @count = COUNT([b].[Id])
FROM
        [Books] AS [b]
    INNER JOIN
        [Authors] AS [a]
        ON [b].[AuthorId] = [a].[Id]
WHERE
        [a].[Name] = @name

RETURN @count
END