USE [Diablo]
GO

CREATE TRIGGER [tr_UserGameItems_OnInsert] 
ON [dbo].[UserGameItems]
INSTEAD OF INSERT
AS
INSERT INTO [dbo].[UserGameItems] ([ItemId], [UserGameId])
    SELECT
            [i2].[Id],
            [ug].[Id]
    FROM
            [INSERTED] AS [i]
        INNER JOIN
            [dbo].[UsersGames] AS [ug]
            ON [i].[UserGameId] = [ug].[Id]
        INNER JOIN
            [dbo].[Items] AS [i2]
            ON [i].[ItemId] = [i2].[Id]
    WHERE
            [ug].[Level] >= [i2].[MinLevel]
            AND NOT EXISTS (
                SELECT
                        1
                FROM
                        [dbo].[UserGameItems] AS [ugi]
                WHERE
                        [ugi].[ItemId] = [i].[ItemId]
                        AND [ugi].[UserGameId] = [i].[UserGameId]
            );
GO

UPDATE
        [dbo].[UsersGames]
SET
        [Cash] += 50000
WHERE
        [UserId] IN (
            SELECT
                    [Id]
            FROM
                    [dbo].[Users]
            WHERE
                    [Username] IN ('baleremuda', 'loosenoise', 'inguinalself',
                    'buildingdeltoid', 'monoxidecos')
        )

GO

CREATE PROCEDURE [usp_BuyBatchItems] (@UserId INT, @StartItemIndex INT, @EndItemIndex INT, @GameId INT)
AS
BEGIN TRANSACTION
DECLARE @UserGameId INT;
SELECT
        @UserGameId = [Id]
FROM
        [dbo].[UsersGames]
WHERE
        [UserId] = @UserId
        AND [GameId] = @GameId

DECLARE @TotalCost INT;
SELECT
        @TotalCost = SUM([Price])
FROM
        [dbo].[Items]
WHERE
        [Id] BETWEEN @StartItemIndex AND @EndItemIndex;

UPDATE
        [dbo].[UsersGames]
SET
        [Cash] = [Cash] - @TotalCost
WHERE
        [Id] = @UserGameId;


INSERT INTO [dbo].[UserGameItems] ([ItemId], [UserGameId])
    SELECT
            [Id],
            @UserGameId
    FROM
            [dbo].[Items]
    WHERE
            [Id] BETWEEN @StartItemIndex AND @EndItemIndex;

COMMIT TRANSACTION
GO

DECLARE @GameId INT;

SELECT
        @GameId = [Id]
FROM
        [dbo].[Games]
WHERE
        [Name] = 'Bali';

DECLARE @UserId INT;

SELECT
        @UserId = [Id]
FROM
        [dbo].[Users]
WHERE
        [Username] = 'baleremuda';
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 251,
    @EndItemIndex = 299,
    @GameId = @GameId;
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 501,
    @EndItemIndex = 539,
    @GameId = @GameId;

SELECT
        @UserId = [Id]
FROM
        [dbo].[Users]
WHERE
        [Username] = 'loosenoise';
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 251,
    @EndItemIndex = 299,
    @GameId = @GameId;
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 501,
    @EndItemIndex = 539,
    @GameId = @GameId;

SELECT
        @UserId = [Id]
FROM
        [dbo].[Users]
WHERE
        [Username] = 'inguinalself';
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 251,
    @EndItemIndex = 299,
    @GameId = @GameId;
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 501,
    @EndItemIndex = 539,
    @GameId = @GameId;

SELECT
        @UserId = [Id]
FROM
        [dbo].[Users]
WHERE
        [Username] = 'buildingdeltoid';
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 251,
    @EndItemIndex = 299,
    @GameId = @GameId;
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 501,
    @EndItemIndex = 539,
    @GameId = @GameId;

SELECT
        @UserId = [Id]
FROM
        [dbo].[Users]
WHERE
        [Username] = 'monoxidecos';
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 251,
    @EndItemIndex = 299,
    @GameId = @GameId;
EXEC [usp_BuyBatchItems]
    @UserId = @UserId,
    @StartItemIndex = 501,
    @EndItemIndex = 539,
    @GameId = @GameId;


SELECT
        [u].[Username],
        [g].[Name],
        [ug].[Cash],
        [i].[Name] AS [Item Name]
FROM
        [dbo].[Users] AS [u]
    INNER JOIN
        [dbo].[UsersGames] AS [ug]
        ON [u].[Id] = [ug].[UserId]
    INNER JOIN
        [dbo].[Games] AS [g]
        ON [ug].[GameId] = [g].[Id]
    INNER JOIN
        [dbo].[UserGameItems] AS [ugi]
        ON [ug].[Id] = [ugi].[UserGameId]
    INNER JOIN
        [dbo].[Items] AS [i]
        ON [ugi].[ItemId] = [i].[Id]
WHERE
        [g].[Name] = 'Bali'
ORDER BY
        [u].[Username],
        [i].[Name]