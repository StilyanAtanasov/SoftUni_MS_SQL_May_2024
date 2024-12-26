USE [Diablo]
GO

SELECT
        [Username],
        [IpAddress]
FROM
        [dbo].[Users]
WHERE
        [IpAddress] LIKE '___.1%.%.___'
ORDER BY
        [Username]