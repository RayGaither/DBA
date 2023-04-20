USE [ankura_dw]
GO

/****** Object:  StoredProcedure [dbo].[JournalLinesTransformSp]    Script Date: 8/5/2021 7:13:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--create procedure [dbo].[JournalLinesTransformSp] (
--    @DataSourceCode         varchar(20)     --WD_JOURNALLINES
--    ,@BatchControlNbr       varchar(20)     --YYYYMMDD
--    ,@BatchControlPage      int
--    ,@DateRangeParam        varchar(20)     --in (Accounting, Updated)
--    )
as
begin

/***************************************************************************

   FILE NAME:  JournalLinesTransformSp.sql
   
 DESCRIPTION:  Delete for BatchControlNbr from InTappTimeEntries.
               Inserts into InTappTimeEntries from InTappTimeEntriesImport for BatchControlNbr.
					
      AUTHOR:  David C. Rudd
     CREATED:  15 Apr 2021

MODIFICATION HISTORY:
WHEN     		WHO		  		WHAT
-------------  --------------- -------------------------------------------------------
15 Apr 2021 	David C. Rudd	Created.
03 May 2021 	David C. Rudd	Removed datetime transformation.  SSIS is converting all string lengths to datetime properly.
                                Changed modifyDate,workDate,createDate,releaseDate to datetime in InTappTimeEntriesImport.
04 May 2021 	David C. Rudd	Added TempTimeCommentTxt for parsed values of matterId contining a dollar sign.
07 May 2021 	David C. Rudd	Removed datetime transformation for Andrew.  Merged with InTappTimeEntriesImportSp.
12 May 2021 	David C. Rudd	Added BatchControlPage.
13 May 2021 	David C. Rudd	Renamed WorkdayJournalLinesTransformSp-->JournalLinesTransformSp.
14 May 2021 	David C. Rudd	Customer_Invoice_Reference_ID is joined with CustomerInvoices in order to get [Invoice_Number].
                                Changed datetime to datetime2.
25 May 2021 	David C. Rudd	Version 20210525.  Added Supplier_Invoice_Reference_ID;Supplier_Reference_ID;Supplier_ID. 
                                Dropped CustomerContractId;CustomerInvoiceId.  These values cannot be parsed from Customer_Contract_Reference_ID;Customer_Invoice_Reference_ID.
                                Changed datatype of Currency_Rate to numeric(19,12) and added numeric check.
04 Jun 2021     David C. Rudd   Added Last_Updated_Date/LastUpdatedDate;Journal_Line_Number.  
                                Renamed Journal_Entry_Reference-->Journal_Entry_Reference_WID.
                                Removed Ledger_Reference_ID.  
                                Version 20210604.
11 Jun 2021     David C. Rudd Added Expense_Item_ID  Version 20210611.
***************************************************************************/
/* TEST
declare 
    @DataSourceCode    varchar(10)    
    ,@BatchControlNbr    varchar(10)
    ,@BatchControlPage  int
    ,@DateRangeParam    varchar(20)
select 
    @DataSourceCode    = 'WD_JOURNALLINES'
    ,@BatchControlNbr    = '20210315'
    ,@BatchControlPage  = 1
    ,@DateRangeParam    = 'Accounting'    --Updated

exec JournalLinesTransformSp @DataSourceCode, @BatchControlNbr, @BatchControlPage, @DateRangeParam
*/                             

SET NOCOUNT ON --required for Tableau access!!    
declare @now datetime
set @now = getdate()
    
