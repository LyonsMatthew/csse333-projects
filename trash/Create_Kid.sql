Use ChristmasWorkshop
Go

Alter Procedure dbo.[create_Kid Proc]
(@NewKidID_1 [int],
@NewIsNiceID_2 int,
@House int,
@result smallint OUTPUT)

AS
if(@NewKidID_1 < 0)
begin
	set @result = 1
	print N'Kid ID Invalid'
	return @result
end

if(@NewIsNiceID_2 >1)
begin
	set @result = 2
	print N'Nice Or Naughty value invalid'
	return @result
end

if(@House <0)
begin
	set @result = 3
	print N'House ID Invalid'
	return @result
end

insert into [Kid] ( [id], [isNice], [house] )
values( @NewKidID_1, @NewIsNiceID_2, @House)

set @result = 0
GO