WITH cte as(
  SELECT ROW_NUMBER() OVER (PARTITION BY [specimen id]
                            ORDER BY  quicklabdumpid DESC ) RN
  FROM   quicklabdump)
delete from cte where RN>1









No need for partition

delete q
  from quicklabdump q
  where exists
  (
    select *
      from quicklabdump q2
      where q2.[specimen id] = q.[specimen id] and
        q2.quicklabdumpID > q.quicklabdumpID
  )


