-- LeetCode No. 1285 Find the Start and End Number of Continuous Ranges
-- MySQL
with
  cte as (
    select
      log_id,
      log_id - row_number() over () as rn_grp
    from
      logs
    order by
      1
  )
select
  min(log_id) as start_id,
  max(log_id) as end_id
from
  cte
group by
  rn_grp;