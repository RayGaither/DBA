

select at.name,
 case at.transaction_type   
      when 1 then 'Read/Write'   
      when 2 then 'Read-Only'    
      when 3 then 'System'   
      when 4 then 'Distributed'  
      else 'Unknown - ' + convert(varchar(20), transaction_type)     
 end as tranType ,
  case at.transaction_state 
      when 0 then 'Uninitialized' 
      when 1 then 'Not Yet Started' 
      when 2 then 'Active' 
      when 3 then 'Ended (Read-Only)' 
      when 4 then 'Committing' 
      when 5 then 'Prepared' 
      when 6 then 'Committed' 
      when 7 then 'Rolling Back' 
      when 8 then 'Rolled Back' 
      else 'Unknown - ' + convert(varchar(20), transaction_state) 
 end as tranState, 
 case at.dtc_state 
      when 0 then NULL	
      when 1 then 'Active' 
      when 2 then 'Prepared' 
      when 3 then 'Committed' 
      when 4 then 'Aborted' 
      when 5 then 'Recovered' 
      else 'Unknown - ' + convert(varchar(20), dtc_state) 
 end as dtcState

 ,s.*
, at.*
from sys.dm_tran_session_transactions s

LEFT OUTER JOIN sys.dm_tran_session_transactions st on s.session_id = st.session_id
LEFT OUTER JOIN sys.dm_tran_active_transactions at on st.transaction_id = at.transaction_id

where at.name = 'implicit_transaction'


EXEC sp_WhoIsActive

