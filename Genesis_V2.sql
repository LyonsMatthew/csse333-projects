USE [master]
GO
/****** Object:  Database [ChristmasWorkshop]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE DATABASE [ChristmasWorkshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChristmasWorkshop', FILENAME = N'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop.mdf' , SIZE = 10240KB , MAXSIZE = 430080KB , FILEGROWTH = 6%)
 LOG ON 
( NAME = N'ChristmasWorkshop_log', FILENAME = N'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop_log.ldf' , SIZE = 5120KB , MAXSIZE = 70656KB , FILEGROWTH = 9%)
GO
ALTER DATABASE [ChristmasWorkshop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChristmasWorkshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChristmasWorkshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChristmasWorkshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChristmasWorkshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChristmasWorkshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChristmasWorkshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET RECOVERY FULL 
GO
ALTER DATABASE [ChristmasWorkshop] SET  MULTI_USER 
GO
ALTER DATABASE [ChristmasWorkshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChristmasWorkshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChristmasWorkshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChristmasWorkshop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ChristmasWorkshop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ChristmasWorkshop]
GO
/****** Object:  User [SodaBaseUserdavelltr29]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE USER [SodaBaseUserdavelltr29] FOR LOGIN [SodaBaseUserdavelltr29] WITH DEFAULT_SCHEMA=[SodaBaseUserdavelltr29]
GO
/****** Object:  User [kbo]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE USER [kbo] FOR LOGIN [lyonsmj] WITH DEFAULT_SCHEMA=[kbo]
GO
/****** Object:  User [gbo]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE USER [gbo] FOR LOGIN [nguyenrk] WITH DEFAULT_SCHEMA=[gbo]
GO
/****** Object:  DatabaseRole [FrontEndDude]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE ROLE [FrontEndDude]
GO
ALTER ROLE [FrontEndDude] ADD MEMBER [SodaBaseUserdavelltr29]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SodaBaseUserdavelltr29]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SodaBaseUserdavelltr29]
GO
ALTER ROLE [db_owner] ADD MEMBER [kbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [gbo]
GO
/****** Object:  Table [dbo].[BlackRock]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlackRock](
	[id] [int] NOT NULL,
	[PetName] [varchar](100) NULL,
	[RockName] [varchar](20) NULL,
	[Family] [varchar](20) NULL,
	[DoB] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Elf]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elf](
	[id] [int] NOT NULL,
	[Wage] [money] NULL,
	[Height] [decimal](18, 3) NULL,
	[EarLength] [decimal](18, 3) NULL,
	[WorksIn] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gift]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Manufacturer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](100) NULL,
	[HasCookies] [bit] NULL,
	[HasMilk] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kid]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kid](
	[id] [int] NOT NULL,
	[isNice] [bit] NULL,
	[House] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ohoho]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ohoho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UrlLink] [varchar](1000) NULL,
	[Length] [decimal](18, 3) NULL,
	[Girth] [decimal](18, 3) NULL,
	[Pitch] [decimal](18, 3) NULL,
	[Santa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](100) NULL,
	[DoB] [date] NULL,
	[Sex] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receives]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receives](
	[KidID] [int] NOT NULL,
	[GiftID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KidID] ASC,
	[GiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reindeer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reindeer](
	[Name] [varchar](100) NOT NULL,
	[NoseColor] [varchar](100) NULL,
	[ThemeSong] [varchar](100) NULL,
	[FedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Santa]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Santa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[isSanta] [bit] NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wants]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wants](
	[KidID] [int] NOT NULL,
	[GiftID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KidID] ASC,
	[GiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Kid Receives]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Kid Receives] AS
SELECT Person.PersonName AS Name, k.Name AS Gift
FROM Person JOIN (SELECT KidID, Name
					FROM Kid JOIN (SELECT *
									FROM Receives JOIN Gift
									ON Receives.GiftID = Gift.id) AS g
					ON Kid.id = g.KidID) AS k
ON Person.id = k.KidID
GO
/****** Object:  View [dbo].[Kid Wants]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Kid Wants]
AS
SELECT Person.PersonName AS Name, Gift.Name AS Gift
FROM dbo.Person JOIN dbo.Kid ON Person.id = Kid.id
	JOIN dbo.Wants ON Kid.ID = Wants.KidID
	JOIN dbo.Gift ON Wants.GiftID = Gift.id
GO
/****** Object:  View [dbo].[Kid Needs]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Kid Needs] AS
SELECT *
FROM [Kid Wants]
EXCEPT
SELECT *
FROM [Kid Receives]
GO
/****** Object:  View [dbo].[Kid Join Person]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Kid Join Person]
AS
SELECT Person.PersonName AS Name, 
	Person.DoB AS [Date of Birth], 
	Person.Sex, 
	Kid.isNice AS [Is Nice],
	House.Address AS Address
FROM Person INNER JOIN
	Kid ON Person.id = Kid.id LEFT OUTER JOIN
	House ON Kid.House = House.id
GO
/****** Object:  View [dbo].[Kid Naughty]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Kid Naughty]
AS SELECT Person.PersonName FROM Kid Join Person on Kid.id = Person.id Where Kid.isNice = 0
GO
/****** Object:  View [dbo].[Kid Nice]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Kid Nice]
AS SELECT Person.PersonName FROM Kid Join Person on Kid.id = Person.id Where Kid.isNice = 1
GO
/****** Object:  View [dbo].[Santa Laughs]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Santa Laughs] AS
SELECT Santa.Name AS SantaName, Santa.isSanta AS isSanta, UrlLink, Girth, Length, Pitch
FROM Santa JOIN Ohoho
ON Santa.id = Ohoho.Santa
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [blackrock_name]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE NONCLUSTERED INDEX [blackrock_name] ON [dbo].[BlackRock]
(
	[PetName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [gift_name]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE NONCLUSTERED INDEX [gift_name] ON [dbo].[Gift]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [house_address_index]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE NONCLUSTERED INDEX [house_address_index] ON [dbo].[House]
(
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [manufacturer_address_index]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE NONCLUSTERED INDEX [manufacturer_address_index] ON [dbo].[Manufacturer]
(
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [person_name]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE NONCLUSTERED INDEX [person_name] ON [dbo].[Person]
(
	[PersonName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [santa_name]    Script Date: 2/14/2019 1:52:13 AM ******/
