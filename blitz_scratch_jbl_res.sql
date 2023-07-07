
exec [sp_Blitz]  -- Health  check


exec sp_blitzwho
--kill 218
--kill 268 --DESKTOP-UBDGP8J	10.81.0.219	6/30/23 12:24 PM


DBA.[dbo].sp_BlitzCache -- find bad queries

exec [sp_BlitzFirst] -- instance performance

exec sp_BlitzIndex --design correct index


exec sp_Whoisactive @get_locks = 1

DBCC USEROPTIONS

exec sp_WhoIsActive @get_additional_info = 1

--DECLARE @IMPLICIT_TRANSACTIONS VARCHAR(3) = 'OFF';  
--IF ( (2 & @@OPTIONS) = 2 ) SET @IMPLICIT_TRANSACTIONS = 'ON';  
--SELECT @IMPLICIT_TRANSACTIONS AS IMPLICIT_TRANSACTIONS;

--USE [ERM]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [KVDBA].[term_calibration_results] ([status])
--INCLUDE ([ge_serial_no])

--CREATE INDEX [ass_serial_no_term_calibration_results] 
--ON [ERM].[KVDBA].[term_calibration_results] 
--( [assembly_serial_no], [identity_no] ) 
--WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);
/****** Object:  Index [ass_serial_no_term_calibration_results]    Script Date: 6/28/2023 6:47:23 PM ******/
--CREATE NONCLUSTERED INDEX [ass_serial_no_term_calibration_results] 
--ON [KVDBA].[term_calibration_results]
--([assembly_serial_no] ASC,
--[identity_no] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--GO





[real_time].[dbo].[PyPower_Results] Est. benefit per day: 373,842

--CREATE INDEX [base_serial_no_term_calibration_results] ON 
--[ERM].[KVDBA].[term_calibration_results] 
--( [base_serial_no], [base_assembly_date_code], [identity_no] ) 
--WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);




EXEC dbo.sp_BlitzIndex @DatabaseName='real_time',
@SchemaName='KVDBA', @TableName='I210_Matchpoint_Data';



EXEC dbo.sp_BlitzIndex @DatabaseName='ERM', @SchemaName='KVDBA', @TableName='term_calibration_results';

--CREATE INDEX [amr_serial_no_term_calibration_results] ON [ERM].[KVDBA].[term_calibration_results] ( [amr_serial_no], [identity_no] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);
--CREATE INDEX [ass_catalog_no_term_calibration_results] ON [ERM].[KVDBA].[term_calibration_results] ( [assembly_catalog_no], [identity_no] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);
--CREATE INDEX [ass_serial_no_term_calibration_results] ON [ERM].[KVDBA].[term_calibration_results] ( [assembly_serial_no], [identity_no] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);
--CREATE INDEX [base_relay_serial_no_term_calibration_results] ON [ERM].[KVDBA].[term_calibration_results] ( [base_relay_serial_no], [identity_no] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);
--CREATE INDEX [base_serial_no_term_calibration_results] ON [ERM].[KVDBA].[term_calibration_results] ( [base_serial_no], [base_assembly_date_code], [identity_no] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);

--ALTER TABLE [ERM].[KVDBA].[term_calibration_results] ADD CONSTRAINT [PK_term_calibration_results] PRIMARY KEY ( [ge_serial_no], [test_complete_time] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);
--CREATE UNIQUE CLUSTERED INDEX [identity_no_clustered_term_calibration_results] ON [ERM].[KVDBA].[term_calibration_results] ( [identity_no] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);
--CREATE INDEX [module_serial_no_term_calibration_results] ON [ERM].[KVDBA].[term_calibration_results] ( [meter_module_serial_no], [meter_module_date_code], [identity_no] ) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);


--SELECT * FROM [ERM].sys.column_store_row_groups WHERE object_id = 1705773134



EXEC dbo.sp_BlitzIndex @DatabaseName='real_time', @SchemaName='dbo', @TableName='PyPower_Results';



ALTER TABLE [real_time].[dbo].[PyPower_Results] REBUILD;
CREATE INDEX [Aclara_SN_Includes] ON [real_time].[dbo].[PyPower_Results] 
([Aclara_SN])  INCLUDE ([Date]) 
WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);

ALTER TABLE [real_time].[dbo].[PyPower_Results] REBUILD;