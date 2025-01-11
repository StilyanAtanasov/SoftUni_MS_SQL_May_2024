USE [Bank]
GO

CREATE PROCEDURE [usp_TransferMoney] (@SenderId INT, @ReceiverId INT , @Amount MONEY)
AS
BEGIN TRANSACTION
IF (@Amount < 0)
ROLLBACK TRANSACTION

EXEC [dbo].[usp_WithdrawMoney] @SenderId, @Amount
EXEC [dbo].[usp_DepositMoney] @ReceiverId, @Amount
COMMIT TRANSACTION