

--CREATE INDEX [Source_Scenario_TimePeriod] 
--ON [BI360LSS].[dbo].[f_Trans_GL_Detail] ([Source], [Scenario], [TimePeriod])  
--WITH (FILLFACTOR=100);

--CREATE INDEX [Account_Includes] ON [BI360LSS].[dbo].[f_Trans_GL] ([Account])  
--INCLUDE ([Value1], [Dim0], [Dim1], [Dim2], [Dim3], [Category], [Dim4]) 
--WITH (FILLFACTOR=100);

--CREATE INDEX [Dim1_Includes] ON [BI360LSS].[dbo].[f_Trans_OT3] 
--([Dim1])  
--INCLUDE ([Value1], [Dim6], [Dim2], [Dim3], [Dim11], [Dim10]) 
--WITH (FILLFACTOR=100);

--CREATE INDEX [Value1_Includes] ON [BI360LSS].[dbo].[f_Trans_OT3] ([Value1])  
--INCLUDE ([Dim6], [Dim2], [Dim1], [Dim3], [Dim11], [Dim10]) 
--WITH (FILLFACTOR=100);

--CREATE INDEX [Scenario_Dim0_TimePeriod_Includes] 
--ON [BI360LSS].[dbo].[f_Trans_GL] ([Scenario], [Dim0], [TimePeriod])  
--INCLUDE ([Value1], [Dim1], [Dim2], [Dim3]) 
--WITH (FILLFACTOR=100);

--CREATE INDEX [Scenario_TimePeriod_Includes] ON [BI360LSS].[dbo].[f_Trans_GL] ([Scenario], [TimePeriod])  INCLUDE ([Value1], [Dim0], [Dim1], [Dim2], [Dim3]) WITH (FILLFACTOR=100);


--CREATE INDEX [Scenario_Account_TimePeriod_Includes] ON [BI360LSS].[dbo].[f_Trans_GL] ([Scenario], [Account], [TimePeriod])  INCLUDE ([Value1], [Dim0], [Dim1], [Dim2], [Dim3]) WITH (FILLFACTOR=100);



------CREATE INDEX [Scenario_TimePeriod_Includes] ON [BI360LSS].[dbo].[f_Trans_GL] ([Scenario], [TimePeriod])  INCLUDE ([Value1], [Dim0], [Dim1], [Dim2], [Dim3]) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);




------CREATE INDEX [Scenario_Account_TimePeriod_Includes] ON [BI360LSS].[dbo].[f_Trans_GL] ([Scenario], [Account], [TimePeriod])  INCLUDE ([Value1], [Dim1]) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);



------CREATE INDEX [Dim6_Includes] ON [BI360LSS].[dbo].[f_Trans_OT3] ([Dim6])  INCLUDE ([Value1], [Account], [Dim2], [Dim1], [Dim3], [Dim12], [Dim11], [Dim10]) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);



------CREATE INDEX [Scenario_TimePeriod_Includes] ON [BI360LSS].[dbo].[f_Trans_GL] ([Scenario], [TimePeriod])  INCLUDE ([Value1], [Dim1]) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);



------CREATE INDEX [Scenario_TimePeriod_Source] ON [BI360LSS].[dbo].[f_Trans_GL] ([Scenario], [TimePeriod], [Source])  WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);



------CREATE INDEX [Dim12_Includes] ON [BI360LSS].[dbo].[f_Trans_OT3] ([Dim12])  INCLUDE ([Value1], [Dim6], [Account], [Dim2], [Dim1], [Dim3], [Dim11], [Dim10]) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);



------CREATE INDEX [Dim1_Includes] ON [BI360LSS].[dbo].[f_Trans_OT3] ([Dim1])  INCLUDE ([Value1], [Dim6], [Account], [Dim2], [Dim3], [Dim12], [Dim11], [Dim10]) WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=?, DATA_COMPRESSION=?);






ALTER TABLE [BI360LSS].[log].[JobLog] REBUILD;
ALTER TABLE [BI360LSS].[meta].[DimensionAttribute] REBUILD;
ALTER TABLE [BI360LSS].[meta].[ModuleAttribute] REBUILD;
ALTER TABLE [BI360LSS].[meta].[ModuleDimensionMap] REBUILD;
ALTER TABLE [BI360LSS].[common].[Licenses] REBUILD;
ALTER TABLE [BI360LSS].[log].EtlJobStepLog REBUILD;
SELECT OBJECT_NAME(object_id) AS table_name, forwarded_record_count, avg_fragmentation_in_percent, page_count
FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID('Posts'), DEFAULT, DEFAULT, 'DETAILED');


