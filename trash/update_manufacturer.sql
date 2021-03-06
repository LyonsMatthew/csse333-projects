USE [ChristmasWorkshop]
GO
/****** Object:  StoredProcedure [dbo].[update_manufacturer]    Script Date: 2019/02/01 2:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[update_manufacturer]
(@ManufacturerID_1 [int],
@Address_2 varchar(100))
AS

-- Checks to see if the ManufacturerID is valid
IF (SELECT COUNT(Manufacturer.id) FROM Manufacturer WHERE id = @ManufacturerID_1) = 0
BEGIN
	PRINT 'The manufacturer ' + CONVERT(varchar(30), @ManufacturerID_1) + ' is not valid because it is not in the manufacturer table'
	RETURN 1
END

UPDATE Manufacturer
SET Address = @Address_2
WHERE id = @ManufacturerID_1
RETURN 0