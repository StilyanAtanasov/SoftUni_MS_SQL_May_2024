USE [ShoesApplicationDatabase]
GO

CREATE PROCEDURE [usp_SearchByShoeSize] (@shoeSize DECIMAL(5, 2))
AS
SELECT
        [sh].[Model]   AS [ModelName],
        [u].[FullName] AS [UserFullName],
        CASE
            WHEN [sh].[Price] < 100
                THEN
                   'Low'
            WHEN [sh].[Price] BETWEEN 100 AND 200
                THEN
                   'Medium'
            ELSE
               'High'
        END            AS [PriceLevel],
        [b].[Name]     AS [BrandName],
        [s].[EU]       AS [SizeEU]
FROM
        [Orders] AS [o]
    INNER JOIN
        [Sizes] AS [s]
        ON [o].[SizeId] = [s].[Id]
    INNER JOIN
        [Users] AS [u]
        ON [o].[UserId] = [u].[Id]
    INNER JOIN
        [Shoes] AS [sh]
        ON [o].[ShoeId] = [sh].[Id]
    INNER JOIN
        [Brands] AS [b]
        ON [sh].[BrandId] = [b].[Id]
WHERE
        [s].[EU] = @shoeSize
ORDER BY
        [BrandName] ASC,
        [UserFullName] ASC