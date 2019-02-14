CREATE DATABASE [ChristmasWorkshop]
ON
( NAME = [ChristmasWorkshop],
  FILENAME = 'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop.mdf',
  SIZE = 10MB,
  MAXSIZE = 420MB,
  FILEGROWTH = 6% )
LOG ON
( NAME = [ChristmasWorkshop_log],
  FILENAME = 'E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChristmasWorkshop_log.ldf',
  SIZE = 5MB,
  MAXSIZE = 69MB,
  FILEGROWTH = 9% ) ;
GO