USE [ShoesApplicationDatabase]
GO

SELECT
        [u].[FullName],
        [u].[PhoneNumber],
        [s].[Price] AS [OrderPrice],
        [o].[ShoeId],
        [s].[BrandId],
        CONCAT([sz].[EU], 'EU', '/', [sz].[US], 'US', '/', [sz].[UK], 'UK') AS [ShoeSize]
FROM
        [Orders] AS [o]
    INNER JOIN
        [Users] AS [u]
        ON [o].[UserId] = [u].[Id]
    INNER JOIN
        [Shoes] AS [s]
        ON [o].[ShoeId] = [s].[Id]
    INNER JOIN
        [Sizes] AS [sz]
        ON [o].[SizeId] = [sz].[Id]
WHERE
        [u].[PhoneNumber] LIKE '%345%'
ORDER BY
        [s].[Model] ASC