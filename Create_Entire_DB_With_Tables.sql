--DROP DATABASE [ChristmasWorkshop]

--CREATE DATABASE [ChristmasWorkshop]
--ON
--( NAME = [ChristmasWorkshop],
--  FILENAME = 'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop.mdf',
--  SIZE = 10MB,
--  MAXSIZE = 420MB,
--  FILEGROWTH = 6% )
--LOG ON
--( NAME = [ChristmasWorkshop_log],
--  FILENAME = 'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop_log.ldf',
--  SIZE = 5MB,
--  MAXSIZE = 69MB,
--  FILEGROWTH = 9% ) ;
--GO

USE ChristmasWorkshop
GO

Create Table [dbo].[Person](
	id int IDENTITY(1,1),
	PersonName varchar(100),
	DoB date CHECK(DoB >= '1753-1-1' AND DoB <= getDate()),
	Sex char CHECK(Sex = 'M' OR Sex = 'F'),
	
	Primary Key(id)
);

CREATE TABLE [dbo].[Manufacturer](
	id int IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	Address varchar(100)
);

Create Table [dbo].[Elf](
	id int,
	Wage money CHECK(Wage >= 0),
	Height decimal(3) CHECK(Height > 0),
	EarLength decimal(3) CHECK(EarLength > 0),
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
	DoB datetime CHECK(DoB >= '1753-1-1' AND DoB <= getDate()),

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
	Length decimal(3) CHECK(Length > 0),
	Girth decimal(3) CHECK(Girth > 0),
	Pitch decimal(3),
	Santa int,

	Primary Key(id),
	Foreign Key (Santa) References Santa(id)
);