USE [TESTM];
GO
SELECT file_id, name AS logical_name, physical_name
FROM sys.database_files

use master;
go
alter database [TESTM] modify file ( NAME = LOGICAL_FILENAME, NEWNAME = NEW_LOGICAL_FILENAME );
go