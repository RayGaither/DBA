DECLARE @sqlScript NVARCHAR(MAX)
DECLARE @tableDef NVARCHAR(MAX)

SET @sqlScript = N'SELECT * FROM dbo.MyTable'


SET @sqlScript = N'SELECT name, value, value_in_use, minimum, maximum, [description], is_dynamic, is_advanced
FROM sys.configurations WITH (NOLOCK)
ORDER BY name OPTION (RECOMPILE);'

SET @tableDef = dbo.GenerateTableDDL(@sqlScript)

PRINT @tableDef



CREATE TABLE ConfigurationValues (
  value SQL_VARIANT,
  value_in_use SQL_VARIANT,
  minimum SQL_VARIANT,
  maximum SQL_VARIANT,
  is_dynamic BIT,
  is_advanced BIT,
  name VARCHAR(MAX),
  description VARCHAR(MAX),
  name VARCHAR(MAX),
  description VARCHAR(MAX),
)