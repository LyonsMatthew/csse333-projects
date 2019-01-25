CREATE PROCEDURE [dbo].MakeKidNaughty
(@KidID_1 [int])
AS

-- Checks to see if the KidID is valid
IF (SELECT COUNT(Kid.id) FROM Kid WHERE id = @KidID_1) = 0
BEGIN
	PRINT 'The kid ' + CONVERT(varchar(30), @KidID_1) + ' is not valid because it is not in the kid table'
	RETURN 1
END

--Mark the kid as being naughty
UPDATE Kid
SET isNice = 0
WHERE id = @KidID_1