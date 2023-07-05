


declare @strFind as varchar(max)
set @strFind = 'real_time'

SELECT OBJECT_NAME(OBJECT_ID) SP_Name
              ,OBJECT_DEFINITION(OBJECT_ID) SP_Definition
        FROM   sys.procedures
        WHERE  OBJECT_DEFINITION(OBJECT_ID) LIKE '%'+@strFind+'%'



SELECT OBJECT_NAME(object_id) AS MYSPDEFINITION
FROM sys.procedures
WHERE OBJECT_DEFINITION(object_id) LIKE '%ERM%';