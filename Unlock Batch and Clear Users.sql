select INTERID,* from DYNAMICS.dbo.SY01500

select * from META.dbo.SY00500 where BACHNUMB like '%AP%'
select * from META.dbo.SY00500

--Unlock Batch
--update META.dbo.SY00500 set MKDTOPST = 0 , BCHSTTUS = 0 where BACHNUMB = 'LJPAYROLL'

--System Tables
select * from DYNAMICS.dbo.SY00800
select * from DYNAMICS.dbo.SY00801
select * from DYNAMICS.dbo.ACTIVITY
select * from TEMPdb.dbo.DEX_LOCK
select * from TEMPdb.dbo.DEX_SESSION


--DELETE FROM DU000030 

/* clear all users and locks
Use DYNAMICS 
Delete SY00800 
Delete SY00801 
Delete ACTIVITY 

Use TEMPDB 
Delete DEX_LOCK 
Delete DEX_SESSION

-- Dexterity Sessions Table
delete S
-- select * 
from tempdb..DEX_SESSION S
where not exists (
 select * from DYNAMICS..ACTIVITY A 
 where S.session_id = A.SQLSESID)

-- Dexterity Locks Table
delete L
-- select *
from tempdb..DEX_LOCK L
where not exists (


*/
