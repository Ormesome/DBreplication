SET NOCOUNT ON
GO

USE [master]
GO

CREATE DATABASE [TestDB]
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\database\data\TestDB.mdf' , SIZE = 102400KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\database\log\TestDB_log.ldf' , SIZE = 25600KB , FILEGROWTH = 10240KB )
GO

USE [TestDB]
GO

CREATE TABLE [dbo].[TestTrans](
	[ID] [uniqueidentifier] NULL
)
GO

BACKUP DATABASE [TestDB] TO  DISK = N'C:\database\backup\TestDB.bak' WITH NOFORMAT, NOINIT,  NAME = N'TestDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

INSERT INTO [dbo].[TestTrans] (ID)
VALUES (NEWID())
GO 1000

BACKUP LOG [TestDB] TO  DISK = N'C:\database\backup\001.trn' WITH NOFORMAT, NOINIT,  NAME = N'TestDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

INSERT INTO [dbo].[TestTrans] (ID)
VALUES (NEWID())
GO 1000

BACKUP LOG [TestDB] TO  DISK = N'C:\database\backup\002.trn' WITH NOFORMAT, NOINIT,  NAME = N'TestDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

INSERT INTO [dbo].[TestTrans] (ID)
VALUES (NEWID())
GO 1000

BACKUP LOG [TestDB] TO  DISK = N'C:\database\backup\003.trn' WITH NOFORMAT, NOINIT,  NAME = N'TestDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

INSERT INTO [dbo].[TestTrans] (ID)
VALUES (NEWID())
GO 1000

BACKUP LOG [TestDB] TO  DISK = N'C:\database\backup\004.trn' WITH NOFORMAT, NOINIT,  NAME = N'TestDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

INSERT INTO [dbo].[TestTrans] (ID)
VALUES (NEWID())
GO 1000

BACKUP LOG [TestDB] TO  DISK = N'C:\database\backup\005.trn' WITH NOFORMAT, NOINIT,  NAME = N'TestDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
