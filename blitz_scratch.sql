
exec [sp_Blitz]  -- Health  check

exec sp_BlitzCache  @databasename = 'Solver_Scheduler', @ExpertMode = 1 -- find bad queries

--Plan Warnings, Multiple Plans (2), Forced Serialization, Long Running With Low CPU
--No warnings detected.  Try running sp_BlitzCache with @ExpertMode = 1 to find more advanced problems.
--Looks for intrinsic functions and expressions as predicates, and leading wildcard LIKE searches.

exec [sp_BlitzFirst] -- instance performance

--Returns information about all the waits encountered by threads that executed.
select * from sys.dm_os_wait_stats

--provides similar information by session
select * from sys.dm_exec_session_wait_stats 
 --provides similar information by session

--Writes are averaging longer than 100ms for at least one database on this drive.  
--	For specific database file speeds, run the query from the information link.

[dbo].[sp_AllNightLog]

exec dbo.[sp_BlitzAnalysis] @OutputDatabaseName = N'zDBAMaint'

EXEC dbo.sp_BlitzIndex @DatabaseName='BI360LSS', @SchemaName='dbo', @TableName='temp_sp_who2';

EXEC dbo.sp_BlitzIndex @DatabaseName='solver_repository'

EXEC dbo.sp_BlitzIndex @DatabaseName='CustomArea'
EXEC dbo.sp_BlitzIndex @DatabaseName='CustomArea', @SchemaName='dbo', @TableName='AzureGLStaging';

CREATE INDEX [Dim1_Includes] ON [BI360LSS].[dbo].[f_Trans_OT3] ([Dim1])  
INCLUDE ([Value1], 
[Dim6], [Dim2], [Dim3], [Dim11], [Dim10]) WITH (FILLFACTOR=100, ONLINE=off, SORT_IN_TEMPDB=off);


--select s.name [Schema], t.name [Table], i.name [Index], p.data_compression_desc Compression
--     , case when p.index_id in (0, 1) then 'Table' else 'Index' end CompressionObject
--  from sys.tables t
--  join sys.schemas s on t.schema_id = s.schema_id
--  join sys.indexes i on t.object_id = i.object_id
--  join sys.partitions p on (i.object_id = p.object_id and i.index_id = p.index_id)
--where t.type = 'U'
--order by 1, 2, p.index_id, 3










