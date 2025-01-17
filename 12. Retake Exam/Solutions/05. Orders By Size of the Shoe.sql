USE [ShoesApplicationDatabase]
GO

SELECT
        [s].[Model] AS [ShoeModel],
        [s].[Price]
FROM
        [Orders] AS [o]
    INNER JOIN
        [Shoes] AS [s]
        ON [o].[ShoeId] = [s].[Id]
ORDER BY
        [Price] DESC,
        [ShoeModel] ASC