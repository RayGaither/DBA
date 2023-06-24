select s.session_id, t.name
from sys.dm_tran_session_transactions s
    inner join sys.dm_tran_active_transactions t ON s.transaction_id = t.transaction_id