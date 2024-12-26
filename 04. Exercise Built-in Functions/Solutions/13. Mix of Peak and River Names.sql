USE [Geography]
GO

SELECT
        [p].[PeakName],
        [r].[RiverName],
        LOWER(CONCAT([p].[PeakName], RIGHT([r].[RiverName], LEN([r].[RiverName]) - 1))) AS [Mix]
FROM
        [dbo].[Peaks] AS [p],
        [dbo].[Rivers] AS [r]
WHERE
       LEFT([r].[RiverName], 1) = RIGHT([p].[PeakName], 1)
ORDER BY
        [Mix]