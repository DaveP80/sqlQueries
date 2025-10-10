-- LeetCode No. 2986 Find Third Transaction
-- MySQL
with
  cte as (
    select
      row_number() over(
        partition by user_id
        order by
          transaction_date
      ) as rn,
      user_id,
      spend,
      transaction_date
    from
      transactions
  )
select
  c.rn,
  c2.rn,
  c.spend,
  c2.spend,
  c.user_id,
  c2.user_id
from
  cte c
  join cte c2 on c2.rn > c.rn
  and c2.rn - c.rn < 3
  and c2.user_id = c.user_id;