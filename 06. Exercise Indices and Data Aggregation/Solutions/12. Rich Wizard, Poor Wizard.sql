USE [Gringotts]
GO

SELECT
        SUM([gd].[Difference]) AS [SumDifference]
FROM
        (
            SELECT
                    [h].[FirstName]                           AS [Host Wizard],
                    [h].[DepositAmount]                       AS [Host Wizard Deposit],
                    [g].[FirstName]                           AS [Guest Wizard],
                    [g].[DepositAmount]                       AS [Guest Wizard Deposit],
                    [h].[DepositAmount] - [g].[DepositAmount] AS [Difference]
            FROM
                    [dbo].[WizzardDeposits] AS [h]
                JOIN
                    [dbo].[WizzardDeposits] AS [g]
                    ON [g].[Id] = [h].[Id] + 1
        ) AS [gd]