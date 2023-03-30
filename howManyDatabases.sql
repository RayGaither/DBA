SELECT s.name
	--,compatibility_level
	,recovery_model_desc 
	,database_id
	--,s. *
FROM sys.databases s
where 1 = 1
and database_id > 4
and name not in ('_DBAdmin','Aux_DBA_Utilities', 'master', 'model','MSDB')
order by 3
GO