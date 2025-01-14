USE [Diablo]
GO

SELECT
        RIGHT([Email], LEN([Email]) - CHARINDEX('@', [Email])) AS [Email Provider],
        COUNT([Id])                                             AS [Number Of Users]
FROM
        [dbo].[Users]
GROUP BY
        RIGHT([Email], LEN([Email]) - CHARINDEX('@', [Email]))
ORDER BY
        [Number Of Users] DESC,
        [Email Provider] ASC