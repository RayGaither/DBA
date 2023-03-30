use dba
go

create procedure spCounts as

DECLARE @QueryString NVARCHAR(MAX) ;
SELECT @QueryString = COALESCE(@QueryString + ' UNION ALL ','')
                      + 'SELECT '
                      + '''' + QUOTENAME(SCHEMA_NAME(sOBJ.schema_id))
                      + '.' + QUOTENAME(sOBJ.name) + '''' + ' AS [TableName]
                      , COUNT(*) AS [RowCount] FROM '
                      + QUOTENAME(SCHEMA_NAME(sOBJ.schema_id))
                      + '.' + QUOTENAME(sOBJ.name) + ' WITH (NOLOCK) '
FROM sys.objects AS sOBJ
WHERE
      sOBJ.type = 'U'
      AND sOBJ.is_ms_shipped = 0x0
ORDER BY SCHEMA_NAME(sOBJ.schema_id), sOBJ.name ;
EXEC sp_executesql @QueryString
GO

--First create above SP then excecute with below call
use KVPROD
go

create table #counts(
TableName varchar(100),
RowCounts int)

insert into #counts
exec dba.[dbo].[spCounts]
select * from #counts
where tablename in (

)


drop table #counts