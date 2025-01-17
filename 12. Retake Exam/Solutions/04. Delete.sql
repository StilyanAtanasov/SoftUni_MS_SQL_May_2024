USE [ShoesApplicationDatabase]
GO

BEGIN TRANSACTION

DECLARE @modelId INT;
SELECT
        @modelId = [Id]
FROM
        [Shoes]
WHERE
        [Model] = 'Joyride Run Flyknit'

DELETE FROM
        [Orders]
WHERE
        [ShoeId] = @modelId

DELETE FROM
        [ShoesSizes]
WHERE
        [ShoeId] = @modelId

DELETE FROM
        [Shoes]
WHERE
        [Id] = @modelId

COMMIT TRANSACTION