ALTER TABLE [Users]
DROP CONSTRAINT [PK__Users__3214EC072F4EE94B]

ALTER TABLE [Users]
ADD CONSTRAINT [PK_Users_IdUsername] PRIMARY KEY([Id], [Username])