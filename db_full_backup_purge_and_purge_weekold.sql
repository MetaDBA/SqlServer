declare @name varchar(50) -- database name
declare @path varchar(256) -- path for backup files
declare @fileName varchar(256) -- filename for backup
declare @fileDate varchar(20) -- used for filename
declare @deleteDateBak datetime= dateadd(wk,-1,getdate());

-- specify backup directory
set @path = 'c:\it\'

select @fileDate = CONVERT(varchar(20),getdate(),112)

declare db_cursor cursor for
select name
from master.dbo.sysdatabases
where name not in ('tempdb','DYNAMICS_RESTORE') 

open db_cursor
fetch next from db_cursor into @name

while @@FETCH_STATUS = 0
begin
  set @fileName = @path + @name + '_' + @fileDate + '.BAK'
  backup database @name to disk = @fileName
  
  fetch next from db_cursor into @name
end

exec master.sys.xp_delete_file 0, @path,'BAK',@deleteDateBak,1;

close db_cursor
deallocate db_cursor