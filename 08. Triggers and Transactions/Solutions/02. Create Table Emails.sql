USE [Bank]
GO

CREATE TABLE [NotificationEmails] (
        [Id]        INT PRIMARY KEY IDENTITY, 
        [Recipient] INT FOREIGN KEY REFERENCES [Accounts]([Id]) NOT NULL, 
        [Subject]   VARCHAR(100)  NOT NULL, 
        [Body]      VARCHAR(200)  NOT NULL
)

GO

CREATE TRIGGER [tr_Logs_OnLog] 
ON [dbo].[Logs]
FOR INSERT
AS
INSERT INTO [dbo].[NotificationEmails] ([Recipient], [Subject], [Body])
    SELECT
            [AccountId],
            CONCAT('Balance change for account: ', [AccountId]),
            CONCAT('On ', GETDATE(), ' your balance was changed from ', [OldSum], ' to ', [NewSum], '.')
    FROM
            [INSERTED]

GO