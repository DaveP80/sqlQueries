-- DataLemur Hard Postgresql
-- https://datalemur.com/questions/total-utilization-time
with
  cte as (
    SELECT
      *,
      row_number() over(
        PARTITION BY server_id
        order by
          status_time
      ) as rn
    from
      server_utilization
  )
select
  extract(
    "days"
    from
      sum(sumsv)
  ) + round(
    extract(
      "hours"
      from
        sum(sumsv)
    ) / 24,
    0
  ) total_uptime_days
from
  (
    select
      ce.status_time - c.status_time as sumsv
    from
      cte c
      join cte ce on c.server_id = ce.server_id
    WHERE
      ce.rn - c.rn = 1
      and ce.session_status = 'stop'
      and c.session_status = 'start'
  ) z;