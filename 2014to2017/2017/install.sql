SET NOCOUNT ON
GO

USE [master]
GO

/*
An actual restore. This would prevent me from restoring transaction logs.
*/
--RESTORE DATABASE [RestoredDB] FROM  DISK = N'C:\database\backup\TestDB.bak' WITH  FILE = 1,  MOVE N'TestDB' TO N'C:\database\data\RestoredDB.mdf',  MOVE N'TestDB_log' TO N'C:\database\log\RestoredDB_log.ldf',  NOUNLOAD,  STATS = 5
--GO

/*
NORECOVERY allows us to continue to restore transaction logs.
Restoring to a new database so that I can prove it works on SQL2014.
*/
RESTORE DATABASE [RestoredDB] FROM  DISK = N'C:\database\backup\TestDB.bak' WITH  FILE = 1,  MOVE N'TestDB' TO N'C:\database\data\RestoredDB.mdf',  MOVE N'TestDB_log' TO N'C:\database\log\RestoredDB_log.ldf', NORECOVERY,  NOUNLOAD,  STATS = 5
GO

RESTORE LOG [RestoredDB] FROM DISK = N'C:\database\backup\001.trn' WITH FILE = 1, NORECOVERY
GO

/*
The database is restored in standby mode. If successful I can continue to restore transaction logs.
*/
RESTORE DATABASE [RestoredDB] WITH STANDBY = N'C:\database\standby\RestoredDB.bak'
GO

/*
When restored on SQL2017:
	Msg 3180, Level 16, State 2, Line 18
	This backup cannot be restored using WITH STANDBY because a database upgrade is needed. Reissue the RESTORE without WITH STANDBY.
	Msg 3013, Level 16, State 1, Line 18
	RESTORE DATABASE is terminating abnormally.

When restored on SQL2014:
	RESTORE DATABASE successfully processed 0 pages in 0.122 seconds (0.000 MB/sec).
*/

RESTORE LOG [RestoredDB] FROM DISK = N'C:\database\backup\002.trn' WITH FILE = 1, NORECOVERY
GO

RESTORE LOG [RestoredDB] FROM DISK = N'C:\database\backup\003.trn' WITH FILE = 1, NORECOVERY
GO

RESTORE LOG [RestoredDB] FROM DISK = N'C:\database\backup\004.trn' WITH FILE = 1, NORECOVERY
GO

RESTORE LOG [RestoredDB] FROM DISK = N'C:\database\backup\005.trn' WITH FILE = 1, NORECOVERY
GO

RESTORE DATABASE [RestoredDB] WITH STANDBY = N'C:\database\standby\RestoredDB.bak'
GO
