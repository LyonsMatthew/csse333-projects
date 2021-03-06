--
-- Insert a gift into the gift table
--
-------------------------------------------
-- Demo:
-- DECLARE @Status SMALLINT
-- EXEC @Status =  [insert_gift] 12, 'yeah', 37
-- SELECT Status = @Status
-------------------------------------------
-- Timmy D'Avello
-- January 17, 2019

/****** Object:  StoredProcedure [dbo].[insert_Order Details_1]    Script Date: 1/16/2019 7:58:14 PM ******/
USE ChristmasWorkshop
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[insert_gift]
(@Name_1 [varchar](100),
@ManufacturerID_2 [int])
AS

-- Checks to see if the ManufacturerID is valid
IF (SELECT COUNT(Manufacturer.id) FROM Manufacturer WHERE id = @ManufacturerID_2) = 0
BEGIN
	PRINT 'The manufacturer ' + CONVERT(varchar(30), @ManufacturerID_2) + ' is not valid because it is not in the manufacturer table'
	RETURN 1
END

-- Insert the values into the gift table
INSERT INTO Gift (name, manufacturer)
VALUES (@Name_1, @ManufacturerID_2)

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
