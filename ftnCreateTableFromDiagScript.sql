<<<<<<< HEAD
use diagnostic
go

--CREATE FUNCTION dbo.GenerateTableDDL (@sqlScript NVARCHAR(MAX))
--RETURNS NVARCHAR(MAX)
--AS
--BEGIN
  --temp testing vars
  declare @sqlScript NVARCHAR(MAX)
  set @sqlScript = N'SELECT name, value, value_in_use, minimum, maximum, [description], is_dynamic, is_advanced
FROM sys.configurations WITH (NOLOCK)
ORDER BY name OPTION (RECOMPILE);'
  
  DECLARE @tableDef NVARCHAR(MAX)

  SET @tableDef = N'CREATE TABLE #TempTable (' + CHAR(13) + CHAR(10)

  SELECT @tableDef = @tableDef + N'  ' + c.name + N' ' + 
      CASE 
        WHEN c.system_type_id IN (165, 167, 173, 175, 231, 239) THEN 'VARCHAR(MAX)'
        WHEN c.system_type_id IN (40, 41, 42) THEN 'DECIMAL(' + CAST(c.precision AS VARCHAR(5)) + ',' + CAST(c.scale AS VARCHAR(5)) + ')'
        WHEN c.system_type_id IN (58, 61) THEN 'DATETIME'
        ELSE UPPER(t.name)
      END + N',' + CHAR(13) + CHAR(10)
  FROM sys.dm_exec_describe_first_result_set(@sqlScript, NULL, 0) AS c
  INNER JOIN sys.types AS t ON c.system_type_id = t.system_type_id AND t.is_user_defined = 0

  SET @tableDef = SUBSTRING(@tableDef, 1, LEN(@tableDef) - 2) + CHAR(13) + CHAR(10) + N')'
  -- temp
  print @tableDef
--  RETURN @tableDef
--END
=======
use diagnostic
go

--CREATE FUNCTION dbo.GenerateTableDDL (@sqlScript NVARCHAR(MAX))
--RETURNS NVARCHAR(MAX)
--AS
--BEGIN
  --temp testing vars
  declare @sqlScript NVARCHAR(MAX)
  set @sqlScript = N'SELECT name, value, value_in_use, minimum, maximum, [description], is_dynamic, is_advanced
FROM sys.configurations WITH (NOLOCK)
ORDER BY name OPTION (RECOMPILE);'
  
  DECLARE @tableDef NVARCHAR(MAX)

  SET @tableDef = N'CREATE TABLE #TempTable (' + CHAR(13) + CHAR(10)

  SELECT @tableDef = @tableDef + N'  ' + c.name + N' ' + 
      CASE 
        WHEN c.system_type_id IN (165, 167, 173, 175, 231, 239) THEN 'VARCHAR(MAX)'
        WHEN c.system_type_id IN (40, 41, 42) THEN 'DECIMAL(' + CAST(c.precision AS VARCHAR(5)) + ',' + CAST(c.scale AS VARCHAR(5)) + ')'
        WHEN c.system_type_id IN (58, 61) THEN 'DATETIME'
        ELSE UPPER(t.name)
      END + N',' + CHAR(13) + CHAR(10)
  FROM sys.dm_exec_describe_first_result_set(@sqlScript, NULL, 0) AS c
  INNER JOIN sys.types AS t ON c.system_type_id = t.system_type_id AND t.is_user_defined = 0

  SET @tableDef = SUBSTRING(@tableDef, 1, LEN(@tableDef) - 2) + CHAR(13) + CHAR(10) + N')'
  -- temp
  print @tableDef
--  RETURN @tableDef
--END
>>>>>>> master
--select @@SERVERNAME