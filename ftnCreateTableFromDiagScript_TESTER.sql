use [Diagnostic]
go

DECLARE @sqlScript NVARCHAR(MAX)
DECLARE @tableDef NVARCHAR(MAX)
declare @tableName varchar(100)
SET @sqlScript = N'SELECT * FROM dbo.MyTable'

set @tableName = 'ConVal'
SET @sqlScript = N'"SELECT TOP(50) DB_NAME(t.[dbid]) AS [Database Name],
REPLACE(REPLACE(LEFT(t.[text], 255), CHAR(10),''''), CHAR(13),'''') AS [Short Query Text], 
cp.objtype AS [Object Type], cp.cacheobjtype AS [Cache Object Type],  
cp.size_in_bytes/1024 AS [Plan Size in KB],
CASE WHEN CONVERT(nvarchar(max), qp.query_plan) COLLATE Latin1_General_BIN2 LIKE N''%<MissingIndexes>%'' THEN 1 ELSE 0 END AS [Has Missing Index]
, t.[text] AS [Complete Query Text], qp.query_plan AS [Query Plan]
FROM sys.dm_exec_cached_plans AS cp WITH (NOLOCK)
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS t
CROSS APPLY sys.dm_exec_query_plan(plan_handle) AS qp
WHERE cp.cacheobjtype = N''Compiled Plan'' 
AND cp.objtype IN (N''Adhoc'', N''Prepared'') 
AND cp.usecounts = 1
ORDER BY cp.size_in_bytes DESC, DB_NAME(t.[dbid]) OPTION (RECOMPILE);

"'

select @tableDef = dbo.ftnGenerateDiagTable(@sqlScript, @tableName)

PRINT @tableDef



--CREATE TABLE ConfigurationValues (
--  value SQL_VARIANT,
--  value_in_use SQL_VARIANT,
--  minimum SQL_VARIANT,
--  maximum SQL_VARIANT,
--  is_dynamic BIT,
--  is_advanced BIT,
--  name VARCHAR(MAX),
--  description VARCHAR(MAX),
--  name VARCHAR(MAX),
--  description VARCHAR(MAX),
--)