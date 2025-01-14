USE [TouristAgency]
GO

UPDATE
        [Bookings]
SET
        [DepartureDate] = DATEADD(DAY, 1, [DepartureDate])
WHERE
        DATEPART(YEAR, [ArrivalDate]) = 2023
        AND DATEPART(MONTH, [ArrivalDate]) = 12

UPDATE
        [Tourists]
SET
        [Email] = NULL
WHERE
        [Name] LIKE '%MA%'