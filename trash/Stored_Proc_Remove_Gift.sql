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

CREATE PROCEDURE [dbo].[remove_gift]
(@GiftID_1 [int],
@ManufacturerID_3 [int])
AS

-- Checks to see if the ManufacturerID is valid
IF (SELECT COUNT(Manufacturer.id) FROM Manufacturer WHERE id = @ManufacturerID_3) = 0
BEGIN
	PRINT 'The manufacturer ' + CONVERT(varchar(30), @ManufacturerID_3) + ' is not valid because it is not in the manufacturer table'
	RETURN 1
END
-- Checks to see if the GiftID is valid
IF (SELECT COUNT(Gift.id) FROM Gift WHERE id = @GiftID_1) = 0
BEGIN
	PRINT 'The gift ' + CONVERT(varchar(30), @GiftID_1) + ' is not valid because it is not in the gift table'
	RETURN 1
END

-- Remove the row from the gift table
DELETE FROM Gift
WHERE id = @GiftID_1 AND manufacturer = @ManufacturerID_3

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
