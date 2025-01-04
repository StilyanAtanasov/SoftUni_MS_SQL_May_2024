USE [Gringotts]
GO

SELECT
        [DepositGroup],
        SUM([DepositAmount]) AS [TotalSum]
FROM
        [dbo].[WizzardDeposits]
GROUP BY
        [DepositGroup]