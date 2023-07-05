
exec [sp_Blitz] -- Health  check

DBA.[dbo].sp_BlitzCache -- find bad queries

exec [sp_BlitzFirst] -- instance performance

DBA.[dbo].sp_BlitzIndex --design correct index

DBA.[dbo].sp_BlitzWho --whats happenning right now

--ALTER TABLE DBA.[dbo].[temp_sp_who2] REBUILD;

select c.definition,convert(bit,OBJECTPROPERTY(c.object_id,N'ExecIsQuotedIdentOn')) from DBA.sys.sql_modules c where c.object_id = @_msparam_0
dba_maint.dbo.sp_whoisactive

[dbo].[sp_AllNightLog]

DBA.[dbo].[sp_BlitzAnalysis] @OutputDatabaseName = N'DBA_Maint'

EXEC dbo.sp_BlitzIndex @DatabaseName='dba_maint', @SchemaName='dbo', @TableName='temp_sp_who2';
/*Then, run it with these options:
EXEC sp_Blitz @CheckUserDatabaseObjects = 0, @CheckServerInfo = 1;

These two parameters give you a server-level check without looking inside databases (slowly) for things like heaps and triggers.
*/



The index [ankura_dw].[dbo].[JournalLinesRaas].[_dta_index_JournalLinesRaas_5_1101963002__K19] is a leftover hypothetical index from the Index Tuning Wizard or Database Tuning Advisor.  This index is not actually helping performance and should be removed.




--[dbo].[sp_BlitzCache] @databasename = [ankura_dw]



321 plans are present for a single query in the plan cache - 
=======
DBA.[dbo].[sp_Blitz] -- Health  check

DBA.[dbo].sp_BlitzCache -- find bad queries

DBA.[dbo].[sp_BlitzFirst] -- instance performance

DBA.[dbo].sp_BlitzIndex --design correct index

DBA.[dbo].sp_BlitzWho --whats happenning right now

--ALTER TABLE DBA.[dbo].[temp_sp_who2] REBUILD;

select c.definition,convert(bit,OBJECTPROPERTY(c.object_id,N'ExecIsQuotedIdentOn')) from DBA.sys.sql_modules c where c.object_id = @_msparam_0
dba_maint.dbo.sp_whoisactive

[dbo].[sp_AllNightLog]

DBA.[dbo].[sp_BlitzAnalysis] @OutputDatabaseName = N'DBA_Maint'

EXEC dbo.sp_BlitzIndex @DatabaseName='dba_maint', @SchemaName='dbo', @TableName='temp_sp_who2';
/*Then, run it with these options:
EXEC sp_Blitz @CheckUserDatabaseObjects = 0, @CheckServerInfo = 1;

These two parameters give you a server-level check without looking inside databases (slowly) for things like heaps and triggers.
*/



The index [ankura_dw].[dbo].[JournalLinesRaas].[_dta_index_JournalLinesRaas_5_1101963002__K19] is a leftover hypothetical index from the Index Tuning Wizard or Database Tuning Advisor.  This index is not actually helping performance and should be removed.




--[dbo].[sp_BlitzCache] @databasename = [ankura_dw]



321 plans are present for a single query in the plan cache - 
>>>>>>> master
meaning we probably have parameterization issues.