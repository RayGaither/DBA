
declare @TheView varchar (50)

set @TheView = 'vwWIP_Aging';
--set @TheView = 'vwTempTime';
--set @TheView = 'vwAR120';
--set @TheView = 'vwAR100';
--set @TheView = 'vwAccountRelationshipsTall';
--set @TheView = 'vwAccountRelationshipsWide';
--set @TheView = 'vwTotalTime';
--set @TheView = 'vwAR120_v2';
--set @TheView = 'vwJournalLinesAddBack';
--set @TheView = 'vwRandom';
--set @TheView = 'vwProjectTime';
--set @TheView = 'vwMissingTime';
--set @TheView = 'vwIncomeStatement';
--set @TheView = 'vwIncomeStatement_PlanLines';

IF  EXISTS (SELECT * FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'[dbo].#temp') 
			AND type in (N'V'))
DROP table #temp;


CREATE TABLE #temp (
name varchar (50),
type	varchar (50),
updated	varchar (50),
selected	varchar (50),
tcolumn varchar (50))


INSERT INTO #temp
EXEC sp_depends @TheView

select distinct name from #temp
select * from #temp
order by name
drop table #temp

go
--select @@SERVERNAME

-- select w.*
-- from 
-- (exec sp_depends 'vwAR100')  w
-- GO

--  sp_depends 'ankura.dw.[dbo].[vwIncomeStatement]') s
-- GO



--  SELECT referencing_schema_name, referencing_entity_name,
-- referencing_id, referencing_class_desc, is_caller_dependent
-- FROM sys.dm_sql_referencing_entities ('dbo.vwIncomeStatement','TYPE');
-- GO


--   SELECT referencing_schema_name, referencing_entity_name,
-- referencing_id, referencing_class_desc, is_caller_dependent
-- FROM sys.dm_sql_referencing_entities('[dbo].[vwAccountRelationshipsTall]','object')

