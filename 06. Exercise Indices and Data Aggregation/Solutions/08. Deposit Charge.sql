USE [Gringotts]
GO

SELECT
        [DepositGroup],
        [MagicWandCreator],
        MIN([DepositCharge]) AS [MinDepositCharge]
FROM
        [dbo].[WizzardDeposits]
GROUP BY
        [DepositGroup],
        [MagicWandCreator]
HAVING
        SUM([DepositAmount]) < 150000
ORDER BY
        [MagicWandCreator] ASC,
        [DepositGroup] ASC