exec sp_blitz

 --Multiple Plans (14), Forced Serialization, Low Cost High CPU
 EXEC sp_BlitzCache @SortOrder = 'query hash' -- to find paramiterazation issue queries


--The database PRODPMP has 2 open implicit transactions with an oldest begin time of Apr 23 2023  4:36PM 
--Run sp_BlitzWho and check the is_implicit_transaction column to see the culprits.


--The database PRODPMP has 1 open implicit transactions with an oldest begin time of Apr 23 2023  4:36PM 
--Run sp_BlitzWho and check the is_implicit_transaction column to see the culprits.


exec sp_BlitzWho @ShowSleepingSPIDs =1

--ASYNC_NETWORK_IO (83 ms), CMEMTHREAD (21 ms), CXCONSUMER (617303 ms), CXPACKET (41899 ms), LCK_M_SCH_M (12 ms)

--SELECT CASE @@OPTIONS & 2 WHEN 0 THEN 'OFF' ELSE 'ON' END

--DECLARE @IMPLICIT_TRANSACTIONS VARCHAR(3) = 'OFF';  
--IF ( (2 & @@OPTIONS) = 2 ) SET @IMPLICIT_TRANSACTIONS = 'ON';  
--SELECT @IMPLICIT_TRANSACTIONS AS IMPLICIT_TRANSACTIONS;



select s.session_id, t.name
from sys.dm_tran_session_transactions s
    inner join sys.dm_tran_active_transactions t ON s.transaction_id = t.transaction_id

--kill 60

SELECT conn.session_id, host_name, program_name,
    nt_domain, login_name, connect_time, last_request_end_time 
FROM sys.dm_exec_sessions AS sess
JOIN sys.dm_exec_connections AS conn
   ON sess.session_id = conn.session_id;