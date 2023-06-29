CREATE INDEX [Aclara_SN_Includes] ON [real_time].[dbo].[PyPower_Results] ([Aclara_SN])  
INCLUDE ([Date]) 
WITH (FILLFACTOR=100, ONLINE=?, SORT_IN_TEMPDB=on, DATA_COMPRESSION=?);






ALTER TABLE [real_time].[dbo].[PyPower_Results] REBUILD;
ALTER TABLE [real_time].[dbo].[I210_Seals_Preppa] REBUILD;
ALTER TABLE [real_time].[dbo].[PyPower_TOU_Result] REBUILD;





--currently on dev

USE [real_time]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [Performance_IX]    Script Date: 6/28/2023 5:14:16 PM ******/
CREATE CLUSTERED INDEX [Performance_IX] ON [dbo].[PyPower_Results]
(
	[Aclara_SN] DESC,
	[Date] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

