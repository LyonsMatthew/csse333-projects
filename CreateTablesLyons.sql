CREATE TABLE dbo.House(
	id int PRIMARY KEY CLUSTERED, 
	Address varchar(100), 
	HasCookies bit, 
	HasMilk bit
)

CREATE TABLE dbo.Manufacturer(
	id int PRIMARY KEY CLUSTERED,
	Address varchar(100)
)

CREATE TABLE dbo.Reindeer(
	name varchar(30) PRIMARY KEY CLUSTERED,
	NoseColor varchar(10),
	ThemeSong varchar(50)
)

CREATE TABLE dbo.BlackRock(
	id int PRIMARY KEY CLUSTERED,
	PetName varchar(20),
	RockName varchar(20),
	Family varchar(20),
	DoB datetime
)