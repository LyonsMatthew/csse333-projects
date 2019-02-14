CREATE PROCEDURE [dbo].InsertManufacturer
(@ManfAddress_1 varchar(100))
AS

--Insert the manufacturer with the given address
INSERT INTO Manufacturer(address)
VALUEs (@ManfAddress_1)