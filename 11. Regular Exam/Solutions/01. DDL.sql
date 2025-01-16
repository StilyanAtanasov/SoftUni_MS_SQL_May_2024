CREATE DATABASE [LibraryDb];
GO

USE [LibraryDb];
GO

CREATE TABLE [Contacts] (
    [Id]            INT IDENTITY CONSTRAINT [PK_Contacts_Id] PRIMARY KEY ,
    [Email]         NVARCHAR(100) NULL,
    [PhoneNumber]   NVARCHAR(20) NULL,
    [PostAddress]   NVARCHAR(200) NULL,
    [Website]       NVARCHAR(50) NULL
);

CREATE TABLE [Genres] (
    [Id]    INT IDENTITY CONSTRAINT [PK_Genres_Id] PRIMARY KEY,
    [Name]  NVARCHAR(30) NOT NULL
);

CREATE TABLE [Authors] (
    [Id]        INT IDENTITY CONSTRAINT [PK_Authors_Id] PRIMARY KEY,
    [Name]      NVARCHAR(100) NOT NULL,
    [ContactId] INT NOT NULL,
    CONSTRAINT [FK_Authors-ContactId_Contacts-Id] FOREIGN KEY ([ContactId]) REFERENCES [Contacts]([Id])
);

CREATE TABLE [Libraries] (
    [Id]        INT IDENTITY CONSTRAINT [PK_Libraries_Id] PRIMARY KEY,
    [Name]      NVARCHAR(50) NOT NULL,
    [ContactId] INT NOT NULL,
    CONSTRAINT [FK_Libraries-ContactId_Contacts-Id] FOREIGN KEY ([ContactId]) REFERENCES [Contacts]([Id])
);

CREATE TABLE [Books] (
    [Id]            INT IDENTITY CONSTRAINT [PK_Books_Id] PRIMARY KEY,
    [Title]         NVARCHAR(100) NOT NULL,
    [YearPublished] INT NOT NULL,
    [ISBN]          NVARCHAR(13) NOT NULL UNIQUE,
    [AuthorId]      INT NOT NULL,
    [GenreId]       INT NOT NULL,
    CONSTRAINT [FK_Books-AuthorId_Authors-Id] FOREIGN KEY ([AuthorId]) REFERENCES [Authors]([Id]),
    CONSTRAINT [FK_Books-GenreId_Genres-Id] FOREIGN KEY ([GenreId]) REFERENCES [Genres]([Id])
);

CREATE TABLE [LibrariesBooks] (
    [LibraryId] INT NOT NULL,
    [BookId]    INT NOT NULL,
    CONSTRAINT [PK_LibrariesBooks_LibraryId_BookId] PRIMARY KEY ([LibraryId], [BookId]),
    CONSTRAINT [FK_LibrariesBooks-LibraryId_Libraries-Id] FOREIGN KEY ([LibraryId]) REFERENCES [Libraries]([Id]),
    CONSTRAINT [FK_LibrariesBooks-BookId_Books-Id] FOREIGN KEY ([BookId]) REFERENCES [Books]([Id])
);