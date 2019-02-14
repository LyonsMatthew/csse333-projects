--
-- Remove a gift from the gift table
--
-------------------------------------------
-- Demo:
-- DECLARE @Status SMALLINT
-- EXEC @Status =  [remove_gift] 12, 'yeah', 37
-- SELECT Status = @Status
-------------------------------------------
-- Matthew Lyons
-- January 18, 2019

USE ChristmasWorkshop
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[remove_kid]
(@KidID_1 [int])
AS

-- Checks to see if the KidID is valid
IF (SELECT COUNT(Kid.id) FROM Kid WHERE id = @KidID_1) = 0
BEGIN
	PRINT 'The kid ' + CONVERT(varchar(30), @KidID_1) + ' is not valid because it is not in the kid table'
	RETURN 1
END

-- Remove the row from the gift table
DELETE FROM Kid
WHERE id = @KidID_1

DELETE FROM Person
WHERE id = @KidID_1

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
