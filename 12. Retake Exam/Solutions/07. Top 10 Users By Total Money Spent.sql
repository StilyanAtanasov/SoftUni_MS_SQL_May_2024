USE [ShoesApplicationDatabase]
GO

SELECT TOP (10)
        [u].[Id] AS [UserId],
        [u].[FullName],
        SUM([s].[Price]) AS [TotalSpent]
FROM
        [Orders] AS [o]
    INNER JOIN
        [Users] AS [u]
        ON [o].[UserId] = [u].[Id]
    INNER JOIN
        [Shoes] AS [s]
        ON [o].[ShoeId] = [s].[Id]
GROUP BY
        [u].[Id],
        [u].[FullName]
ORDER BY
        [TotalSpent] DESC,
        [FullName] ASC