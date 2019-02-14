CREATE DATABASE [ChristmasWorkshop]
ON
( NAME = [ChristmasWorkshop],
  FILENAME = 'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop.mdf',
  SIZE = 10MB,
  MAXSIZE = 420MB,
  FILEGROWTH = 6% )
LOG ON
( NAME = [ChristmasWorkshop_log],
  FILENAME = 'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop_log.ldf',
  SIZE = 5MB,
  MAXSIZE = 69MB,
  FILEGROWTH = 9% ) ;
GO

USE ChristmasWorkshop
GO

Create Table [dbo].[Person](
	id int IDENTITY(1,1),
	PersonName varchar(100),
	DoB date,
	Sex char,
	
	Primary Key(id)
);

CREATE TABLE [dbo].[Manufacturer](
	id int IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	Address varchar(100)
);

Create Table [dbo].[Elf](
	id int,
	Wage money,
	Height decimal(3),
	EarLength decimal(3),
	WorksIn int,

	Foreign Key(id) References Person(id),
	Foreign Key(WorksIn) References Manufacturer(id),
	Primary Key(id)
);

CREATE TABLE [dbo].[Gift](
	id int IDENTITY(1,1),
	Name varchar(100),
	Manufacturer int,

	PRIMARY KEY (id),
	FOREIGN KEY (manufacturer) REFERENCES Manufacturer(id)
);

CREATE TABLE [dbo].[BlackRock](
	id int PRIMARY KEY CLUSTERED,
	PetName varchar(100),
	RockName varchar(20),
	Family varchar(20),
	DoB datetime,

	FOREIGN KEY (id) REFERENCES Gift(id)
);

CREATE TABLE [dbo].[Reindeer](
	Name varchar(100) PRIMARY KEY CLUSTERED,
	NoseColor varchar(100),
	ThemeSong varchar(100),
	FedBy int,

	FOREIGN KEY (FedBy) REFERENCES Elf(id)
);

CREATE TABLE [dbo].[House](
	id int IDENTITY(1,1) PRIMARY KEY CLUSTERED, 
	Address varchar(100), 
	HasCookies bit, 
	HasMilk bit
);

CREATE TABLE [dbo].[Kid](
	id int,
	isNice bit,
	House int,

	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES Person(id),
	FOREIGN KEY (house) REFERENCES House(id)
);

CREATE TABLE [dbo].[Receives](
	KidID int,
	GiftID int,

	PRIMARY KEY (kidID, giftID),
	FOREIGN KEY (kidID) REFERENCES Kid(id),
	FOREIGN KEY (giftID) REFERENCES Gift(id)
);

CREATE TABLE [dbo].[Wants](
	KidID int,
	GiftID int,

	PRIMARY KEY (kidID, giftID),
	FOREIGN KEY (kidID) REFERENCES Kid(id),
	FOREIGN KEY (giftID) REFERENCES Gift(id)
);

Create Table [dbo].[Santa](
	id int IDENTITY(1,1),
	isSanta bit,
	Name varchar(100),

	Primary Key(id)
);

Create Table [dbo].[Ohoho](
	id int IDENTITY(1,1),
	UrlLink varchar(1000),
	Length decimal(3),
	Girth decimal(3),
	Pitch decimal(3),
	Santa int,

	Primary Key(id),
	Foreign Key (Santa) References Santa(id)
);
GO

CREATE PROCEDURE [dbo].[insert_blackrock]
(@petName [varchar](100),
@dob [date],
@manfID [int])
AS

-- Checks to ensure primary key constraint holds true
IF (SELECT COUNT(*) FROM Manufacturer WHERE id = @manfID) <= 0
BEGIN
	PRINT 'The manufacturer with ID ' + CONVERT(varchar(30), @manfID) + ' does not exist in the Manufacturer table'
	RETURN 1
END

-- Insert the values into the blackrock and gift table
EXEC dbo.insert_gift 'Black Rock', @manfID;


INSERT INTO BlackRock(id, PetName, RockName, Family, DoB)
VALUES (@@IDENTITY, @petName, 'Coal', 'Sedimentary', @dob)

-- Return 0 if the procedure is successful, otherwise an errorcode with a message
RETURN 0
GO
CREATE Procedure [dbo].[insert_Elf]
(@newPersonName varchar(100),
@newDOB varchar(100),
@newSex varchar(5),
@Wage_2 money = NULL,
@Height_3 decimal(18,3) = NULL,
@Earlength_4 decimal(18,3) = NULL,
@WorksIn_5 int)
AS
if (@Height_3 <= 0 OR @Earlength_4 <= 0 OR @Wage_2 < 0)
BEGIN
	Print 'Value negative'
	RETURN 3
END

if (SELECT COUNT(id) FROM Manufacturer WHERE id = @WorksIn_5) = 0
BEGIN
	PRINT 'Manufacturer id does not exist'
	RETURN 1
