/*
select @@version
go
select @@servername
go
Select *
from sys.dm_exec_requests
where blocking_session_id &lt;&gt; 0
*/

create_table1