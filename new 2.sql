USE TESTM
GO
SELECT file_id, name as [logical_file_name], physical_name
FROM sys.database_files

USE TESTM
GO
alter database testm set single_user with rollback immediate
go
alter database testm set offline

select name as [Database_Name], state_desc from sys.databases


alter database testm modify file (name='GPSTESTMxDat', filename='D:\DATA\GPSTESTMDat.mdf')
go
alter database testm modify file (Name='GPSTESTMxLog', filename='E:\Logs\GPSTESTMLog.ldf')
go

ALTER DATABASE TESTM SET ONLINE
Go
ALTER DATABASE TESTM SET MULTI_USER
Go