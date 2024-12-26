USE [master]
GO

CREATE TABLE [dbo].[Persons] (
    [Id]        INT PRIMARY KEY,
    [Name]      NVARCHAR(50),
    [Birthdate] DATETIME2
);

INSERT INTO [dbo].[Persons] ([Id], [Name], [Birthdate])
VALUES ( 1, 'Victor', '2000-12-07 00:00:00.000' ),
       ( 2, 'Steven', '1992-09-10 00:00:00.000' ),
       ( 3, 'Stephen', '1910-09-19 00:00:00.000' ),
       ( 4, 'John', '2010-01-06 00:00:00.000' ),
       ( 5, 'Alice', '1985-03-15 00:00:00.000' ),
       ( 6, 'Michael', '1978-11-22 00:00:00.000' ),
       ( 7, 'Emma', '2002-07-08 00:00:00.000' ),
       ( 8, 'David', '1965-05-30 00:00:00.000' ),
       ( 9, 'Sophia', '1999-12-25 00:00:00.000' ),
       ( 10, 'Chris', '1955-04-10 00:00:00.000' );

SELECT
        [Name],
        DATEDIFF(YEAR, [Birthdate], GETDATE()) AS [Age in Years],
        DATEDIFF(MONTH, [Birthdate], GETDATE()) AS [Age in Months],
        DATEDIFF(DAY, [Birthdate], GETDATE()) AS [Age in Days],
        DATEDIFF(MINUTE, [Birthdate], GETDATE()) AS [Age in Minutes]
FROM
        [dbo].[Persons]
