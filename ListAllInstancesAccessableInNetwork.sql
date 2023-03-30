-- List all servers in network I have access to

CREATE TABLE #servers(sname VARCHAR(255))
INSERT #servers (sname)
EXEC master..xp_CMDShell 'sqlcmd -L'
DELETE
FROM #servers
WHERE sname='Servers:'
OR sname IS NULL
SELECT LTRIM(sname)
FROM #servers
DROP TABLE #servers