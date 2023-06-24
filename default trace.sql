-- is default trace enabled

SELECT * FROM sys.configurations 
WHERE configuration_id = 1568
GO




--Trace file location
SELECT REVERSE(SUBSTRING(REVERSE(path),CHARINDEX('\',REVERSE(path)),LEN(path)))+'log.trc'
FROM sys.traces
WHERE path LIKE '%\MSSQL\Log\log%.trc';

SELECT [value]
FROM sys.fn_trace_getinfo(NULL)
WHERE property = 2


select @@SERVERNAME