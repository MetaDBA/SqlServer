@echo off

rem ---------------------------------------------------------------------------------------
rem -- Name: 	mssql_weekly_backup.bat
rem -- Creator:	elizabeth welvang
rem -- Purpose:	backup mssql database
rem ---------------------------------------------------------------------------------------
rem -- History:	20170425 (ewelvang) created
rem ---------------------------------------------------------------------------------------

setlocal

rem ---------------------------------------------------------------------------------------
rem sqlcmd -S rtpprosql001 -U metabackup -P M3t@b@ckup -i db_full_backup_purge_and_purge_weekold.sql -o "mssql_bak.log"
sqlcmd -S rtpprosql001 -i db_full_backup_purge_and_purge_weekold.sql -o "mssql_bak.log"

ping	127.0.0.1 -n 240 > nul
echo end of file ... >> mssql_bak.log

ping	127.0.0.1 -n 90 > nul
start "" powershell.exe -file randc.ps1
start "" powershell.exe -File mssql_mail.ps1
