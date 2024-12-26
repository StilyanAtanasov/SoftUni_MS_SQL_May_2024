USE [Diablo]
GO

SELECT
        [Username],
        RIGHT([Email], LEN([Email]) - CHARINDEX('@', [Email])) AS [Email Provider]
FROM
        [dbo].[Users]
ORDER BY
        [Email Provider],
        [Username]