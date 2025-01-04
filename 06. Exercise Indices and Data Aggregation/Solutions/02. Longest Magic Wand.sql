USE [Gringotts]
GO

SELECT
        MAX(MagicWandSize) AS [LongestMagicWand]
FROM
        [dbo].[WizzardDeposits]