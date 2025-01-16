USE [LibraryDb]
GO

UPDATE
        [c]
SET
        [c].[Website] = CONCAT('www.', REPLACE(LOWER([a].[Name]), ' ', ''), '.com')
FROM
        [Contacts] AS [c]
    INNER JOIN
        [Authors] AS [a]
            ON [c].[Id] = [a].[ContactId]
WHERE
        [Website] IS NULL