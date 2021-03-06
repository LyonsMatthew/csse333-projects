USE [ChristmasWorkshop]
GO
/****** Object:  StoredProcedure [dbo].[set_elf_wage]    Script Date: 2019/02/01 2:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[set_elf_wage]
(@ElfID_1 [int],
@Wage_2 money)
AS

-- Checks to see if the ID is valid
IF (SELECT COUNT(Elf.id) FROM Elf WHERE id = @ElfID_1) = 0
BEGIN
	PRINT 'The elf ' + CONVERT(varchar(30), @ElfID_1) + ' is not valid because it is not in the elf table'
	RETURN 1
END

UPDATE Elf
SET Wage = @Wage_2
WHERE id = @ElfID_1
RETURN 0