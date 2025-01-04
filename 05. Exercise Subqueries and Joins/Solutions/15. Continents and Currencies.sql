USE [Geography]
GO

WITH CTE_CurrencyUsage AS
   (
       SELECT
               [c].[ContinentCode],
               [c].[CurrencyCode],
               COUNT([c].[CurrencyCode]) AS [CurrencyUsage]
       FROM
               [dbo].[Countries] AS [c]
       GROUP BY
               [c].[ContinentCode],
               [c].[CurrencyCode]
       HAVING
               COUNT([c].[CurrencyCode]) > 1
   ),
CTE_Rank_CurrencyUsage AS
   (
       SELECT
               *,
               RANK() OVER (PARTITION BY [res].[ContinentCode] ORDER BY [res].[CurrencyUsage] DESC) AS [Rank]
       FROM
               [CTE_CurrencyUsage] AS [res]
   )

SELECT
        [res].[ContinentCode],
        [res].[CurrencyCode],
        [res].[CurrencyUsage]

FROM
        [CTE_Rank_CurrencyUsage] AS [res]
WHERE
        [res].[Rank] = 1
ORDER BY
        [res].[ContinentCode]