END
if(@newDOB > GETDATE())
begin
	print N'Date invalid'
	return 4
end
if (@newSex != 'M') AND (@newSex != 'F')
begin
	print N'Gender Invalid'
	return 5
end

insert into [Person] (PersonName, DoB, Sex)
values(@newPersonName, @newDOB, @newSex)

INSERT INTO [Elf] (id, Wage, Height, EarLength, WorksIn)
VALUES (@@IDENTITY, @Wage_2, @Height_3, @Earlength_4, @WorksIn_5)

RETURN 0
GO
CREATE PROCEDURE [dbo].[insert_gift]
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

CREATE Procedure [dbo].[insert_House]
(@newAddress varchar(100),
@newHasCookies int,
@newHasMilk int
)

AS

if(@newHasCookies >1 or @newHasCookies <0)
begin
	print N'Invalid bit to cookie'
	return 1
end

if(@newHasMilk >1 or @newHasMilk <0)
begin
	print N'Invalid bit to milk'
	return 2
end

insert into [House] ([Address], [HasCookies], [HasMilk])
values(@newAddress, @newHasCookies, @newHasMilk)

return 0
GO
CREATE Procedure [dbo].[insert_Kid]
(@newPersonName varchar(100),
@newDOB date,
@newSex varchar(5),
@NewIsNiceID_2 int,
@House int)
AS

if(@NewIsNiceID_2 >1)
begin
	print N'Nice Or Naughty value invalid'
	return 2
end

if(@House < 0 )
begin
	print N'House ID Invalid'
	return 3
end
IF (SELECT COUNT(*) FROM House WHERE id = @House) = 0
BEGIN
	PRINT 'The house ' + CONVERT(varchar(30), @House) + ' is not valid because it is not in the house table'
	RETURN 3
END
if(@newDOB > GETDATE())
begin
	print N'Date invalid'
	return 4
end

if (@newSex != 'M') AND (@newSex != 'F')
begin
	print N'Gender Invalid'
	return 5
end

insert into [Person] (PersonName, DoB, Sex)
values(@newPersonName, @newDOB, @newSex)

insert into [Kid] ([id], [isNice], [house] )
values(@@IDENTITY, @NewIsNiceID_2, @House)

RETURN 0
GO
CREATE PROCEDURE [dbo].[insert_manufacturer]
(@ManfAddress_1 varchar(100))
AS

--Insert the manufacturer with the given address
INSERT INTO Manufacturer(address)
VALUEs (@ManfAddress_1)
GO
CREATE Procedure [dbo].[insert_Ohoho]
(@NewUrlLink varchar(1000),
@NewLength decimal(18,3),
@NewGirth decimal(18,3),
@NewPitch decimal(18,3),
@SantaID int
)
AS

if(@NewGirth <0 OR @NewLength < 0 OR @NewPitch < 0)
begin
	print N'Girth/Length/Pitch value can not be negative'
	return 1
end


if (Substring(@NewUrlLink, 1, 24) != 'https://www.youtube.com/' AND Substring(@NewURLLink,1,16) != 'www.youtube.com/')
begin
	print N'bad url'
	return 2
end

insert into Ohoho ([UrlLink], [Length], [Girth], [Pitch], [Santa])
values(@NewUrlLink, @NewLength, @NewGirth,@NewPitch,@SantaID)
return 0
GO
CREATE PROCEDURE [dbo].[insert_receives]
(@Kid_1 [int],
@Gift_2 [int])
AS

-- Checks to see if the KidID is valid
IF (SELECT COUNT(*) FROM Kid WHERE id = @Kid_1) <= 0
BEGIN
	PRINT 'The kid with ID ' + CONVERT(varchar(30), @Kid_1) + ' is not valid because it does not exist in the Kid table'
	RETURN 1
END

-- Checks to see if the GiftID is valid
IF (SELECT COUNT(*) FROM Gift WHERE id = @Gift_2) <= 0
BEGIN
	PRINT 'The gift with ID ' + CONVERT(varchar(30), @Gift_2) + ' is not valid because it does not exist in the Gift table'
	RETURN 2
END

-- Checks to ensure primary key constraint holds true
IF (SELECT COUNT(Receives.KidID) FROM Receives WHERE KidID = @Kid_1 AND GiftID = @Gift_2) > 0
BEGIN
	PRINT 'The kid with ID ' + CONVERT(varchar(30), @Kid_1) + ' already wants the gift with id ' + CONVERT(varchar(30), @Gift_2)
	RETURN 3
END

-- Insert the values into the gift table
INSERT INTO Receives(KidID, GiftID)
VALUES (@Kid_1, @Gift_2)

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
GO
CREATE Procedure [dbo].[insert_Reindeer]
(@Name_1 [varchar](100),
@NoseColor_2 [varchar](100) = NULL,
@ThemeSong_3 [varchar](100) = NULL,
@FedBy_4 [int])
AS