--******************************************************************************
-- Transform and parse raw text into qualified datatypes.
-- workDate range is only of INSERTS
--******************************************************************************
if @DateRangeParam = 'Accounting'
    begin
    --******************************************************************************
    --Delete by DataSourceCode + DataSourceId all IDs in batch.
    --******************************************************************************
    delete from JournalLines
    where DataSourceCode = 'WD_JOURNALLINES'                                     --performance enhancer with index.
        and BatchControlNbr = @BatchControlNbr  --does not work for Updated processing.
        and BatchControlPage = @BatchControlPage

    --******************************************************************************
    -- Accounting range is only of INSERTS
    --******************************************************************************
    insert into JournalLines
        (
        DataSourceCode                   
        ,DataSourceId                    
        ,Journal_Entry_Reference_WID         
        ,Journal_Line_Number
        ,ExcludeFromSpendReportYN
        ,Journal_Entry_Status_ID         
        --*DEPRECATED*,Ledger_Reference_ID             
        ,Journal_Source_ID               
        ,Customer_Invoice_Reference_ID   
        ,Customer_Contract_Reference_ID  
        ,Customer_ID   
        ,Supplier_Invoice_Reference_ID  
        ,Supplier_Reference_ID          
        ,Supplier_ID                    
        ,AccountingDate                  
        ,TransactionDate                
        ,CreationDate  
        ,LastUpdatedDate
        ,CreationDateUTCOffset                 
        ,JournalCompanyId                
        ,LedgerAccountId                 
        ,LedgerCurrencyId                
        ,Debit_Amount                    
        ,Credit_Amount                   
        ,Currency_Rate                   
        ,LedgerDebitAmount               
        ,LedgerCreditAmount              
        ,ProjectId                       
        ,RevenueCategoryId               
        ,SpendCategoryId                 
        ,CostCenterId     
        ,ExpenseItemId               
        ,BatchControlNbr                 
        ,BatchControlPage                
        ,LoadedDate                      
        )
    select
        @DataSourceCode                             as DataSourceCode                   
        ,Journal_Entry_Reference_WID                    as DataSourceId                    
        ,Journal_Entry_Reference_WID                    as Journal_Entry_Reference_WID         
    	,case 
           when rtrim(ltrim(isnull(Journal_Line_Number,'0')))='0' 
               then convert(varchar(30),ROW_NUMBER() OVER (PARTITION BY Journal_Entry_Reference_WID ORDER BY Debit_Amount desc, Credit_Amount desc)) 
           else Journal_Line_Number 
         end                                                                    as [Journal_Line_Number]	 
        ,case when Exclude_from_Spend_Report='1' then 'Y' else 'N' end                  as ExcludeFromSpendReportYN
        ,Journal_Entry_Status_ID                    as Journal_Entry_Status_ID         
        --*DEPRECATED*,Ledger_Reference_ID                        as Ledger_Reference_ID             
        ,Journal_Source_ID                          as Journal_Source_ID               
        ,Customer_Invoice_Reference_ID              as Customer_Invoice_Reference_ID   
        ,Customer_Contract_Reference_ID             as Customer_Contract_Reference_ID  
        ,Customer_ID                                as Customer_ID                     
        ,Supplier_Invoice_Reference_ID              as Supplier_Invoice_Reference_ID
        ,Supplier_Reference_ID                      as Supplier_Reference_ID        
        ,Supplier_ID                                as Supplier_ID                  
        ,convert(datetime2,Accounting_Date,121)     as AccountingDate                  
        ,convert(datetime2,Transaction_Date,121)    as TransactionDate                
        ,case when datalength(Creation_Date) > 0 then convert(datetime2,substring(Creation_Date,1,datalength(Creation_Date)-6),127) end   as CreationDate
        ,case when datalength(Last_Updated_Date) > 0 then convert(datetime2,substring(Last_Updated_Date,1,datalength(Last_Updated_Date)-6),127) end   as LastUpdatedDate
        ,substring(Creation_Date,datalength(Creation_Date)-5,6)    as CreationDateUTCOffset
        ,Company_Reference_ID                       as JournalCompanyId                
        ,Ledger_Account_ID                          as LedgerAccountId                 
        ,Currency_ID                                as LedgerCurrencyId                
        ,Debit_Amount                               as Debit_Amount                    
        ,Credit_Amount                              as Credit_Amount                   
        ,case when isnumeric(Currency_Rate)=1 then Currency_Rate else '1.0' end           as Currency_Rate                   
        ,Ledger_Debit_Amount                        as LedgerDebitAmount               
        ,Ledger_Credit_Amount                       as LedgerCreditAmount              
        ,Project_ID                                 as ProjectId                       
        ,Revenue_Category_ID                        as RevenueCategoryId               
        ,Spend_Category_ID                          as SpendCategoryId                 
        ,Cost_Center_Reference_ID                   as CostCenterId                    
        ,Expense_Item_ID                            as ExpenseItemId
        ,@BatchControlNbr                           as BatchControlNbr                 
        ,@BatchControlPage                          as BatchControlPage
        ,@now                                       as LoadedDate                      
    from JournalLinesImport

    end
end
GO


