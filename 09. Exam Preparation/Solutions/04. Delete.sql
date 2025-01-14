USE [TouristAgency]
GO

BEGIN TRANSACTION

DECLARE @TouristsToDelete TABLE ([Id] INT PRIMARY KEY)

INSERT INTO @TouristsToDelete
    SELECT
            [Id]
    FROM
            [Tourists]
    WHERE
            [Name] LIKE '%Smith%'

DELETE FROM
        [Bookings]
WHERE
        [TouristId] IN (
            SELECT
                    [Id]
            FROM
                    @TouristsToDelete
        )

DELETE FROM
        [Tourists]
WHERE
        [Id] IN (
            SELECT
                    [Id]
            FROM
                    @TouristsToDelete
        )

COMMIT TRANSACTION