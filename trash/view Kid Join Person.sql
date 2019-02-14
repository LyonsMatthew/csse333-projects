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