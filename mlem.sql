CREATE USER [SodaBaseUserdavelltr29] FOR LOGIN [SodaBaseUserdavelltr29] WITH DEFAULT_SCHEMA=[SodaBaseUserdavelltr29]
GO
CREATE ROLE [FrontEndDude]
GO
ALTER ROLE [FrontEndDude] ADD MEMBER [SodaBaseUserdavelltr29]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SodaBaseUserdavelltr29]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SodaBaseUserdavelltr29]
GO