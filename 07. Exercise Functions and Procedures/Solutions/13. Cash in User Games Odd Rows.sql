USE [Diablo]
GO

CREATE FUNCTION [ufn_CashInUsersGames] (@GameName VARCHAR(50)) 
RETURNS  TABLE  AS
RETURN (
SELECT
        SUM([res].[Cash]) AS [SumCash]
FROM
        (
            SELECT
                    [ug].[Cash],
                    ROW_NUMBER() OVER (ORDER BY [ug].[Cash] DESC) AS [Rank]
            FROM
                    [dbo].[UsersGames] AS [ug]
                INNER JOIN
                    [dbo].[Games] AS [g]
                    ON [ug].[GameId] = [g].[Id]
            WHERE
                    [g].[Name] = @GameName
        ) AS [res]
WHERE
        [res].[Rank] % 2 = 1
)