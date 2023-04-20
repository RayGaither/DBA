SELECT
      QUOTENAME(SCHEMA_NAME(sOBJ.schema_id)) + '.' + QUOTENAME(sOBJ.name) AS [TableName]
      , SUM(sdmvPTNS.row_count) AS [RowCount]
FROM
      sys.objects AS sOBJ
      INNER JOIN sys.dm_db_partition_stats AS sdmvPTNS
            ON sOBJ.object_id = sdmvPTNS.object_id
WHERE 
      sOBJ.type = 'U'
      AND sOBJ.is_ms_shipped = 0x0
      AND sdmvPTNS.index_id < 2
GROUP BY
      sOBJ.schema_id
      , sOBJ.name
ORDER BY [TableName]
GO

DECLARE @TableRowCounts TABLE ([TableName] VARCHAR(128), [RowCount] INT) ;
INSERT INTO @TableRowCounts ([TableName], [RowCount])
EXEC sp_MSforeachtable 'SELECT ''?'' [TableName], COUNT(*) [RowCount] FROM ?' ;
SELECT [TableName], [RowCount]
FROM @TableRowCounts
ORDER BY [TableName]
GO




CREATE TABLE #counts
(
    table_name varchar(255),
    row_count int
)

EXEC sp_MSForEachTable @command1='INSERT #counts (table_name, row_count) SELECT ''?'', COUNT(*) FROM ?'
SELECT table_name, row_count FROM #counts 
where table_name =  '[Diode_Test_Form_Base]'
--in (
--'[Diode_Test_Form_Base]'
--)
ORDER BY table_name, row_count DESC
DROP TABLE #counts


SELECT t.name, s.row_count from sys.tables t
JOIN sys.dm_db_partition_stats s
ON t.object_id = s.object_id
AND t.type_desc = 'USER_TABLE'
AND t.name not like '%dss%'
AND s.index_id IN (0,1)


USE  [enter your db name here]
GO

SELECT      SCHEMA_NAME(A.schema_id) + '.' +
        --A.Name, SUM(B.rows) AS 'RowCount'  Use AVG instead of SUM
          A.Name, AVG(B.rows) AS 'RowCount'
FROM        sys.objects A
INNER JOIN sys.partitions B ON A.object_id = B.object_id
WHERE       A.type = 'U'
GROUP BY    A.schema_id, A.Name
GO

SELECT 
    sc.name +'.'+ ta.name TableName, SUM(pa.rows) RowCnt
FROM 
    sys.tables ta
INNER JOIN sys.partitions pa
    ON pa.OBJECT_ID = ta.OBJECT_ID
INNER JOIN sys.schemas sc
    ON ta.schema_id = sc.schema_id
WHERE ta.is_ms_shipped = 0 AND pa.index_id IN (1,0)
GROUP BY sc.name,ta.name
ORDER BY SUM(pa.rows) DESC