CREATE NONCLUSTERED INDEX [santa_name] ON [dbo].[Santa]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlackRock]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Gift] ([id])
GO
ALTER TABLE [dbo].[Elf]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Elf]  WITH CHECK ADD FOREIGN KEY([WorksIn])
REFERENCES [dbo].[Manufacturer] ([id])
GO
ALTER TABLE [dbo].[Gift]  WITH CHECK ADD FOREIGN KEY([Manufacturer])
REFERENCES [dbo].[Manufacturer] ([id])
GO
ALTER TABLE [dbo].[Kid]  WITH CHECK ADD FOREIGN KEY([House])
REFERENCES [dbo].[House] ([id])
GO
ALTER TABLE [dbo].[Kid]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Ohoho]  WITH CHECK ADD FOREIGN KEY([Santa])
REFERENCES [dbo].[Santa] ([id])
GO
ALTER TABLE [dbo].[Receives]  WITH CHECK ADD FOREIGN KEY([GiftID])
REFERENCES [dbo].[Gift] ([id])
GO
ALTER TABLE [dbo].[Receives]  WITH CHECK ADD FOREIGN KEY([KidID])
REFERENCES [dbo].[Kid] ([id])
GO
ALTER TABLE [dbo].[Reindeer]  WITH CHECK ADD FOREIGN KEY([FedBy])
REFERENCES [dbo].[Elf] ([id])
GO
ALTER TABLE [dbo].[Wants]  WITH CHECK ADD FOREIGN KEY([GiftID])
REFERENCES [dbo].[Gift] ([id])
GO
ALTER TABLE [dbo].[Wants]  WITH CHECK ADD FOREIGN KEY([KidID])
REFERENCES [dbo].[Kid] ([id])
GO
ALTER TABLE [dbo].[BlackRock]  WITH CHECK ADD CHECK  (([DoB]>='1753-1-1' AND [DoB]<=getdate()))
GO
ALTER TABLE [dbo].[Elf]  WITH CHECK ADD CHECK  (([EarLength]>(0)))
GO
ALTER TABLE [dbo].[Elf]  WITH CHECK ADD CHECK  (([Height]>(0)))
GO
ALTER TABLE [dbo].[Elf]  WITH CHECK ADD CHECK  (([Wage]>=(0)))
GO
ALTER TABLE [dbo].[Ohoho]  WITH CHECK ADD CHECK  (([Girth]>(0)))
GO
ALTER TABLE [dbo].[Ohoho]  WITH CHECK ADD CHECK  (([Length]>(0)))
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD CHECK  (([DoB]>='1753-1-1' AND [DoB]<=getdate()))
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD CHECK  (([Sex]='M' OR [Sex]='F'))
GO
/****** Object:  StoredProcedure [dbo].[insert_blackrock]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[insert_Elf]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[insert_gift]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[insert_House]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
/****** Object:  StoredProcedure [dbo].[insert_Kid]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[insert_Kid]
(@newPersonName varchar(100),
@newDOB date,
@newSex varchar(5),
@NewIsNiceID_2 int,
@House int)
AS

if(@NewIsNiceID_2 >1 or @NewIsNiceID_2 < 0)
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
/****** Object:  StoredProcedure [dbo].[insert_manufacturer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_manufacturer]
(@ManfAddress_1 varchar(100))
AS

--Insert the manufacturer with the given address
INSERT INTO Manufacturer(address)
VALUEs (@ManfAddress_1)
GO
/****** Object:  StoredProcedure [dbo].[insert_Ohoho]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[insert_Person]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[insert_Person]
(@newPersonName varchar(100),
@newDOB varchar(100),
@newSex varchar(5)
)

AS


if(@newDOB > GETDATE())
begin
	print N'Date invalid'
	return 2
end

if (@newSex != 'M') AND (@newSex != 'F')
begin
	print N'Gender Invalid'
	return 3
end



insert into [Person] ([personName], [dob], [sex])
values (@newPersonName, @newDOB, @newSex)

return 0

GO
/****** Object:  StoredProcedure [dbo].[insert_receives]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[insert_receives]
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
/****** Object:  StoredProcedure [dbo].[insert_Reindeer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[insert_Santa]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[insert_wants]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[remove_blackrock]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[remove_elf]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[remove_gift]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[remove_house]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[remove_house]
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
/****** Object:  StoredProcedure [dbo].[remove_kid]    Script Date: 2/14/2019 1:52:13 AM ******/
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
GO
/****** Object:  StoredProcedure [dbo].[remove_Manufacturer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[remove_Ohoho]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[remove_Person]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[remove_Person]
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
/****** Object:  StoredProcedure [dbo].[remove_receives]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[remove_reindeer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[remove_Santa]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[remove_wants]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[remove_wants]
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

IF (SELECT COUNT(Wants.KidID) FROM Wants WHERE Wants.GiftID = @giftID_2 and Wants.KidID = @kidID_1) = 0 
BEGIN
	PRINT 'The requested wants deletion combination is not valid because it is not in the receives table'
	RETURN 1
END


Delete From Wants
Where Wants.GiftID = @giftID_2 and Wants.KidID = @kidID_1
GO
/****** Object:  StoredProcedure [dbo].[select_blackrock]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_blackrock]
AS
SELECT * FROM [dbo].BlackRock
GO
/****** Object:  StoredProcedure [dbo].[select_elf]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_elf]
AS
SELECT * FROM [dbo].Elf
GO
/****** Object:  StoredProcedure [dbo].[select_gift]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_gift]
AS
SELECT * FROM [dbo].Gift
GO
/****** Object:  StoredProcedure [dbo].[select_house]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_house]
AS
SELECT * FROM [dbo].House
GO
/****** Object:  StoredProcedure [dbo].[select_kid]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_kid]
AS
SELECT * FROM [dbo].Kid
GO
/****** Object:  StoredProcedure [dbo].[select_manufacturer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_manufacturer]
AS
SELECT * FROM [dbo].Manufacturer
GO
/****** Object:  StoredProcedure [dbo].[select_ohoho]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_ohoho]
AS
SELECT * FROM [dbo].Ohoho
GO
/****** Object:  StoredProcedure [dbo].[select_person]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_person]
AS
SELECT * FROM [dbo].Person
GO
/****** Object:  StoredProcedure [dbo].[select_receives]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_receives]
AS
SELECT * FROM [dbo].Receives
GO
/****** Object:  StoredProcedure [dbo].[select_reindeer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_reindeer]
AS
SELECT * FROM [dbo].Reindeer
GO
/****** Object:  StoredProcedure [dbo].[select_santa]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_santa]
AS
SELECT * FROM [dbo].Santa
GO
/****** Object:  StoredProcedure [dbo].[select_wants]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_wants]
AS
SELECT * FROM [dbo].Wants
GO
/****** Object:  StoredProcedure [dbo].[update_blackrock]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_blackrock]
(@blackrockid_1 [int],
@Name_2 varchar(100) = 'he will never say this name %!#')
AS

if(@Name_2 = 'he will never say this name %!#')
begin
	set @Name_2 = (Select BlackRock.PetName From BlackRock Where @blackrockid_1 = id)
end

IF (SELECT COUNT(*) FROM BlackRock WHERE id = @blackrockid_1) <= 0
BEGIN
	PRINT 'The black rock with ID ' + CONVERT(varchar(30), @blackrockid_1) + ' does not exist in the Black Rock table'
	RETURN 1
END

UPDATE BlackRock
SET [PetName] = @Name_2
WHERE id = @blackrockid_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[update_elf]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_elf]
(@ElfID_1 [int],
@Wage_2 money = -2482851.51)
AS

if(@wage_2 = -2482851.51)
begin
	set @Wage_2= (Select [Wage] From Elf Where @ElfID_1 = id)
end

-- Checks to see if the ID is valid
IF (SELECT COUNT(Elf.id) FROM Elf WHERE id = @ElfID_1) = 0
BEGIN
	PRINT 'The elf ' + CONVERT(varchar(30), @ElfID_1) + ' is not valid because it is not in the elf table'
	RETURN 1
END

UPDATE Elf
SET Wage = @Wage_2
WHERE id = @ElfID_1
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[update_gift]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_gift]
(@GiftID_1 [int],
@Name_2 varchar(100) = 'you shall not access these %@(%66')
AS
if(@Name_2 = 'you shall not access these %@(%66')
begin
	set @Name_2= (Select [Name] From Gift Where @GiftID_1 = id)
end
-- Checks to see if the ID is valid
IF (SELECT COUNT(Gift.id) FROM Gift WHERE id = @GiftID_1) = 0
BEGIN
	PRINT 'The gift ' + CONVERT(varchar(30), @GiftID_1) + ' is not valid because it is not in the gift table'
	RETURN 1
END

UPDATE Gift
SET Name = @Name_2
WHERE id = @GiftID_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[update_house]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[update_house]
(@houseID_1 [int],
@Address_2 varchar(100) = 'This is not an address plz dont come here 41351',
@hascookies_3 bit = null,
@hasmilk_4 bit = null
)
AS



if(@Address_2= 'This is not an address plz dont come here 41351')
begin
	set @Address_2= (Select [Address] From House Where @HouseID_1 = id)
end

if(@hascookies_3= null)
begin
	set @hascookies_3= (Select [HasCookies] From House Where @HouseID_1 = id)
end

if(@hasmilk_4= null)
begin
	set @hasmilk_4= (Select [HasMilk] From House Where @HouseID_1 = id)
end

-- Checks to see if the ID is valid


if (Select count(*) From House where House.id = @Houseid_1) = 0
begin
	PRINT 'The house ' + CONVERT(varchar(30), @houseID_1) + ' is not valid because it is not in the House table'
	RETURN 1
end

if(@hascookies_3 >1 or @hascookies_3 < 0)
begin
	Print 'The cookie value is invalid'
	Return 2
end

if(@hasmilk_4 >1 or @hasmilk_4 < 0)
begin
	Print 'The milk value is invalid'
	Return 3
end




Update House
Set [Address] = @Address_2, [HasCookies] = @hascookies_3, [HasMilk] = @hasmilk_4
Where id = @houseID_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[update_kid]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_kid]
(@kidID_1 [int],
@House_2 int = -4151943,
@personName_3 varchar(100) = 'you shall not access these $%@%@',
@Sex_4 char(5) = '1%3&g',
@isNice_5 bit = null
)
AS

if(@House_2= -4151943)
begin
	set @House_2= (Select [House] From kid Where @kidID_1 = id)
end

if(@personName_3= 'you shall not access these $%@%@')
begin
	set @personName_3= (Select [PersonName] From Person Where @kidID_1 = id)
end

if(@Sex_4= '1%3&g')
begin
	set @Sex_4= (Select [Sex] From Person Where @kidID_1 = id)
end
if(@isNice_5= null)
begin
	set @isNice_5= (Select [isNice] From Kid Where @kidID_1 = id)
end

-- Checks to see if the ID is valid
IF (SELECT COUNT(*) FROM Kid WHERE id = @kidID_1) = 0
BEGIN
	PRINT 'The kid ' + CONVERT(varchar(30), @kidID_1) + ' is not valid because it is not in the Kid table'
	RETURN 1
END

if (Select count(*) From House where House.id = @House_2) = 0
begin
	PRINT 'The house ' + CONVERT(varchar(30), @house_2) + ' is not valid because it is not in the House table'
	RETURN 2
end

if(@isNice_5 >1 or @isNice_5 < 0)
begin
	Print 'The nice value is invalid'
	Return 3
end

if (@Sex_4 != 'M') AND (@Sex_4 != 'F')
begin
	print N'Gender Invalid'
	return 4
end

UPDATE Person
SET [PersonName] = @personName_3, Sex = @Sex_4
WHERE id = @kidID_1

Update Kid
Set [House] = @House_2, [isNice] = @isNice_5
Where id = @kidID_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[update_manufacturer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_manufacturer]
(@ManufacturerID_1 [int],
@Address_2 varchar(100) = 'Don not com meth her e ^@ 4g ^fs#3y3 nRGWR')
AS
if(@Address_2 = 'Don not com meth her e ^@ 4g ^fs#3y3 nRGWR')
begin
	set @Address_2 = (Select [Address] From Manufacturer Where @ManufacturerID_1 = id)
end
-- Checks to see if the ManufacturerID is valid
IF (SELECT COUNT(Manufacturer.id) FROM Manufacturer WHERE id = @ManufacturerID_1) = 0
BEGIN
	PRINT 'The manufacturer ' + CONVERT(varchar(30), @ManufacturerID_1) + ' is not valid because it is not in the manufacturer table'
	RETURN 1
END

UPDATE Manufacturer
SET [Address] = @Address_2
WHERE id = @ManufacturerID_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[update_Ohoho]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[update_Ohoho]
(@OhohoID_1 int,
@NewUrlLink_2 varchar(1000) = 'fakeURL',
@NewLength_3 decimal(18,3) = -2,
@NewGirth_4 decimal(18,3) = -2,
@NewPitch_5 decimal(18,3) = -2,
@SantaID int = -2
)

AS
if(@NewUrlLink_2 = 'fakeURL')
begin
	set @NewUrlLink_2 = (Select UrlLink From Ohoho Where @OhohoID_1 = id)
end

if(@NewLength_3 = -2)
begin
	set @NewLength_3 = (Select [Length] From Ohoho Where @OhohoID_1 = id)
end

if(@NewGirth_4 = -2)
begin
	set @NewGirth_4 = (Select Girth From Ohoho Where @OhohoID_1 = id)
end

if(@NewPitch_5 = -2)
begin
	set @NewPitch_5 = (Select Pitch From Ohoho Where @OhohoID_1 = id)
end

if(@SantaID = -2)
begin
	set @SantaID = (Select Santa From Ohoho Where @OhohoID_1 = id)
end

if(Select Count(Ohoho.id) From Ohoho Where @OhohoID_1 = Ohoho.id) = 0
begin
	print N'Ohoho ID' + @OhohoID_1 + N'does not exist'
	return 1
end


if(Select Count(Santa.id) From Santa Where @SantaID = Santa.id) = 0
begin
	print N'Santa ID' + @SantaID + N'does not exist'
	return 2
end

if (Substring(@NewUrlLink_2, 1, 24) != 'https://www.youtube.com/' AND Substring(@NewUrlLink_2,1,16) != 'www.youtube.com/')
begin
	print N'bad url'
	return 3
end

if(@NewGirth_4 <0 OR @NewLength_3 < 0 OR @NewPitch_5 < 0)
begin
	print N'Girth/Length/Pitch value can not be negative'
	return 4
end

Update Ohoho
Set UrlLink = @NewUrlLink_2, [Length] = @NewLength_3, Girth = @NewGirth_4, Pitch = @NewPitch_5, Santa = @SantaID
Where @OhohoID_1 = id

return 0
GO
/****** Object:  StoredProcedure [dbo].[update_reindeer]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_reindeer]
(@Name_1 [varchar](100),
@NoseColor_2 [varchar](100) = NULL,
@ThemeSong_3 [varchar](100) = NULL,
@FedBy_4 [int] = NULL)
AS

IF (SELECT COUNT(Name) FROM Reindeer WHERE Name = @Name_1) = 0
BEGIN
	PRINT 'The reindeer ' + @Name_1 + ' does not exist'
	RETURN 1
END

IF (@FedBy_4 IS NOT NULL) AND ((SELECT COUNT(id) FROM Elf WHERE id = @FedBy_4) = 0)
BEGIN
	PRINT 'The elf id ' + CONVERT(varchar(30), @FedBy_4) + ' is not in the elf table'
	RETURN 2
END

IF (@NoseColor_2 IS NOT NULL)
BEGIN
	UPDATE Reindeer
	SET NoseColor = @NoseColor_2
	WHERE Name = @Name_1
END

IF (@ThemeSong_3 IS NOT NULL)
BEGIN
	UPDATE Reindeer
	SET ThemeSong = @ThemeSong_3
	WHERE Name = @Name_1
END

IF (@FedBy_4 IS NOT NULL)
BEGIN
	UPDATE Reindeer
	SET FedBy = @FedBy_4
	WHERE Name = @Name_1
END

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[update_Santa]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[update_Santa]
(@SantaID_1 int,
@NewIsSanta_2 int = -29391304,
@NewName varchar(100) = 'beiroberjgie'
)

AS

if(@NewIsSanta_2 = -29391304)
begin
	set @NewIsSanta_2 = (Select Santa.isSanta From Santa where @SantaID_1 = Santa.id)
end
if(@NewName = 'beiroberjgie')
begin
	set @NewName = (Select [Name] From Santa where @NewName= [Name])
end
if(Select Count(Santa.id) From Santa Where @SantaID_1 = Santa.id) = 0
begin
	print N'Santa ID' + @SantaID_1 + N'does not exist'
	return 1
end

if(@NewIsSanta_2 >1 OR @NewIsSanta_2 < 0)
begin
	print N'IsSanta value invalid'
	return 2
end

Update Santa
Set isSanta = @NewIsSanta_2, [Name] = @NewName 
Where id = @SantaID_1

return 0
GO
/****** Object:  StoredProcedure [dbo].[view_kid_needs]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[view_kid_needs]
(@KidName_1 varchar(100))
AS

IF (@KidName_1 = '')
BEGIN
	SELECT * 
	FROM [dbo].[Kid Needs]
	RETURN 0
END

SELECT *
FROM [dbo].[Kid Needs]
WHERE [Kid Needs].Name = @KidName_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[view_kid_receives]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[view_kid_receives]
(@KidName_1 varchar(100))
AS

IF (@KidName_1 = '')
BEGIN
	SELECT * 
	FROM [dbo].[Kid Receives]
	RETURN 0
END

SELECT *
FROM [dbo].[Kid Receives]
WHERE [Kid Receives].Name = @KidName_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[view_kid_wants]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[view_kid_wants]
(@KidName_1 varchar(100))
AS

IF (@KidName_1 = '')
BEGIN
	SELECT * 
	FROM [dbo].[Kid Wants]
	RETURN 0
END

SELECT *
FROM [dbo].[Kid Wants]
WHERE [Kid Wants].Name = @KidName_1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[view_kids]    Script Date: 2/14/2019 1:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[view_kids]
AS
SELECT * 
FROM [dbo].[Kid Join Person]
ORDER BY Address
RETURN 0
GO
USE [master]
GO
ALTER DATABASE [ChristmasWorkshop] SET  READ_WRITE 
GO
