use diagnostic
go


create procedure dbo.GenerateDiagTable
@sqlScript NVARCHAR(MAX), 
@tblName varchar(100)

AS
BEGIN
  --temp testing vars
--  declare @sqlScript NVARCHAR(MAX)
--  set @sqlScript = N'SELECT name, value, value_in_use, minimum, maximum, [description], is_dynamic, is_advanced
--FROM sys.configurations WITH (NOLOCK)
--ORDER BY name OPTION (RECOMPILE);'

  DECLARE @tableDef NVARCHAR(MAX)
  declare @tableName varchar(100) 
 -- Set @tblName = replace(@sqlScript,' ','')


  SET @tableDef = N'CREATE TABLE ' + @tblName + ' (' + CHAR(13) + CHAR(10)
  SELECT @tableDef = @tableDef + N'  ' + c.name + N' ' + 
      CASE 
        WHEN c.system_type_id IN (165, 167, 173, 175, 231, 239) THEN 'VARCHAR(MAX)'
        WHEN c.system_type_id IN (40, 41, 42) THEN 'DECIMAL(' + CAST(c.precision AS VARCHAR(5)) + ',' + CAST(c.scale AS VARCHAR(5)) + ')'
        WHEN c.system_type_id IN (58, 61) THEN 'DATETIME'
        ELSE UPPER(c.system_type_name)
		--ELSE UPPER(t.name)
      END + N',' + CHAR(13) + CHAR(10)
  FROM sys.dm_exec_describe_first_result_set(@sqlScript, NULL, 0) AS c
--  INNER JOIN sys.types AS t ON c.system_type_id = t.system_type_id AND t.is_user_defined = 0

  SET @tableDef = SUBSTRING(@tableDef, 1, LEN(@tableDef) - 3) + CHAR(13) + CHAR(10) + N')'
  -- temp
--  print @tableDef
  --RETURN @tableDef
END
--select @@SERVERNAME
--GAROHSQL01.hi.hubbell-ad.com