CREATE DATABASE [University]
GO

USE [University]
GO

CREATE TABLE [Students] (
    [StudentID]     INT          NOT NULL,
    [StudentNumber] INT          NOT NULL,
    [StudentName]   NVARCHAR(80) NOT NULL,
    [MajorID]       INT          NOT NULL
)

CREATE TABLE [Majors] (
    [MajorID] INT          NOT NULL,
    [Name]    NVARCHAR(80) NOT NULL
)

CREATE TABLE [Payments] (
    [PaymentID]     INT       NOT NULL,
    [PaymentDate]   DATETIME2 NOT NULL,
    [PaymentAmount] MONEY     NOT NULL,
    [StudentID]     INT       NOT NULL
)

CREATE TABLE [Subjects] (
    [SubjectID]   INT          NOT NULL,
    [SubjectName] NVARCHAR(70) NOT NULL
)


CREATE TABLE [Agenda] (
    [StudentID] INT NOT NULL,
    [SubjectID] INT NOT NULL,
)

ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students_StudentID] PRIMARY KEY ([StudentID])

ALTER TABLE [dbo].[Majors]
ADD CONSTRAINT [PK_Majors_MajorID] PRIMARY KEY ([MajorID])

ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [PK_Payments_PaymentID] PRIMARY KEY ([PaymentID])

ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects_SubjectID] PRIMARY KEY ([SubjectID])

ALTER TABLE [dbo].[Agenda]
ADD CONSTRAINT [PK_Agenda_StudentID-SubjectID] PRIMARY KEY ([StudentID], [SubjectID])


ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_Students_MajorID] FOREIGN KEY ([MajorID]) REFERENCES [dbo].[Majors] ([MajorID])

ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [FK_Payments_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Students] ([StudentID])

ALTER TABLE [dbo].[Agenda]
ADD CONSTRAINT [FK_Agenda_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Students] ([StudentID])

ALTER TABLE [dbo].[Agenda]
ADD CONSTRAINT [FK_Agenda_SubjectID] FOREIGN KEY ([SubjectID]) REFERENCES [dbo].[Subjects] ([SubjectID])