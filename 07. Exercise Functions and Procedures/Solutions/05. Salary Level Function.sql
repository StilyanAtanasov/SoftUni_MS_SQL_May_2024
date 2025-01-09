USE [SoftUni]
GO

CREATE FUNCTION [ufn_GetSalaryLevel] (@Salary DECIMAL(18,4)) 
RETURNS VARCHAR(10) AS
BEGIN
    IF (@Salary < 30000) RETURN 'Low'
 
    ELSE IF (@Salary <= 50000) RETURN 'Average'

    RETURN 'High'
END