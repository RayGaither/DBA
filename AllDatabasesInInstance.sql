--sqlcmd -E -S SERVER\INSTANCE -Q "sp_databases"


select *
from sys.databases
where database_id > 4