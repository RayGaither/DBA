use ankura_dw
go

with deps (parent, child) as (
    select vtu.view_name, table_name
    from information_schema.view_table_usage as vtu
    where 1 = 1 
	--and view_name = 'vwAccountRelationshipsTall'
    union all
    select vtu.view_name, vtu.table_name
    from information_schema.view_table_usage as vtu
    inner join deps on deps.child = vtu.view_name
)
--select parent, child
--from deps


select distinct child
from deps


select OBJECT_NAME(referenced_major_id) as DependantObject
from sys.sql_dependencies
where object_id = object_id('vwIncomeStatement')

select *
from sys.sql_dependencies


select object_id('vwIncomeStatement')