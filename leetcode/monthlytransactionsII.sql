-- LeetCode No. 1205 Monthly Transactions II
-- MySQL
with
  cte as (
    select
      month(t.trans_date) as t_month,
      country,
      sum(amount) as amount_tr,
      count(*) as count_tr
    from
      transactions t,
      sum(
        case
          when state = 'approved' then 1
          else 0
        end
      ) as count_appr
      join chargebacks c on month(t.trans_date) = month(c.trans_date)
    where
      state = 'approved'
    group by
      month(t.trans_date),
      country
  )
select
  *
from
  cte;