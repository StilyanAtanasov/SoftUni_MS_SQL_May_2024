USE [ShoesApplicationDatabase]
GO

SELECT
        [u].[Username],
        [u].[Email],
        CONVERT(DECIMAL(10, 2), ROUND(AVG([s].[Price]), 2)) AS [AvgPrice]
FROM
        [Orders] AS [o]
    INNER JOIN
        [Users] AS [u]
        ON [o].[UserId] = [u].[Id]
    INNER JOIN
        [Shoes] AS [s]
        ON [o].[ShoeId] = [s].[Id]
GROUP BY
        [u].[Username],
        [u].[Email]
HAVING
        COUNT([s].[Id]) > 2
ORDER BY
        [AvgPrice] DESC