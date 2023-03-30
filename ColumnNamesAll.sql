use ankura_dw
go

SELECT   * --o.Name, ','+c.Name 
FROM     sys.columns c 
         JOIN sys.objects o ON o.object_id = c.object_id 
WHERE    o.type = 'V' 
and o.name = N'vwMissingTime'
ORDER BY o.Name, c.Name

SELECT   o.Name, c.Name
FROM     sys.columns c 
         JOIN sys.objects o ON o.object_id = c.object_id 
WHERE    o.type = 'U' 
and o.name = N'AddBack'
--ORDER BY o.Name, c.Name

--  View

select a.name View_name,b.name column_name
from sys.all_objects a,sys.all_columns b
where a.object_id=b.object_id
and a.type='V'
and a.name = 'vwAR100'