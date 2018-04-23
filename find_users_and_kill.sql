-- Find locks in TESTM database
SELECT request_session_id FROM sys.dm_tran_locks 
WHERE resource_database_id = DB_ID('TESTM')

-- Find locks in TESTL
SELECT request_session_id FROM sys.dm_tran_locks 
WHERE resource_database_id = DB_ID('TESTL')

-- Syntax to kill session
kill 55
