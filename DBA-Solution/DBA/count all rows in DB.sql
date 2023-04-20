USE ankura_dw
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT AO.[name]
       ,I.rows
  FROM [ankura_dw].sys.objects AO
  JOIN [sysindexes] I on AO.object_id = I.id
  WHERE AO.TYPE = 'u'
 -- AND SCHEMA_ID = 1
  AND   I.IndId <= 1
  and AO.[name] not in ('sysdiagrams','sysssislog')
  order by AO.[name]

  /*
SELECT
       --sch.name as sch,
	   OBJ.schema_id, OBJ.Name AS TABLES, IDX.Rows AS ROWS_COUNT

FROM	sys.all_objects AS OBJ
INNER JOIN sys.sysindexes AS IDX ON OBJ.object_id = IDX.id
--INNER JOIN sys.schemas as SCH on OBJ.object_id = principal_id
WHERE 1 = 1
--and type = 'U'
AND   IDX.IndId < 1
and obj.schema_id = 1

ORDER BY OBJ.Name, IDX.Rows DESC
GO
*/