 
/*
	Rename database Steps
	
	1.	Set to RESTRICTED_USER
	2. detach database
	3. rename the mdf and ldf files
	4. attach files using new DB name
*/
-- 'rollback immediate' will disconnect existing users w/out
-- waiting for transactions to finish.


-- get users off DB
ALTER DATABASE [ankura_dw] SET OFFLINE WITH ROLLBACK IMMEDIATE
go
ALTER DATABASE [ankura_dw] SET ONLINE
go


ALTER DATABASE [ankura_dw] SET  RESTRICTED_USER WITH NO_WAIT
GO

GO

 
 -- detach
 EXEC sp_detach_db 'ankura_dw', 'true'


 -- RENAME ldf and mdf files



 --reattach database with new name

 EXEC sp_attach_db @dbname = N'Old_Dev_ankura_dw',
@filename1 = N'E:\SQLDB\DATA1\Old_Dev_ankura_dw_data.mdf',
@filename2 = N'F:\SQLLOG\LOG1\Old_Dev_ankura_dw_log.ldf'

