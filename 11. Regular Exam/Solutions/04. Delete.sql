USE [LibraryDb]
GO

BEGIN TRANSACTION;

DECLARE @AuthorId INT;
SELECT TOP (1)
        @AuthorId = [Id]
FROM
        [Authors]
WHERE
        [Name] = 'Alex Michaelides'

DELETE FROM
        [LibrariesBooks]
WHERE
        [BookId] IN (
            SELECT
                    [Id]
            FROM
                    [Books]
            WHERE
                    [AuthorId] = @AuthorId
        );

DELETE FROM
        [Books]
WHERE
        [AuthorId] = @AuthorId

DELETE FROM
        [Authors]
WHERE
        [Id] = @AuthorId;

COMMIT TRANSACTION;