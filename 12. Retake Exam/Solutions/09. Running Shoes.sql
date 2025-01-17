USE [ShoesApplicationDatabase]
GO

SELECT
        [s].[Model],
        COUNT([ss].[SizeId]) AS [CountOfSizes],
        [b].[Name]           AS [BrandName]
FROM
        [Shoes] AS [s]
    INNER JOIN
        [Brands] AS [b]
        ON [s].[BrandId] = [b].[Id]
    INNER JOIN
        [ShoesSizes] AS [ss]
        ON [s].[Id] = [ss].[ShoeId]
WHERE
        [b].[Name] = 'Nike'
        AND [s].[Model] LIKE '%Run%'
GROUP BY
        [s].[Model],
        [b].[Name]
HAVING
        COUNT([ss].[SizeId]) > 5
ORDER BY
        [Model] DESC