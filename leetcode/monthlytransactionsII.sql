-- LeetCode No. 1205 Monthly Transactions II
-- MySQL
with
  cte as (
    select
      left(trans_date, 7) as "month",
      country,
      count(*) as approved_count,
      sum(amount) as approved_amount,
      0 as chargeback_count,
      0 as chargeback_amount
    from
      transactions
    where
      state = 'approved'
    group by
      month(trans_date),
      country
  ),
  cte2 as (
    select
      left(c.trans_date, 7) as "month",
      country,
      0 as approved_count,
      0 as approved_amount,
      count(*) as chargeback_count,
      sum(amount) as chargeback_amount
    from
      transactions t
      join chargebacks c on id = trans_id
    group by
      month(c.trans_date),
      country
  ),
  cte3 as (
    select
      c.month,
      c.country,
      c.approved_count,
      c.approved_amount,
      c2.chargeback_count,
      c2.chargeback_amount
    from
      cte c
      join cte2 c2 on (c.month, c.country) = (c2.month, c2.country)
  )
select
  *
from
  cte3
union
select
  *
from
  cte2
where
  cte2.month not in (
    select
      month
    from
      cte3
  )
union
select
  *
from
  cte
where
  cte.month not in (
    select
      month
    from
      cte3
  );