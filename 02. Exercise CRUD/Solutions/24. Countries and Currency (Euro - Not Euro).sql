USE [Geography]
GO

SELECT
        [CountryName],
        [CountryCode],
        CASE [CurrencyCode]
                WHEN 'EUR'
                    THEN
                       'Euro'
                ELSE
                   'Not Euro'
        END AS [Currency]
FROM
        [dbo].[Countries]
ORDER BY
        [CountryName]