CREATE NONCLUSTERED INDEX house_address_index ON House(Address)
CREATE NONCLUSTERED INDEX manufacturer_address_index ON Manufacturer(Address)
CREATE NONCLUSTERED INDEX person_name ON Person(PersonName)
CREATE NONCLUSTERED INDEX gift_name ON Gift(Name)
CREATE NONCLUSTERED INDEX blackrock_name ON BlackRock(PetName)
CREATE NONCLUSTERED INDEX santa_name ON Santa(Name)
GO