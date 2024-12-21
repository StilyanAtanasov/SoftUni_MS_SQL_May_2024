CREATE TABLE [Teachers] (
    [TeacherID] INT PRIMARY KEY,
    [Name]      NVARCHAR(100),
    [ManagerID] INT
);

INSERT INTO [Teachers] ([TeacherID], [Name], [ManagerID])
VALUES ( 101, 'John', NULL ),
       ( 102, 'Maya', 106 ),
       ( 103, 'Silvia', 106 ),
       ( 104, 'Ted', 105 ),
       ( 105, 'Mark', 101 ),
       ( 106, 'Greta', 101 );

ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [FK_Teachers_ManagerID] FOREIGN KEY ([ManagerID]) REFERENCES [dbo].[Teachers]([TeacherID])