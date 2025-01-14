USE [Geography]
GO

SELECT
        [cr].[CurrencyCode],
        [cr].[Description] AS [Currency],
        COUNT([c].[CountryCode]) AS [NumberOfCountries]
FROM
        [Countries] AS [c]
    RIGHT OUTER JOIN 
        [Currencies] AS [cr]
        ON [c].[CurrencyCode] = [cr].[CurrencyCode]
GROUP BY
        [cr].[CurrencyCode],
        [cr].[Description]
ORDER BY
        [NumberOfCountries] DESC,
        [Currency] ASC