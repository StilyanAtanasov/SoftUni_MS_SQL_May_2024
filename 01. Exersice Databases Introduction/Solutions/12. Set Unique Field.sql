ALTER TABLE [Users]
DROP CONSTRAINT PK_Users_IdUsername

ALTER TABLE [Users]
ADD CONSTRAINT PK_Users_Id PRIMARY KEY([Id])

ALTER TABLE [Users]
ADD CONSTRAINT UQ_Users_Username UNIQUE([Username])

ALTER TABLE [Users]
ADD CONSTRAINT PK_Users_UsernameLength CHECK(LEN([Username]) >= 3)