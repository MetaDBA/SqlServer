USE master
alter database [testl] set single_user with rollback immediate
alter database [testMx] set single_user with rollback immediate
alter database [testm] set single_user with rollback immediate


USE master
alter database [testl] set multi_user
alter database [testMx] set multi_user
alter database [testm] set multi_user
