Create Table [dbo].[Elf](
	id int,
	wage money,
	height decimal(3),
	earLength decimal(3),
	feeds varchar,
	WorksIn varchar,
	elfName varchar,
	dob date,
	sex char,
	Foreign Key(id) References Person(id),
	Primary Key(id)
);

Create Table [dbo].[Ohoho](
	id int,
	urlLink varchar,
	lengthOfOhoho decimal(3),
	girth decimal(3),
	pitch decimal(3),
	Santa varchar,
	Foreign Key (id) References Santa(id),
	Primary Key(id)
);


Create Table [dbo].[Person](
	id int,
	personName varchar,
	dob date,
	sex char,
	Primary Key(id)
);


Create Table [dbo].[Santa](
	id int,
	isSanta bit,
	santaName varchar,
	Primary Key(id),
);
