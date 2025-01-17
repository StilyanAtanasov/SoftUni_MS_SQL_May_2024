USE [ShoesApplicationDatabase]
GO

SELECT
        [b].[Name] AS [BrandName],
        [s].[Model] AS [ShoeModel]
FROM
        [Shoes] AS [s]
    INNER JOIN 
        [Brands] AS [b]
        ON [s].[BrandId] = [b].[Id]
ORDER BY
        [BrandName] ASC,
        [ShoeModel] ASC