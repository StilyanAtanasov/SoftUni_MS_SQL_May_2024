CREATE DATABASE [Movies]
GO

USE [Movies]
GO

CREATE TABLE [Directors] (
[Id] INT PRIMARY KEY IDENTITY,
[DirectorName] VARCHAR(50) NOT NULL,
[Notes] VARCHAR(1000)
)

CREATE TABLE [Genres] (
[Id] INT PRIMARY KEY IDENTITY,
[GenreName] VARCHAR(50) NOT NULL,
[Notes] VARCHAR(1000)
)

CREATE TABLE [Categories] (
[Id] INT PRIMARY KEY IDENTITY,
[CategoryName] VARCHAR(50) NOT NULL,
[Notes] VARCHAR(1000)
)

CREATE TABLE [Movies] (
[Id] INT PRIMARY KEY IDENTITY,
[Title] VARCHAR(70) NOT NULL,
[DirectorId] INT FOREIGN KEY REFERENCES [Directors](Id) NOT NULL,
[CopyrightYear] SMALLINT,
[Length] TINYINT NOT NULL,
[GenreId] INT FOREIGN KEY REFERENCES [Genres](Id) NOT NULL,
[CategoryId] INT FOREIGN KEY REFERENCES [Categories](Id) NOT NULL,
[Rating] DECIMAL(2,1),
[Notes] VARCHAR(1000)
)

INSERT INTO [Directors] ([DirectorName], [Notes])
VALUES 
    ('Christopher Nolan', NULL),
    ('Steven Spielberg', 'Directed Jurassic Park and E.T.'),
    ('Quentin Tarantino', 'Famous for Pulp Fiction.'),
    ('James Cameron', 'Directed Titanic and Avatar.'),
    ('Sofia Coppola', NULL);

INSERT INTO [Genres] ([GenreName], [Notes])
VALUES 
    ('Action', 'High-energy movies with stunts and combat.'),
    ('Drama', 'Focuses on character development.'),
    ('Comedy', 'Movies meant to entertain and amuse.'),
    ('Horror', 'Designed to scare or thrill the audience.'),
    ('Sci-Fi', 'Explores futuristic and scientific concepts.');

INSERT INTO [Categories] ([CategoryName], [Notes])
VALUES 
    ('Feature Film', 'Full-length movies.'),
    ('Short Film', 'Movies under 40 minutes.'),
    ('Documentary', NULL),
    ('Series', NULL),
    ('Animated', 'Movies with animated visuals.');

INSERT INTO [Movies] ([Title], [DirectorId], [CopyrightYear], [Length], [GenreId], [CategoryId], [Rating], [Notes])
VALUES 
    ('Inception', 1, NULL, 148, 5, 1, 8.8, 'A mind-bending thriller.'),
    ('Jurassic Park', 2, 1993, 127, 1, 1, 8.1, 'Dinosaurs brought to life.'),
    ('Pulp Fiction', 3, 1994, 154, 2, 1, 8.9, NULL),
    ('Avatar', 4, 2009, 162, 5, 1, 7.8, 'Sci-fi adventure on Pandora.'),
    ('Lost in Translation', 5, 2003, 102, 2, 1, 7.7, NULL);
