
exec [sp_Blitz]  -- Health  check


exec sp_blitzwho




DBA.[dbo].sp_BlitzCache -- find bad queries

exec [sp_BlitzFirst] -- instance performance

EXEC dbo.sp_BlitzIndex @DatabaseName='master', @SchemaName='dbo', @TableName='temp_sp_who2';

EXEC dbo.sp_BlitzIndex @DatabaseName='master', @SchemaName='dbo', @TableName='bpr';

exec sp_BlitzCache @SortOrder = 'recent compilations'


exec sp_BlitzLock



exec sp_BlitzIndex --design correct index


exec sp_Whoisactive @get_locks = 1

DBCC USEROPTIONS

exec sp_WhoIsActive @get_additional_info = 1









EXEC dbo.sp_BlitzIndex @DatabaseName='real_time',
@SchemaName='KVDBA', @TableName='I210_Matchpoint_Data';



EXEC dbo.sp_BlitzIndex @DatabaseName='ERM', @SchemaName='KVDBA', @TableName='term_calibration_results';



EXEC dbo.sp_BlitzIndex @DatabaseName='real_time', @SchemaName='dbo', @TableName='PyPower_Results';



