USE [Bank]
GO

CREATE TABLE [Logs] (
        [LogId]     INT PRIMARY KEY IDENTITY, 
        [AccountId] INT NOT NULL, 
        [OldSum]    MONEY NOT NULL, 
        [NewSum]    MONEY NOT NULL
)

GO

CREATE TRIGGER [tr_Accounts_OnSumUpdate]
ON [Accounts]
FOR UPDATE
AS
INSERT INTO [Logs] ([AccountId], [OldSum], [NewSum])
    SELECT
            [i].[Id],
            [d].[Balance],
            [i].[Balance]
    FROM
            [INSERTED] AS [i]
        INNER JOIN
            [DELETED] AS [d]
            ON [d].[Id] = [i].[Id]
    WHERE
            [d].[Balance] <> [i].[Balance]

GO