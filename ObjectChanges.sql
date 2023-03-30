use ankura_dw
go

select name, Type,modify_date, create_date,  * 
from sys.objects 
where 1 = 1
and (type = 'U' or type = 'P' or type = 'V') 
--and type = 'V'
--and name like 'Project%'
--and name not like '%import'
  and modify_date > dateadd(d, -1,getdate()) 
  order by 3 desc


  /*
select dateadd(m, -3, getdate()) -- 3 months
select dateadd(hh, -72,getdate())



SQ	SERVICE_QUEUE
U 	USER_TABLE
V 	VIEW
S 	SYSTEM_TABLE
IT	INTERNAL_TABLE
P 	SQL_STORED_PROCEDURE

  */