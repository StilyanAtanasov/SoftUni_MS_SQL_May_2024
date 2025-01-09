USE [Bank]
GO

CREATE PROCEDURE [usp_GetHoldersWithBalanceHigherThan] (@MinTotalBalance MONEY) AS
BEGIN
SELECT
        [ah].[FirstName] AS [First Name],
        [ah].[LastName] AS [Last Name]
FROM
        [dbo].[Accounts] AS [a]
    INNER JOIN
        [dbo].[AccountHolders] AS [ah]
        ON [a].[AccountHolderId] = [ah].[Id]
GROUP BY
        [a].[AccountHolderId],
        [ah].[FirstName],
        [ah].[LastName]
HAVING
        SUM([a].[Balance]) > @MinTotalBalance
ORDER BY
        [ah].[FirstName],
        [ah].[LastName]
END