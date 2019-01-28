-- Used to insert that a given kid wants a given gift

USE [ChristmasWorkshop]
GO
/****** Object:  StoredProcedure [dbo].[insert_wants]    Script Date: 1/24/2019 10:46:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insert_wants]
(@Kid_1 [int],
@Gift_2 [int])
AS

-- Checks to see if the KidID is valid
IF (SELECT COUNT(Wants.KidID) FROM Wants WHERE KidID = @Kid_1) <= 0
BEGIN
	PRINT 'The kid with ID ' + CONVERT(varchar(30), @Kid_1) + ' is not valid because it does not exist in the Kid table'
	RETURN 1
END

-- Checks to see if the GiftID is valid
IF (SELECT COUNT(Wants.GiftID) FROM Wants WHERE GiftID = @Gift_2) <= 0
BEGIN
	PRINT 'The gift with ID ' + CONVERT(varchar(30), @Gift_2) + ' is not valid because it does not exist in the Gift table'
	RETURN 2
END

-- Checks to ensure primary key constraint holds true
IF (SELECT COUNT(Wants.KidID) FROM Wants WHERE KidID = @Kid_1 AND GiftID = @Gift_2) > 0
BEGIN
	PRINT 'The kid with ID ' + CONVERT(varchar(30), @Kid_1) + ' already wants the gift with id ' + CONVERT(varchar(30), @Gift_2)
	RETURN 3
END

-- Insert the values into the gift table
INSERT INTO Wants(KidID, GiftID)
VALUES (@Kid_1, @Gift_2)

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0