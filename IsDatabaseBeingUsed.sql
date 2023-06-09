--Databases with activity (Scan, seek, lookup) since last instance restart
--

select [name] from sys.databases 
where database_id > 4
AND [name] NOT IN 
(select DB_NAME(database_id)
from sys.dm_db_index_usage_stats
-- test where activity > last restart
where coalesce(last_user_seek, last_user_scan, last_user_lookup,'1/1/1970') > 
(select login_time from sys.sysprocesses where spid = 1)) -- Instance start time