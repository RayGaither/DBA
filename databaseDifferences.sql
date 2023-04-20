<<<<<<< HEAD
use ankura_dw
go



Declare @UpperSvr SYSNAME = 'ANKSVMDWSQLP006'
Declare @UpperShrt Varchar(4) = right(@UpperSvr,4)
Declare @LowerSvr Varchar(40) = 'ANKSVMDWSQLP004'
Declare @LowerShrt Varchar(4) = right(@LowerSvr,4)
declare @sysObj Varchar(39) = @UpperSvr+'.ankura_dw.sys.objects'
Declare @SQLStmt	NVarchar(1500)
--Select @LowerShrt

Set @SQLStmt =
'select case 
	When UP.modify_date > LOW.modify_date Then ''' + @UpperShrt + '''
	 Else ''' + @LowerShrt + '''
 End As ' + '''Newer Object On Server''' +
' ,Case 
	When LOW.name is null then ' + '''Missing on ' + @LowerShrt + '''' +
'	When UP.name is null then ' + '''Missing on ' + @UpperShrt + '''' +
' Else ' + '''Not Missing'''  +
' End as ' + '''Missing Object''' +
' , UP.name as UpperName, LOW.name as LowerName ' +
' , UP.Type, LOW.type, UP.modify_date as Four_ModDate ' +
' , LOW.modify_date as TwoModDate ' + --, UP.* 
' from sys.objects LOW ' +
' Left join ' + @UpperSvr + '.ankura_dw.sys.objects UP on LOW.name = UP.name ' +
--left missing on Upper
--right misssig on Lower
-- stright, only returns newest object results
' where 1 = 1 ' +
' and (UP.type = ' + '''U''' + ' or UP.type = ' + '''P''' + ' or UP.type = ' + '''V''' + ' or LOW.type = ' + '''U''' + ' or LOW.type = ' + '''P''' + ' or LOW.type = ' + '''U''' + ') '


+'UNION ALL ' +

'select case 
	When UP.modify_date > LOW.modify_date Then ''' + @UpperShrt + '''
	 Else ''' + @LowerShrt + '''
 End As ' + '''Newer Object On Server''' +
' ,Case 
	When LOW.name is null then ' + '''Missing on ' + @LowerShrt + '''' +
'	When UP.name is null then ' + '''Missing on ' + @UpperShrt + '''' +
' Else ' + '''Not Missing'''  +
' End as ' + '''Missing Object''' +
' , UP.name as UpperName, LOW.name as LowerName ' +
' , UP.Type, LOW.type, UP.modify_date as Four_ModDate ' +
' , LOW.modify_date as TwoModDate ' + --, UP.* 
' from sys.objects LOW ' +
' Right join ' + @UpperSvr + '.ankura_dw.sys.objects UP on LOW.name = UP.name ' +
--left missing on Upper
--right misssig on Lower
-- stright, only returns newest object results
' where 1 = 1 ' +
' and (UP.type = ' + '''U''' + ' or UP.type = ' + '''P''' + ' or UP.type = ' + '''V''' + ' or LOW.type = ' + '''U''' + ' or LOW.type = ' + '''P''' + ' or LOW.type = ' + '''U''' + ') '


--select @SQLStmt


select case    
When UP.modify_date > LOW.modify_date 
Then 'P006'    
Else 'P004'   
End As 'Newer Object On Server' 
,Case    When LOW.name is null then 'Missing on P004' 
When UP.name is null then 'Missing on P006' 
Else 'Not Missing' End as 'Missing Object' 
, UP.name as UpperName, LOW.name as LowerName  
, UP.Type, LOW.type, UP.modify_date as Six_ModDate  
, LOW.modify_date as FourModDate  
from sys.objects LOW  
Left join ANKSVMDWSQLP006.ankura_dw.sys.objects UP on LOW.name = UP.name  
where 1 = 1  
and (UP.type = 'U' or UP.type = 'P' or UP.type = 'V' or LOW.type = 'U' or LOW.type = 'P' or LOW.type = 'U') 
UNION ALL select 
case    
When UP.modify_date > LOW.modify_date Then 'P006'    
Else 'P004'   
End As 'Newer Object On Server' 
,Case    
When LOW.name is null then 'Missing on P004' 
When UP.name is null then 'Missing on P006' 
Else 'Not Missing' 
End as 'Missing Object' 
, UP.name as UpperName, LOW.name as LowerName  
, UP.Type, LOW.type
, UP.modify_date as SIX_ModDate  
, LOW.modify_date as FourModDate  
from sys.objects LOW  
Right join ANKSVMDWSQLP006.ankura_dw.sys.objects UP on LOW.name = UP.name  
where 1 = 1  
and (UP.type = 'U' or UP.type = 'P' or UP.type = 'V' or LOW.type = 'U' or LOW.type = 'P' or LOW.type = 'U')







=======
use ankura_dw
go



Declare @UpperSvr SYSNAME = 'ANKSVMDWSQLP006'
Declare @UpperShrt Varchar(4) = right(@UpperSvr,4)
Declare @LowerSvr Varchar(40) = 'ANKSVMDWSQLP004'
Declare @LowerShrt Varchar(4) = right(@LowerSvr,4)
declare @sysObj Varchar(39) = @UpperSvr+'.ankura_dw.sys.objects'
Declare @SQLStmt	NVarchar(1500)
--Select @LowerShrt

Set @SQLStmt =
'select case 
	When UP.modify_date > LOW.modify_date Then ''' + @UpperShrt + '''
	 Else ''' + @LowerShrt + '''
 End As ' + '''Newer Object On Server''' +
' ,Case 
	When LOW.name is null then ' + '''Missing on ' + @LowerShrt + '''' +
'	When UP.name is null then ' + '''Missing on ' + @UpperShrt + '''' +
' Else ' + '''Not Missing'''  +
' End as ' + '''Missing Object''' +
' , UP.name as UpperName, LOW.name as LowerName ' +
' , UP.Type, LOW.type, UP.modify_date as Four_ModDate ' +
' , LOW.modify_date as TwoModDate ' + --, UP.* 
' from sys.objects LOW ' +
' Left join ' + @UpperSvr + '.ankura_dw.sys.objects UP on LOW.name = UP.name ' +
--left missing on Upper
--right misssig on Lower
-- stright, only returns newest object results
' where 1 = 1 ' +
' and (UP.type = ' + '''U''' + ' or UP.type = ' + '''P''' + ' or UP.type = ' + '''V''' + ' or LOW.type = ' + '''U''' + ' or LOW.type = ' + '''P''' + ' or LOW.type = ' + '''U''' + ') '


+'UNION ALL ' +

'select case 
	When UP.modify_date > LOW.modify_date Then ''' + @UpperShrt + '''
	 Else ''' + @LowerShrt + '''
 End As ' + '''Newer Object On Server''' +
' ,Case 
	When LOW.name is null then ' + '''Missing on ' + @LowerShrt + '''' +
'	When UP.name is null then ' + '''Missing on ' + @UpperShrt + '''' +
' Else ' + '''Not Missing'''  +
' End as ' + '''Missing Object''' +
' , UP.name as UpperName, LOW.name as LowerName ' +
' , UP.Type, LOW.type, UP.modify_date as Four_ModDate ' +
' , LOW.modify_date as TwoModDate ' + --, UP.* 
' from sys.objects LOW ' +
' Right join ' + @UpperSvr + '.ankura_dw.sys.objects UP on LOW.name = UP.name ' +
--left missing on Upper
--right misssig on Lower
-- stright, only returns newest object results
' where 1 = 1 ' +
' and (UP.type = ' + '''U''' + ' or UP.type = ' + '''P''' + ' or UP.type = ' + '''V''' + ' or LOW.type = ' + '''U''' + ' or LOW.type = ' + '''P''' + ' or LOW.type = ' + '''U''' + ') '


--select @SQLStmt


select case    
When UP.modify_date > LOW.modify_date 
Then 'P006'    
Else 'P004'   
End As 'Newer Object On Server' 
,Case    When LOW.name is null then 'Missing on P004' 
When UP.name is null then 'Missing on P006' 
Else 'Not Missing' End as 'Missing Object' 
, UP.name as UpperName, LOW.name as LowerName  
, UP.Type, LOW.type, UP.modify_date as Six_ModDate  
, LOW.modify_date as FourModDate  
from sys.objects LOW  
Left join ANKSVMDWSQLP006.ankura_dw.sys.objects UP on LOW.name = UP.name  
where 1 = 1  
and (UP.type = 'U' or UP.type = 'P' or UP.type = 'V' or LOW.type = 'U' or LOW.type = 'P' or LOW.type = 'U') 
UNION ALL select 
case    
When UP.modify_date > LOW.modify_date Then 'P006'    
Else 'P004'   
End As 'Newer Object On Server' 
,Case    
When LOW.name is null then 'Missing on P004' 
When UP.name is null then 'Missing on P006' 
Else 'Not Missing' 
End as 'Missing Object' 
, UP.name as UpperName, LOW.name as LowerName  
, UP.Type, LOW.type
, UP.modify_date as SIX_ModDate  
, LOW.modify_date as FourModDate  
from sys.objects LOW  
Right join ANKSVMDWSQLP006.ankura_dw.sys.objects UP on LOW.name = UP.name  
where 1 = 1  
and (UP.type = 'U' or UP.type = 'P' or UP.type = 'V' or LOW.type = 'U' or LOW.type = 'P' or LOW.type = 'U')







>>>>>>> master
