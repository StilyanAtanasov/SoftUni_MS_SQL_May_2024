USE [Bank]
GO

CREATE PROCEDURE [usp_CalculateFutureValueForAccount] (@AccountID INT, @InterestRate DECIMAL(15, 10)) AS 
BEGIN
SELECT
        [a].[Id]                                                          AS [Account Id],
        [ah].[FirstName]                                                  AS [First Name],
        [ah].[LastName]                                                   AS [Last Name],
        [a].[Balance]                                                     AS [Current Balance],
        [dbo].[ufn_CalculateFutureValue]([a].[Balance], @InterestRate, 5) AS [Balance in 5 years]
FROM
        [dbo].[Accounts] AS [a]
    INNER JOIN
        [dbo].[AccountHolders] AS [ah]
        ON [a].[AccountHolderId] = [ah].[Id]
WHERE
        [a].[Id] = @AccountID
END