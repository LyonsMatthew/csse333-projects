Use ChristmasWorkshop
Go

Alter Procedure dbo.[create_House Proc]
( @newHouseid int,
@newAddress varchar(100),
@newHasCookies int,
@newHasMilk int,
@result smallint OUTPUT
)

AS
if(@newHouseid < 0)
begin
	set @result = 1
	print N'House ID Invalid'
	return @result
end

if(@newHasCookies >1)
begin
	set @result =2
	print N'Invalid bit to cookie'
	return @result
end

if(@newHasMilk >1)
begin
	set @result =3
	print N'Invalid bit to milk'
	return @result
end

insert into [House] ([id], [Address], [HasCookies], [HasMilk])
values(@newHouseid, @newAddress, @newHasCookies, @newHasMilk)

set @result = 0

GO