if (SELECT COUNT(id) FROM Elf WHERE id = @FedBy_4) = 0
BEGIN
	PRINT 'The elf id is not in the elf table'
	RETURN 1
END

INSERT INTO Reindeer (Name, NoseColor, ThemeSong, FedBy)
VALUES (@Name_1, @NoseColor_2, @ThemeSong_3, @FedBy_4)

RETURN 0
GO
CREATE Procedure [dbo].[insert_Santa]
(@NewIsSanta int,
@NewName varchar(100)
)
AS

if(@NewIsSanta >1 or @NewIsSanta < 0)
begin
	print N'Is Santa value invalid'
	return 2
end

insert into Santa ([isSanta], [Name])
values(@NewIsSanta, @NewName)
return 0
GO
CREATE PROCEDURE [dbo].[insert_wants]
(@Kid_1 [int],
@Gift_2 [int])
AS

-- Checks to see if the KidID is valid
IF (SELECT COUNT(*) FROM Kid WHERE id = @Kid_1) <= 0
BEGIN
	PRINT 'The kid with ID ' + CONVERT(varchar(30), @Kid_1) + ' is not valid because it does not exist in the Kid table'
	RETURN 1
END

-- Checks to see if the GiftID is valid
IF (SELECT COUNT(*) FROM Gift WHERE id = @Gift_2) <= 0
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
CREATE procedure [dbo].[remove_blackrock]
(@blackrockID_1 int)
AS


IF (SELECT COUNT(BlackRock.id) FROM BlackRock WHERE id = @blackrockID_1) = 0 OR (Select Count(Gift.id) From Gift Where id = @blackrockID_1) = 0
BEGIN
	PRINT 'The black rock ' + CONVERT(varchar(30), @blackrockID_1) + ' is not valid because it is not in the black rock table'
	RETURN 1
END

DELETE FROM BlackRock
WHERE id = @blackrockID_1

Delete From Gift
Where id = @blackrockID_1
GO
CREATE PROCEDURE [dbo].[remove_elf]
(@ElfID_1 [int])
AS

-- Checks to see if the ElfID is valid
IF (SELECT COUNT(Elf.id) FROM Elf WHERE id = @ElfID_1) = 0
BEGIN
	PRINT 'The elf ' + CONVERT(varchar(30), @ElfID_1) + ' is not valid because it is not in the elf table'
	RETURN 1
END

-- Remove the row from the Elf table
DELETE FROM Elf
WHERE id = @ElfID_1

DELETE FROM Person
WHERE id = @ElfID_1

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
GO
CREATE PROCEDURE [dbo].[remove_gift]
(@GiftID_1 [int])
AS

-- Checks to see if the ManufacturerID is valid

IF (SELECT COUNT(Gift.id) FROM Gift WHERE id = @GiftID_1) = 0
BEGIN
	PRINT 'The gift ' + CONVERT(varchar(30), @GiftID_1) + ' is not valid because it is not in the gift table'
	RETURN 1
END

-- Remove the row from the gift table
DELETE FROM Gift
WHERE id = @GiftID_1

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
GO
CREATE procedure [dbo].[remove_house]
(@houseID_1 int)
AS


IF (SELECT COUNT(House.id) FROM House WHERE id = @houseID_1) = 0
BEGIN
	PRINT 'The house ' + CONVERT(varchar(30), @houseID_1) + ' is not valid because it is not in the house table'
	RETURN 1
END

DELETE FROM House
WHERE id = @houseID_1
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
GO
CREATE PROCEDURE [dbo].[remove_Manufacturer]
(@ManufacturerID_1 [int])
AS

-- Checks to see if the ManufacturerID is valid
IF (SELECT COUNT(Manufacturer.id) FROM Manufacturer WHERE id = @ManufacturerID_1) = 0
BEGIN
	PRINT 'The manufacturer ' + CONVERT(varchar(30), @ManufacturerID_1) + ' is not valid because it is not in the manufacturer table'
	RETURN 1
END


-- Remove the row from the Manufacturer table
DELETE FROM Manufacturer
WHERE Manufacturer.id = @ManufacturerID_1

-- Return 0 if the procedure is successful, otherwise and errorcode with a 
RETURN 0
GO
CREATE PROCEDURE [dbo].[remove_Ohoho]
(@OhohoID_1 [int],
@SantaID_2 [int])
AS

if(Select Count(Ohoho.id) From Ohoho Where @OhohoID_1 = Ohoho.id) = 0
begin
	print N'Ohoho ID' + CAST(@OhohoID_1 as varchar(100)) + N'does not exist'
	return 1
end


