USE [ERM]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [amr_serial_no_term_calibration_results]    Script Date: 7/7/2023 9:25:12 AM ******/
CREATE NONCLUSTERED INDEX [amr_serial_no_term_calibration_results] ON [KVDBA].[term_calibration_results]
(
	[amr_serial_no] ASC,
	[identity_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


USE [ERM]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [ass_serial_no_term_calibration_results]    Script Date: 7/7/2023 9:25:43 AM ******/
CREATE NONCLUSTERED INDEX [ass_serial_no_term_calibration_results] ON [KVDBA].[term_calibration_results]
(
	[assembly_serial_no] ASC,
	[identity_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

