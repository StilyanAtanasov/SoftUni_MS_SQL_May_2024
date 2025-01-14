BEGIN TRANSACTION;

DECLARE @GameId     INT,
        @UserId     INT,
        @UserGameId INT;
DECLARE @UserCash   MONEY,
        @TotalPrice MONEY;

SELECT
        @GameId = [Id]
FROM
        [dbo].[Games]
WHERE
        [Name] = 'Edinburgh';
SELECT
        @UserId = [Id]
FROM
        [dbo].[Users]
WHERE
        [Username] = 'Alex';

DECLARE @ItemNames TABLE (
    [Name] NVARCHAR(255)
);

INSERT INTO @ItemNames ([Name])
VALUES ( 'Blackguard' ),
       ( 'Bottomless Potion of Amplification' ),
       ( 'Eye of Etlich (Diablo III)' ),
       ( 'Gem of Efficacious Toxin' ),
       ( 'Golden Gorget of Leoric' ),
       ( 'Hellfire Amulet' );

SELECT
        @UserCash   = [ug].[Cash],
        @UserGameId = [ug].[Id],
        @TotalPrice = (
            SELECT
                    SUM([Price])
            FROM
                    [dbo].[Items]
            WHERE
                    [Name] IN (
                        SELECT
                                [Name]
                        FROM
                                @ItemNames
                    )
        )
FROM
        [dbo].[UsersGames] AS [ug]
WHERE
        [ug].[UserId] = @UserId
        AND [ug].[GameId] = @GameId;

IF (@UserCash >= @TotalPrice)
BEGIN

UPDATE
        [dbo].[UsersGames]
SET
        [Cash] = @UserCash - @TotalPrice
WHERE
        [UserId] = @UserId
        AND [GameId] = @GameId;

INSERT INTO [dbo].[UserGameItems] ([ItemId], [UserGameId])
    SELECT
            [Id],
            @UserGameId
    FROM
            [dbo].[Items]
    WHERE
            [Name] IN (
                SELECT
                        [Name]
                FROM
                        @ItemNames
            );

END
ELSE
BEGIN
ROLLBACK TRANSACTION;
RETURN;
END;

COMMIT TRANSACTION;

SELECT
        [u].[Username],
        [g].[Name] AS [Game],
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
        [g].[Id] = @GameId
ORDER BY
        [Item Name];