if(Select Count(Santa.id) From Santa Where @SantaID_2 = Santa.id) = 0
begin
	print N'Santa ID' + Cast(@SantaID_2 as varchar(100))+ N'does not exist'
	return 2
end

Delete From Ohoho
Where Ohoho.Santa =@SantaID_2 AND Ohoho.id = @OhohoID_1

return 0
GO
CREATE Procedure [dbo].[remove_Person]
(@PersonID_1 [int])
AS

-- Checks to see if the PersonID is valid
IF (SELECT COUNT(Person.id) FROM Person WHERE id = @PersonID_1) = 0
BEGIN
	PRINT 'The person ' + CONVERT(varchar(30), @PersonID_1) + ' is not valid because it is not in the person table'
	RETURN 1
END

DELETE FROM Person
WHERE id = @PersonID_1

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
GO
CREATE procedure [dbo].[remove_receives]
(@kidID_1 int,
@giftID_2 int)
AS


--IF (SELECT COUNT(Kid.id) FROM Kid WHERE id = @kidID_1) = 0 
--BEGIN
--	PRINT 'The kid id ' + CONVERT(varchar(30), @giftID_1) + ' is not valid because it is not in the kid table'
--	RETURN 1
--END

--IF (SELECT COUNT(Gift.id) FROM Gift WHERE id = @giftID_2) = 0 
--BEGIN
--	PRINT 'The gift id ' + CONVERT(varchar(30), @giftID_2) + ' is not valid because it is not in the gift table'
--	RETURN 2
--END

IF (SELECT COUNT(Receives.KidID) FROM Receives WHERE Receives.GiftID = @giftID_2 and Receives.KidID = @kidID_1) = 0 
BEGIN
	PRINT 'The requested receive deletion combination is not valid because it is not in the receives table'
	RETURN 1
END


Delete From Receives
Where Receives.GiftID = @giftID_2 and Receives.KidID = @kidID_1
GO
CREATE PROCEDURE [dbo].[remove_reindeer]
(@Name_1 [int])
AS

-- Checks to see if the Reindeer Name is valid
IF (SELECT COUNT(Name) FROM Reindeer WHERE Name = @Name_1) = 0
BEGIN
	PRINT 'The reindeer ' + CONVERT(varchar(30), @Name_1) + ' is not valid because it is not in the reindeer table'
	RETURN 1
END

-- Remove the row from the gift table
DELETE FROM Reindeer
WHERE Name = @Name_1

-- Return 0 if the procedure is successful, otherwise and errorcode with a message
RETURN 0
GO
CREATE PROCEDURE [dbo].[remove_Santa]
(@SantaID_1 [int])
AS

if(Select Count(Santa.id) From Santa Where @SantaID_1 = Santa.id) = 0
begin
	print N'Santa ID ' + CAST(@SantaID_1 as varchar(1000)) + N' does not exist'
	return 1
end

Delete From Santa
Where Santa.id =@SantaID_1

return 0
GO
CREATE procedure [dbo].[remove_wants]
(@kidID_1 int,
@giftID_2 int)
AS

IF (SELECT COUNT(Wants.KidID) FROM Wants WHERE Wants.GiftID = @giftID_2 and Wants.KidID = @kidID_1) = 0 
BEGIN
	PRINT 'The requested wants deletion combination is not valid because it is not in the receives table'
	RETURN 1
END


Delete From Wants
Where Wants.GiftID = @giftID_2 and Wants.KidID = @kidID_1
GO
CREATE PROCEDURE [dbo].[select_blackrock]
AS
SELECT * FROM [dbo].BlackRock
GO
CREATE PROCEDURE [dbo].[select_elf]
AS
SELECT * FROM [dbo].Elf
GO
CREATE PROCEDURE [dbo].[select_gift]
AS
SELECT * FROM [dbo].Gift
GO
CREATE PROCEDURE [dbo].[select_house]
AS
SELECT * FROM [dbo].House
GO
CREATE PROCEDURE [dbo].[select_kid]
AS
SELECT * FROM [dbo].Kid
GO
CREATE PROCEDURE [dbo].[select_manufacturer]
AS
SELECT * FROM [dbo].Manufacturer
GO
CREATE PROCEDURE [dbo].[select_ohoho]
AS
SELECT * FROM [dbo].Ohoho
GO
CREATE PROCEDURE [dbo].[select_person]
AS
SELECT * FROM [dbo].Person
GO
CREATE PROCEDURE [dbo].[select_receives]
AS
SELECT * FROM [dbo].Receives
GO
CREATE PROCEDURE [dbo].[select_reindeer]
AS
SELECT * FROM [dbo].Reindeer
GO
CREATE PROCEDURE [dbo].[select_santa]
AS
SELECT * FROM [dbo].Santa
GO
CREATE PROCEDURE [dbo].[select_wants]
AS
SELECT * FROM [dbo].Wants
GO
