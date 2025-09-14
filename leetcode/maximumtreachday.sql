-- LeetCode 1831 Maximum Transaction Each Day   
-- MySQL
with
  cte as (
    select
      dense_rank() over(
        partition by day
        order by
          amount desc
      ) as dr_amnt,
      t.*
    from
      transactions t
  )
select
  transaction_id
from
  cte
where
  dr_amnt = 1
order by
  1;