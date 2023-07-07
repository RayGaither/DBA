/*
select @@version
go
select @@servername
go
Select *
from sys.dm_exec_requests
where blocking_session_id &lt;&gt; 0
*/



    <process id="process1b83e6cd848" 
	taskpriority="0" 
	logused="10000" 
	waittime="5305" 
	schedulerid="2" 
	kpid="6632" 
	status="suspended" 
	spid="189" 
	sbid="0" 
	ecid="0" 
	priority="0" 
	trancount="2" 
	lastbatchstarted="2023-07-07T07:15:30.843" 
	lastbatchcompleted="2023-07-07T07:15:30.710" 
	lastattention="1900-01-01T00:00:00.710" 
	clientapp=".Net SqlClient Data Provider"
	
	hostname="CMX-RMA-PWRUP-1" 
	hostpid="14232" 
	loginname="srv_rma_app" 

	isolationlevel="read committed (2)" 
	xactid="765338219" 
	currentdb="1" 
	currentdbname="master" 
	lockTimeout="4294967295" 
	clientoption1="671088672" 
	clientoption2="128056">

      <executionStack>
        <frame procname="adhoc" line="1" 
		
		stmtstart="40" 
		stmtend="234" 
		sqlhandle="0x02000000a162ca0b07ca6c2b45433b36750c8dca69e61e9d0000000000000000000000000000000000000000">
unknown    </frame>
        <frame procname="unknown" line="1" sqlhandle="0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000">
unknown    </frame>
      </executionStack>
      <inputbuf>
(@ge nvarchar(4000))DELETE TOP (5) FROM [ERM].[KVDBA].[term_calibration_results] WHERE status='P' and ge_serial_no=@ge;   </inputbuf>
    </process>


declare @ge nvarchar(4000)
set @ge = 'eee'

DELETE TOP (5) 
FROM [ERM].[KVDBA].[term_calibration_results] 
WHERE status='P' and ge_serial_no=@ge