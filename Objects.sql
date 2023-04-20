<<<<<<< HEAD
select name, Type,modify_date, create_date,  *
from sys.objects
where type = 'V'
order by 3 desc

/*
SQ	SERVICE_QUEUE
U 	USER_TABLE
V 	VIEW
S 	SYSTEM_TABLE
IT	INTERNAL_TABLE
P 	SQL_STORED_PROCEDURE
=======
select name, Type,modify_date, create_date,  *
from sys.objects
where type = 'V'
order by 3 desc

/*
SQ	SERVICE_QUEUE
U 	USER_TABLE
V 	VIEW
S 	SYSTEM_TABLE
IT	INTERNAL_TABLE
P 	SQL_STORED_PROCEDURE
>>>>>>> master
*/