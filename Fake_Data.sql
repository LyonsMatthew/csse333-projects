USE ChristmasWorkshop4
GO

EXEC dbo.insert_House '1991 Santa Lane', 1, 0;
EXEC dbo.insert_House '1992 Sandy Lane', 1, 1;
EXEC dbo.insert_House '2011 Hart Avenue', 0, 0;
EXEC dbo.insert_House '181 Westward', 1, 1;
EXEC dbo.insert_House '4096 High Park', 1, 0;
EXEC dbo.insert_House '2087 South Pole', 1, 1;
EXEC dbo.insert_House '3562 Arctic Cap', 0, 1;
EXEC dbo.insert_House '784 Fugsiliville', 0, 0;
EXEC dbo.insert_House 'Box', 0, 1;
EXEC dbo.insert_House '2034 Brazil', 1, 1;

EXEC dbo.insert_Kid 'Reyd', '1998-09-09', 'M', 1, 10;
EXEC dbo.insert_Kid 'Red Nugget', '1800-12-10', 'F', 1, 9;
EXEC dbo.insert_Kid 'MJL', '1999-01-11', 'M', 0, 3;
EXEC dbo.insert_Kid 'TiM', '1998-01-06', 'M', 1, 7;
EXEC dbo.insert_Kid 'Matt', '1996-01-12', 'M', 0, 7;
EXEC dbo.insert_Kid 'Grace Macuk', '1999-02-14', 'F', 1, 4;
EXEC dbo.insert_Kid 'Jwfregr iuhbnjiuh', '2012-05-10', 'M', 0, 10;
EXEC dbo.insert_Kid 'Sandy Claws', '1753-01-01', 'M', 0, 2;
EXEC dbo.insert_Kid 'Reyd2', '2002-12-24', 'M', 1, 3;
EXEC dbo.insert_Kid 'Mr. Dr. Professor Sriram Mohan Esq.', '1812-06-18', 'M', 0, 9;

EXEC dbo.insert_manufacturer 'Where Dreams Go To Die';
EXEC dbo.insert_manufacturer 'Sweatshop 1';
EXEC dbo.insert_manufacturer 'Coal Bechtold';
EXEC dbo.insert_manufacturer 'Box o'' Boxes';
EXEC dbo.insert_manufacturer 'The one and only (except for the other ones)';

EXEC dbo.insert_gift 'Verum Rex', 5;
EXEC dbo.insert_gift 'Kingdom Hearts 3', 4;
EXEC dbo.insert_gift 'Ur Mom *AHHHHHHHHH*', 3;
EXEC dbo.insert_gift 'Brick', 4;
EXEC dbo.insert_gift 'Television Studio Set For Kids', 3;
EXEC dbo.insert_gift 'Reconnect Kingdom Hearts 4.5', 4;
EXEC dbo.insert_gift 'State of the art 4K Projector', 5;
EXEC dbo.insert_gift 'Big Boy Toy', 3;
EXEC dbo.insert_gift 'Buzz Light Year', 2;
EXEC dbo.insert_gift 'Tragic Day of Harambe', 2;

EXEC dbo.insert_blackrock 'Biggest Blackest Rock', '1753-01-02', 1;
EXEC dbo.insert_blackrock 'Blacky boy', '1900-04-22', 1;
EXEC dbo.insert_blackrock 'Gerome', '1985-02-14', 1;
EXEC dbo.insert_blackrock 'I''m gonna say the N word', '2018-12-03', 1;
EXEC dbo.insert_blackrock 'Slightly less big black rock', '2014-07-02', 1;

EXEC dbo.insert_Santa 1, 'Santa Claus';
EXEC dbo.insert_Santa 0, 'Saint Nicholas';
EXEC dbo.insert_Santa 0, 'Sandy Claws';

EXEC dbo.insert_Ohoho 'https://www.youtube.com/watch?v=FW1QY76d-40', 47, 9.7, 20.3, 1;
EXEC dbo.insert_Ohoho 'https://www.youtube.com/watch?v=yDkQS7c5PuM', 3, 7.5, 15.6, 1;
EXEC dbo.insert_Ohoho 'https://www.youtube.com/watch?v=LDM_VGfhv_M', 9, 69.96, -30.2, 2;
EXEC dbo.insert_Ohoho 'https://www.youtube.com/watch?v=veKf3wPdXVU', 12, 4.5, 3.2, 3;
EXEC dbo.insert_Ohoho 'https://www.youtube.com/watch?v=wa1rYG2DhFA', 10, 12.8, 5.4, 1;

EXEC dbo.insert_Elf 'Marky Mark', '1976-04-18', 'M', 150000, 5.8, 2, 5;
EXEC dbo.insert_Elf 'Matthew Jordan Lyons', '1999-01-12', 'M', 200000, 3.2, 5.4, 4;
EXEC dbo.insert_Elf 'Brown Olive that tastes like Potatoe', '1952-09-12', 'F', 300, 2, 1, 3;
EXEC dbo.insert_Elf 'uhbgnjiuhbj', '1897-03-25', 'M', 19456, 9.8, 4.0, 4;
EXEC dbo.insert_Elf 'poiuytrewsxcvbhjuyhgtf', '1765-08-17', 'F', 9000, 4.5, 0.2, 4;

EXEC dbo.insert_Reindeer 'Rudolph', 'Red Nugget', 'https://www.youtube.com/watch?v=0byH9h1ClBY', 11;
EXEC dbo.insert_Reindeer 'Thrasher', 'Black', 'https://www.youtube.com/watch?v=kJmAhomTRkg', 11;
EXEC dbo.insert_Reindeer 'Prancer', 'Black', 'https://www.youtube.com/watch?v=D5QSGtdEPDE', 12;
EXEC dbo.insert_Reindeer 'Dasher', 'Brown', 'https://www.youtube.com/watch?v=5VwcZF0QX0s', 13;
EXEC dbo.insert_Reindeer 'Blitzen', 'Black', 'https://www.youtube.com/watch?v=-KbG1NEpKZw', 12;

EXEC dbo.insert_wants 1, 10;
EXEC dbo.insert_wants 2, 9;
EXEC dbo.insert_wants 2, 10;
EXEC dbo.insert_wants 3, 8;
EXEC dbo.insert_wants 4, 7;
EXEC dbo.insert_wants 5, 6;
EXEC dbo.insert_wants 6, 5;
EXEC dbo.insert_wants 7, 4;
EXEC dbo.insert_wants 8, 3;
EXEC dbo.insert_wants 9, 2;
EXEC dbo.insert_wants 10, 1;

EXEC dbo.insert_receives 1, 10;
EXEC dbo.insert_receives 2, 10;
EXEC dbo.insert_receives 3, 11;
EXEC dbo.insert_receives 4, 7;
EXEC dbo.insert_receives 5, 12;
EXEC dbo.insert_receives 6, 5;
EXEC dbo.insert_receives 7, 13;
EXEC dbo.insert_receives 8, 14;
EXEC dbo.insert_receives 9, 2;
EXEC dbo.insert_receives 10, 15;