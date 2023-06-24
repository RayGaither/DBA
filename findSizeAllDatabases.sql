-- Get sizes of all databases and store into a temp table.


IF  OBJECT_ID('tempdb..#tempsize') IS NOT NULL
drop table #tempsize
go

SELECT 
    DB_NAME(database_id) AS [database_name],
	CAST(SUM(CASE WHEN type_desc = 'ROWS' THEN size END) * 8. / 1024 AS DECIMAL(8,2)) AS [data_size_mb],
--	CAST(SUM(CASE WHEN type_desc = 'ROWS' THEN size END) * 8. / 1024 / 1024 AS DECIMAL(8,2)) AS [data_size_gb],
    CAST(SUM(CASE WHEN type_desc = 'LOG' THEN size END) * 8. / 1024 AS DECIMAL(8,2)) AS [log_size_mb],
	--CAST(SUM(CASE WHEN type_desc = 'LOG' THEN size END) * 8. / 1024 / 1024 AS DECIMAL(8,2)) AS [log_size_gb],
    CAST(SUM(size) * 8. / 1024 AS DECIMAL(8,2)) AS [total_size_mb]
	--,CAST(SUM(size) * 8. / 1024 / 1024 AS DECIMAL(8,2)) AS [total_size_gb]
	
	into #tempsize

FROM sys.master_files WITH(NOWAIT)
GROUP BY database_id
ORDER BY data_size_mb DESC

select * 
from #tempsize
--where [log_size_mb] > data_size_mb
ORDER BY data_size_mb DESC

IF  OBJECT_ID('tempdb..#tempsize') IS NOT NULL
drop table #tempsize
go