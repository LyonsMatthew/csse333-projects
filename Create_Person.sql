Use ChristmasWorkshop
Go

Alter Procedure dbo.[create_Person Proc]
( @newPersonID int,
@newPersonName varchar(100),
@newDOB varchar(100),
@newSex char,
@result smallint OUTPUT
)

AS
if(@newPersonID < 0)
begin
	set @result = 1
	print N'Person ID Invalid'
	return @result
end

if(@newDOB > GETDATE())
begin
	set @result = 2
	print N'Date invalid'
	return @result
end

if (@newDOB != 'M' or @newDOB != 'F') 
begin
	set @result = 3
	print N'Gender Invalid'
	return @result
end

insert into [Person] ([id], [personName], [dob], [sex])
values (@newPersonID, @newPersonName, @newDOB, @newSex)

set @result = 0

GO