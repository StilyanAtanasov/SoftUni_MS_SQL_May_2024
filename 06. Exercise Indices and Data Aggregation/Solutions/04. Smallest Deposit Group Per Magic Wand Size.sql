USE [Gringotts]
GO

SELECT TOP (2)
        [DepositGroup]
FROM
        [dbo].[WizzardDeposits]
GROUP BY
        [DepositGroup]
ORDER BY
        AVG(MagicWandSize)