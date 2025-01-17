USE [ShoesApplicationDatabase]
GO

UPDATE
        [s]
SET
        [s].[Price] *= 1.15
FROM
        [Shoes] AS [s]
    INNER JOIN
        [Brands] AS [b]
            ON [s].[BrandId] = [b].[Id]
WHERE
        [b].[Name] = 'Nike'