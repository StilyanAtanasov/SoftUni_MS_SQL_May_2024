USE [Geography]
GO

SELECT
        [CountryName],
        [IsoCode]
FROM
        [dbo].[Countries]
WHERE
        [CountryName] LIKE '%a%a%a%'
ORDER BY
        [IsoCode]