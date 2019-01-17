USE ChristmasWorkshop
GO

CREATE TABLE dbo.Kid (
	id int,
	isNice bit,
	house int,

	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES Person(id),
	FOREIGN KEY (house) REFERENCES House(id)
)

CREATE TABLE dbo.Gift (
	id int,
	name varchar(20),
	manufacturer int,

	PRIMARY KEY (id),
	FOREIGN KEY (manufacturer) REFERENCES Manufacturer(id)
)

CREATE TABLE dbo.Wants (
	kidID int,
	giftID int,

	PRIMARY KEY (kidID, giftID),
	FOREIGN KEY (kidID) REFERENCES Kid(id),
	FOREIGN KEY (giftID) REFERENCES Gift(id)
)

CREATE TABLE dbo.Receives (
	kidID int,
	giftID int,

	PRIMARY KEY (kidID, giftID),
	FOREIGN KEY (kidID) REFERENCES Kid(id),
	FOREIGN KEY (giftID) REFERENCES Gift(id)
)