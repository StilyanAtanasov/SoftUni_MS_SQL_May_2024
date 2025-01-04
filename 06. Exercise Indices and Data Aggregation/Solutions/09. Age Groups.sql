USE [Gringotts]
GO

SELECT
        [res].[AgeGroup],
        COUNT([res].[Id]) AS [WizardCount]
FROM
        (
            SELECT

                    [Id],
                    CASE
                        WHEN [Age] BETWEEN 0 AND 9
                            THEN
                               '[0-10]'
                        WHEN [Age] BETWEEN 10 AND 20
                            THEN
                               '[11-20]'
                        WHEN [Age] BETWEEN 21 AND 30
                            THEN
                               '[21-30]'
                        WHEN [Age] BETWEEN 30 AND 40
                            THEN
                               '[31-40]'
                        WHEN [Age] BETWEEN 40 AND 50
                            THEN
                               '[41-50]'
                        WHEN [Age] BETWEEN 51 AND 60
                            THEN
                               '[51-60]'
                        ELSE
                           '[60+]'
                    END AS [AgeGroup]
            FROM
                    [dbo].[WizzardDeposits]
        ) AS [res]
GROUP BY
        [res].[AgeGroup]