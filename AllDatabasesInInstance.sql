<<<<<<< HEAD
--sqlcmd -E -S SERVER\INSTANCE -Q "sp_databases"


select *
from sys.databases
=======
--sqlcmd -E -S SERVER\INSTANCE -Q "sp_databases"


select *
from sys.databases
>>>>>>> master
where database_id > 4