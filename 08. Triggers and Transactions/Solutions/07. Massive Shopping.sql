USE [Diablo]
GO

CREATE PROCEDURE [usp_BuyBatchItemsByLevel] (@UserId INT, @StartLevelIndex INT, @EndLevelIndex INT, @GameId INT)
AS
BEGIN
BEGIN TRANSACTION
DECLARE @UserGameId INT;
SELECT
        @UserGameId = [Id]
FROM
        [dbo].[UsersGames]
WHERE
        [UserId] = @UserId
        AND [GameId] = @GameId

DECLARE @UserLevel INT
DECLARE @Balance MONEY
SELECT
        @Balance   = [Cash],
        @UserLevel = [Level]
FROM
        [dbo].[UsersGames]
WHERE
        [Id] = @UserGameId;

DECLARE @TotalCost INT;
SELECT
        @TotalCost = SUM([Price])
FROM
        [dbo].[Items]
WHERE
        [MinLevel] BETWEEN @StartLevelIndex AND @EndLevelIndex
        AND @UserLevel > [MinLevel]

IF (@Balance < @TotalCost)
BEGIN
ROLLBACK TRANSACTION
RETURN;
END 

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
            [MinLevel] BETWEEN @StartLevelIndex AND @EndLevelIndex;

COMMIT TRANSACTION
END;

DECLARE @StamatUserId INT;
SELECT
        @StamatUserId = [Id]
FROM
        [Users]
WHERE
        [Username] = 'Stamat'

DECLARE @SafflowerGameId INT;
SELECT
        @SafflowerGameId = [Id]
FROM
        [Games]
WHERE
        [Name] = 'Safflower'

EXEC [dbo].[usp_BuyBatchItemsByLevel]
    @UserId = @StamatUserId,
    @StartLevelIndex = 11,
    @EndLevelIndex = 12,
    @GameId = @SafflowerGameId
EXEC [dbo].[usp_BuyBatchItemsByLevel]
    @UserId = @StamatUserId,
    @StartLevelIndex = 19,
    @EndLevelIndex = 21,
    @GameId = @SafflowerGameId

SELECT
        [i].[Name] AS [Item Name]
FROM
        [dbo].[UsersGames] AS [ug]
    INNER JOIN
        [dbo].[UserGameItems] AS [ugi]
        ON [ug].[Id] = [ugi].[UserGameId]
    INNER JOIN
        [dbo].[Items] AS [i]
        ON [ugi].[ItemId] = [i].[Id]
WHERE
        [UserId] = @StamatUserId
        AND [GameId] = @SafflowerGameId
ORDER BY
        [i].[Name] ASC