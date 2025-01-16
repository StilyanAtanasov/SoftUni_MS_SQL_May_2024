USE [LibraryDb]
GO

INSERT INTO [Contacts] ([Email], [PhoneNumber], [PostAddress], [Website])
VALUES ( NULL, NULL, NULL, NULL ),
       ( NULL, NULL, NULL, NULL ),
       ( N'stephen.king@example.com', N'+4445556666', N'15 Fiction Ave, Bangor, ME', N'www.stephenking.com' ),
       ( N'suzanne.collins@example.com', N'+7778889999', N'10 Mockingbird Ln, NY, NY', N'www.suzannecollins.com' );

INSERT INTO [Authors] ([Name], [ContactId])
VALUES ( N'George Orwell', 21 ),
       ( N'Aldous Huxley', 22 ),
       ( N'Stephen King', 23 ),
       ( N'Suzanne Collins', 24 );

INSERT INTO [Books] ([Title], [YearPublished], [ISBN], [AuthorId], [GenreId])
VALUES ( N'1984', 1949, N'9780451524935', 16, 2 ),
       ( N'Animal Farm', 1945, N'9780451526342', 16, 2 ),
       ( N'Brave New World', 1932, N'9780060850524', 17, 2 ),
       ( N'The Doors of Perception', 1954, N'9780060850531', 17, 2 ),
       ( N'The Shining', 1977, N'9780307743657', 18, 9 ),
       ( N'It', 1986, N'9781501142970', 18, 9 ),
       ( N'The Hunger Games', 2008, N'9780439023481', 19, 7 ),
       ( N'Catching Fire', 2009, N'9780439023498', 19, 7 ),
       ( N'Mockingjay', 2010, N'9780439023511', 19, 7 );

INSERT INTO [LibrariesBooks] ([LibraryId], [BookId])
VALUES ( 1, 36 ),
       ( 1, 37 ),
       ( 2, 38 ),
       ( 2, 39 ),
       ( 3, 40 ),
       ( 3, 41 ),
       ( 4, 42 ),
       ( 4, 43 ),
       ( 5, 44 );