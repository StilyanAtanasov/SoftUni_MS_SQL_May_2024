USE [Bank]
GO

CREATE PROCEDURE [usp_DepositMoney] (@AccountId INT, @MoneyAmount MONEY) 
AS
IF (@MoneyAmount > 0) 
BEGIN
UPDATE
        [Accounts]
SET
        [Balance] = FORMAT(([Balance] + @MoneyAmount), 'N4')
WHERE
    [Id] = @AccountId
END