
use real_time
go

select name, Type,modify_date, create_date,  * 
from sys.objects 
where 1 = 1
--and (type = 'U' or type = 'P' or type = 'V') 
and type = 'PK'
--and name like 'Project%'
--and name not like '%import'
--  and modify_date > dateadd(d, -1,getdate()) 
  order by 3 desc


  /*
select dateadd(m, -3, getdate()) -- 3 months
select dateadd(hh, -72,getdate())

SELECT DISTINCT type FROM  sys.objects

AF = Aggregate function (CLR)
C = CHECK constraint
D = DEFAULT (constraint or stand-alone)
F = FOREIGN KEY constraint
FN = SQL scalar function
FS = Assembly (CLR) scalar-function
FT = Assembly (CLR) table-valued function
IF = SQL inline table-valued function
IT = Internal table
P = SQL Stored Procedure
PC = Assembly (CLR) stored-procedure
PG = Plan guide
PK = PRIMARY KEY constraint
R = Rule (old-style, stand-alone)
RF = Replication-filter-procedure
S = System base table
SN = Synonym
SO = Sequence object
U = Table (user-defined)
V = View
SQ = Service queue
TA = Assembly (CLR) DML trigger
TF = SQL table-valued-function
TR = SQL DML trigger
TT = Table type
UQ = UNIQUE constraint
X = Extended stored procedure
ET = External Table
ST = STATS_TREE
EC = Edge constraint
=======
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
*/
