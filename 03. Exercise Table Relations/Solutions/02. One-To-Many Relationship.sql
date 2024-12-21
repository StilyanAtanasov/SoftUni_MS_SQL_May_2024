CREATE TABLE [Manufacturers] (
    [ManufacturerID] INT NOT NULL,
    [Name]           NVARCHAR(50),
    [EstablishedOn]  DATE
);

CREATE TABLE [Models] (
    [ModelID]        INT NOT NULL,
    [Name]           NVARCHAR(50),
    [ManufacturerID] INT
);

INSERT INTO [Manufacturers] ([ManufacturerID], [Name], [EstablishedOn])
VALUES ( 1, 'BMW', '1916-07-03' ),
       ( 2, 'Tesla', '2003-01-01' ),
       ( 3, 'Lada', '1966-01-05' );

INSERT INTO [Models] ([ModelID], [Name], [ManufacturerID])
VALUES ( 101, 'X1', 1 ),
       ( 102, 'i6', 1 ),
       ( 103, 'Model S', 2 ),
       ( 104, 'Model X', 2 ),
       ( 105, 'Model 3', 2 ),
       ( 106, 'Nova', 3 );


ALTER TABLE [dbo].[Manufacturers]
ADD CONSTRAINT [PK_Manufacturers_ManufacturerID] PRIMARY KEY ([ManufacturerID])

ALTER TABLE [dbo].[Models]
ADD CONSTRAINT [PK_Models_ModelID] PRIMARY KEY ([ModelID])

ALTER TABLE [dbo].[Models]
ADD CONSTRAINT [FK_Models_ManufacturerID] FOREIGN KEY ([ManufacturerID]) REFERENCES [dbo].[Manufacturers]([ManufacturerID])