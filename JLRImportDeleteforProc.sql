<<<<<<< HEAD
--select  datepart(year,AccountingDate), datepart(month,AccountingDate)
--from [dbo].[JournalLinesRaas]
--where datepart(year,AccountingDate) = '2021'
--and datepart(month,AccountingDate) = '05'


Declare @MaxAcctDate	datetime
Declare @MinAcctDate	datetime
Declare @b4DelCnt		int
Declare @NumberRowsDeleted	int
Declare @finalCnt		int

Select @b4DelCnt = count(1)
from ray.JournalLinesRaastest

--Get date range from Import table
Select	@MaxAcctDate = Max(AccountingDate),
		@MinAcctDate = Min(AccountingDate)
from ray.JournalLinesRaasImporttest


--Delete rows in base table in the date range
--select  Min(AccountingDate), Max(AccountingDate)
delete
from ray.JournalLinesRaastest
where AccountingDate between @MinAcctDate and @MaxAcctDate
Select @NumberRowsDeleted = @@ROWCOUNT

Select @finalCnt = count(1)
from ray.JournalLinesRaastest

Select @b4DelCnt as beforeCount
	, @NumberRowsDeleted as aftercount
	, @finalCnt as FinalCt

--Select count(*)
--from ray.JournalLinesRaastest
--where AccountingDate between '2021-05-01' and '2021-05-31'

--Select count(*)
--from ray.JournalLinesRaasImporttest
--where AccountingDate between '2021-05-01' and '2021-05-31'
=======
--select  datepart(year,AccountingDate), datepart(month,AccountingDate)
--from [dbo].[JournalLinesRaas]
--where datepart(year,AccountingDate) = '2021'
--and datepart(month,AccountingDate) = '05'


Declare @MaxAcctDate	datetime
Declare @MinAcctDate	datetime
Declare @b4DelCnt		int
Declare @NumberRowsDeleted	int
Declare @finalCnt		int

Select @b4DelCnt = count(1)
from ray.JournalLinesRaastest

--Get date range from Import table
Select	@MaxAcctDate = Max(AccountingDate),
		@MinAcctDate = Min(AccountingDate)
from ray.JournalLinesRaasImporttest


--Delete rows in base table in the date range
--select  Min(AccountingDate), Max(AccountingDate)
delete
from ray.JournalLinesRaastest
where AccountingDate between @MinAcctDate and @MaxAcctDate
Select @NumberRowsDeleted = @@ROWCOUNT

Select @finalCnt = count(1)
from ray.JournalLinesRaastest

Select @b4DelCnt as beforeCount
	, @NumberRowsDeleted as aftercount
	, @finalCnt as FinalCt

--Select count(*)
--from ray.JournalLinesRaastest
--where AccountingDate between '2021-05-01' and '2021-05-31'

--Select count(*)
--from ray.JournalLinesRaasImporttest
--where AccountingDate between '2021-05-01' and '2021-05-31'
>>>>>>> master
