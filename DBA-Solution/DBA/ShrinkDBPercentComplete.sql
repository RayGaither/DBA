select percent_complete, *
from sys.dm_exec_requests
where 1 = 1
and command = 'DbccFilesCompact' or command = 'DbccDBCompact'