-- Leetcode 1555: Bank Account Summary
-- MySQL
with
  cte as (
    select
      u.credit,
      user_name,
      u.user_id,
      t.*,
      ifnull(sum(amount) * -1.0, 0) as payments
    from
      users u
      left join transactions t on u.user_id = t.paid_by
    group by
      u.user_id
  ),
  cte2 as (
    select
      u.credit,
      user_name,
      u.user_id,
      t.*,
      ifnull(sum(amount), 0) as payments
    from
      users u
      left join transactions t on u.user_id = t.paid_to
    group by
      u.user_id
  )
select
  user_id,
  user_name,
  z.credit + sum(payments) as credit,
  case
    when z.credit + sum(payments) < 0 then 'Yes'
    else 'No'
  end as credit_limit_breached
from
  (
    select
      *
    from
      cte
    union
    select
      *
    from
      cte2
  ) z
group by
  user_id;