USE [SoftUni]
GO

CREATE FUNCTION [ufn_IsWordComprised] (@SetOfLetters NVARCHAR(500), @Word NVARCHAR(250))
RETURNS BIT 
BEGIN
    DECLARE @Counter SMALLINT = 1
        WHILE @Counter <= LEN(@Word)
	    BEGIN
		IF (CHARINDEX(SUBSTRING(@Word, @Counter, 1), @SetOfLetters) > 0) SET @Counter += 1
		ELSE RETURN 0
	    END

    RETURN 1
END