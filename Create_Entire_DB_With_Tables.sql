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
	id int,
	PersonName varchar(100),
	DoB date,
	Sex char,

	Primary Key(id)
);

CREATE TABLE [dbo].[Manufacturer](
	id int PRIMARY KEY CLUSTERED,
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
	id int,
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
	id int PRIMARY KEY CLUSTERED, 
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
	id int,
	isSanta bit,
	Name varchar(100),

	Primary Key(id)
);

Create Table [dbo].[Ohoho](
	id int,
	UrlLink varchar(1000),
	Length decimal(3),
	Girth decimal(3),
	Pitch decimal(3),
	Santa int,

	Foreign Key (Santa) References Santa(id),
	Primary Key(id)
);