USE [Gringotts]
GO

SELECT
        [DepositGroup],
        SUM([DepositAmount]) AS [TotalSum]
FROM
        [dbo].[WizzardDeposits]
WHERE
        [MagicWandCreator] = 'Ollivander family'
GROUP BY
        [DepositGroup]