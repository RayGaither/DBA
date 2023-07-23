/*
This query text was retrieved from showplan XML, and may be truncated.
*/
set statistics IO, TIME on
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--CREATE PROCEDURE [dbo].[LoadGLStagingFromAzure_5x] 
--	-- Add the parameters for the stored procedure here
--	@BegDate datetime, 
--	@EndDate Datetime
--AS
--BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
--Truncate table AzureGLStaging;
	

	
--INSERT INTO [dbo].[AzureGLStaging]
--           ([Scenario]
--           ,[Entity]
--           ,[Account]
--           ,[HasLID]
--           ,[Value1]
--           ,[Value2]
--           ,[Value3]
--           ,[TimePeriod]
--           ,[RowComment]
--           ,[Source]
--           ,[RuleID]
--           ,[CreatedOn]
--           ,[CreatedBY]
--           ,[UpdatedOn]
--           ,[UpdatedBY]
--           ,[AccountString]
--           ,[Community]
--           ,[LOS]
--           ,[DEPT]
--           ,[Category]
--           ,[c_JournalEntry]
--           ,[c_reference]
--           ,[c_TrxSource]
--           ,[c_SourceDoc]
--           ,[c_originalsource]
--           ,[c_OriginalMasterID]
--           ,[c_OriginalMasterName]
--           ,[c_OriginalDocumentNumber]
--           ,[c_BatchNumber]
--           ,[c_Series]
--           ,[c_LastUser]
--           ,[c_OriginalPostedDate]
--           ,[c_DateLastEdited]
--           ,[c_userwhoposted])
	--(
	select  
	1 as Scenario,
	1 as Entity,
	SLV.FD1 as Account,
	0 as HasLID,
	(SLV.TRANSACTIONCURRENCYCREDITAMOUNT * -1) + SLV.TRANSACTIONCURRENCYDEBITAMOUNT as Value1,
	SLV.TRANSACTIONCURRENCYCREDITAMOUNT as Value2,
	SLV.TRANSACTIONCURRENCYDEBITAMOUNT as Value3,
SLV.ACCOUNTINGDATE as TimePeriod,										--Convert(varchar, SLV.ACCOUNTINGDATE, 112) as TimePeriod,
	Null as RowComment,
	'D365' as Source,
	Null as RuleID,
	getdate() as CreatedOn,
	'LoadGLStagingFromAzure_5x' as CreatedBY,
	GetDate() as UpdatedOn,
    Cast(SUSER_SNAME() as varchar(50)) as UpdatedBy,		--Cast(SUSER_SNAME() as nvarchar(50)) as UpdatedBy,
	SLV.fd2 +'-'+ SLV.FD3 +'-'+ SLV.FD1 +'-'+ Left(slv.fd4, 2) as AccountString,
	Cast(SLV.FD2 as char(2)) as Company,
	cast(SLV.FD3 as Char(2)) as LOS,
	cast(left(SLV.FD4, 2) as char(2)) as DEPT,
	2 as Category,
	SLV.LedgerEntryJournalID as c_JournalEntry,
	SLV.DESCRIPTION as c_reference,
	SLV.JOURNALNUMBER as c_TrxSource,
	Case
		when slv.subledgervoucher like 'API%' then 'API'
		when slv.subledgervoucher like 'PAY%' then 'PAY'
		when slv.subledgervoucher like 'REV%' then 'REV'
		when slv.subledgervoucher like 'GJN%' then 'GJ'
		when slv.subledgervoucher like 'INTCO%' then 'INTCO'
		when slv.subledgervoucher like 'INV%' then 'INV'
		when slv.subledgervoucher like 'DEP%' then 'DEP'
		when slv.subledgervoucher like 'EXR%' then 'EXR'
		when slv.subledgervoucher like 'VP%' then 'VP'
	else
		'N/A' 
	End as c_SourceDoc,
	SLV.VOUCHER as c_originalsource,
	vs.vendor as c_OriginalMasterID,
	v.VendorOrganizationName as c_OriginalMasterName,
	vs.INVOICENO   as c_OriginalDocumentNumber,
	SLV.VOUCHER as c_BatchNumber,
	SLV.VOUCHER   as c_Series, 
	SLV.GJCreatedBY as c_LastUser,
	SLV.GJCreatedDateTime as c_OriginalPostedDate,
	SLV.GJCreatedDateTime as c_DateLastEdited,
	SLV.GJCREATEDBY as c_userwhoposted
from [D365_Azure].[d365_Azure_SQL_Exports].dbo.SLVGeneralJournalAccountEntryStaging as SLV
	left outer join [D365_Azure].[d365_Azure_SQL_Exports].dbo.LedgerJournalLineCDSStaging as LCDS on (slv.LEDGERENTRYJOURNALID = LCDS.JOURNALBATCHNUMBER
																									  and slv.SUBLEDGERVOUCHER = LCDS.VOUCHER
																									  and slv.TEXT = lcds.TEXT
																									  and LCDS.ACCOUNTDISPLAYVALUE like '[A-Z]%'
																									   )
	left outer join [D365_Azure].[d365_Azure_SQL_Exports].dbo.SLVVendorSpendStaging VS on SLV.GENERALJOURNALACCOUNTENTRYRECID = VS.TRANSACTIONID
	left outer join [D365_Azure].[d365_Azure_SQL_Exports].dbo.VendVendorV2Staging V on vs.vendor = V.VendorAccountNumber
--Where SLV.GJCreatedDateTime Between @BegDate and @EndDate
where SLV.ACCOUNTINGDATE Between '2023-07-20' and '2023-07-21'
	and slv.fiscalcalendarperiodname <> 'Period 13'  -- removes closing entries
	and SLV.fd2 not in ('76', '77', '78', '84', '98', '99') -- HUD Communities		--and SLV.fd2 not in (76, 77, 78, 84, 98, 99)
	--and  SLV.GJCreatedDateTime >= '20211220' -- Originally used to only pull part of December 2021 data
	and	SLV.LedgerEntryJournalID not in ('JBNUM00001','JBNUM00002','JBNUM00003','JBNUM00004','JBNUM00005','JBNUM00006')--,  --ignores Dec 2021 history records
								--		'JBNUM00007','JBNUM00008')
declare @recordcount  INT;

set @recordcount = (select count(*) from AzureGLStaging)
Insert into z_D365_Data_Log
values( GETDATE(), @recordcount, 'LoadGLStagingFromAzure_5x', 'LSS')

