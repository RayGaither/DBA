/* 
	Rewrite from here: https://www.brentozar.com/blitz/configure-sql-server-alerts/ 
	More info (shows available tokens): 
		https://www.simple-talk.com/sql/database-administration/sql-server-alerts-soup-to-nuts/
		http://tomaslind.net/2016/11/04/sql-agent-logging-tokens/
*/
SET NOCOUNT ON
USE [msdb]
GO

-- Configure these lines: 
DECLARE @operator_name sysname = N'SQL_Alerts',
	@emails nvarchar(4000) = N'noemail@noemail.com',
	@pagers nvarchar(4000) = N'8675-309@noemail.com'

-- loop variables
DECLARE @alert_name sysname = NULL,
	@severity int = 0,
	@message_id int = 0,
	@message nvarchar(max) = NULL,
	@performance_condition nvarchar(max) = NULL

DECLARE @alerts TABLE (
	[name] sysname NOT NULL,
	[severity] int NOT NULL,
	[message_id] int NOT NULL,
	[performance_condition] nvarchar(max) NULL,
	[message] nvarchar(max) NULL
)

-- configure add new alerts, use existing templates as examples.
-- Only one of the following Severity, Message_Id, OR [performance_condition] can be supplied. 
INSERT INTO @alerts ( [name], [severity], [message_id], [performance_condition], [message] )
VALUES 
	-- Severities, message id must == 0, and performance_condition must be null
	( N'Severity 016', 16, 0, NULL, NULL ),
	( N'Severity 017', 17, 0, NULL, NULL ),
	( N'Severity 018', 18, 0, NULL, NULL ),
	( N'Severity 019', 19, 0, NULL, NULL ),
	( N'Severity 020', 20, 0, NULL, NULL ),
	( N'Severity 021', 21, 0, NULL, NULL ),
	( N'Severity 022', 22, 0, NULL, NULL ),
	( N'Severity 023', 23, 0, NULL, NULL ),
	( N'Severity 024', 24, 0, NULL, NULL ),
	( N'Severity 025', 25, 0, NULL, NULL ),
	-- performance counter alerts, severity must == 0, and message id must == 0
	( N'PLE Alert', 0, 0, N'Buffer Manager|Page life expectancy||<|45', N'Page Life Expectancy has fallen under 45 seconds' ),
	-- error number alerts, severity must == 0, and performance_condition must be null
	( N'Error Number 823', 0, 823, NULL, NULL ),
	( N'Error Number 824', 0, 824, NULL, NULL ),
	( N'Error Number 825', 0, 825, NULL, NULL ),
	( N'Error Number 9002', 0, 9002, NULL, N'Error 9002, the transaction log for database $(ESCAPE_SQUOTE(A-DBN)) is full due to ''LOG_BACKUP''.'),
	( N'Error Number 5901', 0, 5901, NULL, N'One or more recovery units belonging to database $(ESCAPE_SQUOTE(A-DBN)) failed to generate a checkpoint.' ),
	( N'Error Number 1101', 0, 1101, NULL, N'Error 1101 has been encountered which signifies a database has run out of file space. ERROR (1101)  this alert is supposed to be triggered on: Could not allocate a new page for database $(ESCAPE_SQUOTE(A-DBN)) because of insufficient disk space in filegroup ''PRIMARY''. ' ),
	( N'Error Number 1105', 0, 1105, NULL, N'Error 1105 has been encountered which signifies a database has run out of file space. Example of the error (1105) this alert is supposed to be triggred on:  Could not allocate space for object "<db_object>" in database $(ESCAPE_SQUOTE(A-DBN)) because the ''PRIMARY'' filegroup is full. ')



IF EXISTS(SELECT 1 FROM [dbo].[sysoperators] s WHERE s.[name] = @operator_name) BEGIN
	EXEC msdb.dbo.sp_delete_operator @name=@operator_name
END

EXEC msdb.dbo.sp_add_operator @name=@operator_name, 
		@enabled=1, 
		@weekday_pager_start_time=000000, 
		@weekday_pager_end_time=235959, 
		@saturday_pager_start_time=000000, 
		@saturday_pager_end_time=235959, 
		@sunday_pager_start_time=000000, 
		@sunday_pager_end_time=235959, 
		@pager_days=127, 
		@email_address=@emails, 
		@pager_address=@pagers, 
		@category_name=N'[Uncategorized]'

--SELECT * FROM [dbo].[sysalerts] s
WHILE EXISTS (SELECT TOP 1 a.[name] FROM @alerts a) BEGIN
	-- get the alert name to work on
	SELECT TOP 1 @alert_name = a.[name], @severity = [a].[severity], @message_id = [a].[message_id], @performance_condition = [performance_condition], @message = [message] 
	FROM @alerts a
	
	PRINT CHAR(10) + 'WORKING ON ' + @alert_name

	-- try to find the alert that matches by name OR ( by message  id || by severity || by performance condition )
	DECLARE @tmpAlertName sysname = (
		SELECT TOP 1 s.[name] 
		FROM [dbo].[sysalerts] s 
		WHERE [s].[name] = @alert_name 
			OR s.[message_id] =  CASE WHEN @message_id = 0 THEN NULL ELSE @message_id END
			OR s.[severity] = CASE WHEN @severity = 0 THEN NULL ELSE @severity END
			OR s.[performance_condition] = ISNULL(@performance_condition, 'NOT SET')
	)

	-- drop the alert if exists
	IF @tmpAlertName IS NOT NULL BEGIN
		PRINT 'DROPPING ' + @tmpAlertName
		EXEC msdb.dbo.sp_delete_alert @name = @tmpAlertName
	END

	PRINT 'ADDING ' + @alert_name
	-- add the alert
	EXEC msdb.dbo.sp_add_alert @name=@alert_name,
		@message_id=@message_id,
		@severity=@severity,
		@enabled=1,
		@delay_between_responses=600,
		@include_event_description_in=1,
		@job_id=N'00000000-0000-0000-0000-000000000000',
		@performance_condition = @performance_condition,
		@notification_message = @message;
	-- add the notification
	EXEC msdb.dbo.sp_add_notification @alert_name=@alert_name, @operator_name=@operator_name, @notification_method = 3;
	
	DELETE TOP (1) FROM @alerts WHERE [name] = @alert_name
END
