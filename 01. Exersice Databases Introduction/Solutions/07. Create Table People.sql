CREATE TABLE [People]
(
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(200) NOT NULL,
    [Picture] VARBINARY(MAX) CHECK(DATALENGTH([Picture]) <= 2000000),
    [Height] DECIMAL(3, 2),
    [Weight]  DECIMAL(5, 2),
    [Gender] CHAR(1) NOT NULL CHECK([Gender] IN('m', 'f')),
    [BirthDate] DATETIME2 NOT NULL,
    [Biography] NVARCHAR(MAX)
)

INSERT INTO [People] ([Name], [Picture], [Height], [Weight], [Gender], [BirthDate], [Biography])
VALUES
    ('Alice Johnson', NULL, 1.65, 60.05, 'f', '1990-01-15', 'Talented writer and avid reader.'),
    ('Bob Smith', NULL, 1.78, NULL, 'm', '1985-07-22', 'Skilled software engineer and hiker.'),
    ('Charlie Brown', NULL, 1.60, 55.00, 'm', '1992-11-03', 'Passionate musician and guitarist.'),
    ('Daisy Miller', NULL, NULL, NULL, 'f', '1988-03-12', 'Talented artist and painter.'),
    ('Eve Green', NULL, 1.68, 62.25, 'f', '1995-09-28', 'Skilled dancer and ballet enthusiast.');
