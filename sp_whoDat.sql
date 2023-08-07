

use master
go


IF OBJECT_ID('dbo.sp_whoDat', 'P') IS NOT NULL 
BEGIN
  DROP procedure dbo.sp_whoDat;
END
go


create procedure dbo.sp_whoDat
as
BEGIN


IF OBJECT_ID('dbo.temp_sp_who2', 'U') IS NOT NULL 
BEGIN
  DROP TABLE dbo.temp_sp_who2;
END; 

CREATE TABLE temp_sp_who2
    (
      SPID INT
      ,Status VARCHAR(1000) NULL
      ,LOGIN SYSNAME NULL
      ,HostName SYSNAME NULL
      ,BlkBy SYSNAME NULL
      ,DBName SYSNAME NULL
      ,Command VARCHAR(1000) NULL
      ,CPUTime INT NULL
      ,DiskIO INT NULL
      ,LastBatch VARCHAR(1000) NULL
      ,ProgramName VARCHAR(1000) NULL
      ,SPID2 INT
      , RequestID INT NULL --comment out for SQL 2000 databases
      , InsertedDate datetime DEFAULT GETDATE()
    );

--This insert can be added to a job that runs periodically.
INSERT  INTO temp_sp_who2
    (SPID
     ,Status
	 ,LOGIN
	 ,HostName
	 ,BlkBy
	 ,DBName
	 ,Command
	 ,CPUTime
	 ,DiskIO
	 ,LastBatch
	 ,ProgramName
	 ,SPID2
	 ,RequestID   
    )
EXECUTE sp_who2

end;
--create and populate table, executes above SP
exec sp_whoDat

Select *
from temp_sp_who2
where 1 = 1
--and login = 'hi\ploo'
--and DBName = 'solver_repository'
order by 3 




SELECT net_transport, *
FROM sys.dm_exec_connections
WHERE 1 = 1 
--and session_id = 81
and net_transport <> 'Shared memory'
 
