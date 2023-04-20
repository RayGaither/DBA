<<<<<<< HEAD
use ankura_dw
go

SELECT name
      ,type
      ,reason
      ,score
	  ,valid_since
      ,last_refresh
      ,state
      ,is_executable_action
      ,is_revertable_action
      ,execute_action_start_time
      ,execute_action_duration
      ,execute_action_initiated_by
      ,execute_action_initiated_time
      ,revert_action_start_time
      ,revert_action_duration
      ,revert_action_initiated_by
      ,revert_action_initiated_time
      ,details
=======
use ankura_dw
go

SELECT name
      ,type
      ,reason
      ,score
	  ,valid_since
      ,last_refresh
      ,state
      ,is_executable_action
      ,is_revertable_action
      ,execute_action_start_time
      ,execute_action_duration
      ,execute_action_initiated_by
      ,execute_action_initiated_time
      ,revert_action_start_time
      ,revert_action_duration
      ,revert_action_initiated_by
      ,revert_action_initiated_time
      ,details
>>>>>>> master
  FROM ankura_dw.sys.dm_db_tuning_recommendations