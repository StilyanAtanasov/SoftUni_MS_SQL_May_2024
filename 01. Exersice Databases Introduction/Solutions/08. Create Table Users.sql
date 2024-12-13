CREATE TABLE [Users]
(
    [Id] BIGINT PRIMARY KEY IDENTITY,
    [Username] VARCHAR(30) NOT NULL,
    [Password] VARCHAR(26) NOT NULL,
    [ProfilePicture] VARBINARY(MAX) CHECK (DATALENGTH([ProfilePicture]) <= 900000),
    [LastLoginTime] DATETIME2,
    [IsDeleted] BIT
)

INSERT INTO [Users] ([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
VALUES
    ('alice_johnson', 'P@ssw0rd1234!@#', NULL, '2023-12-01 08:15:00', 0),
    ('bob_smith', 'B0bPass!2024', NULL, '2024-01-10 14:30:00', 0),
    ('charlie_brown', 'C@rlyB2024#', NULL, '2024-01-15 16:45:00', 0),
    ('daisy_miller', 'Daisy@123!', NULL, '2024-01-18 12:00:00', 1),
    ('eve_green', 'EveG@55!Pass', NULL, '2024-02-01 09:10:00', 0);
