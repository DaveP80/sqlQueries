-- DataLemur Hard
-- Active User Retention PostgreSQL
with
  cte as (
    select
      DISTINCT user_id
    from
      user_actions
    where
      extract(
        month
        from
          event_date
      ) = 6
      AND extract(
        year
        from
          event_date
      ) = 2022
      and event_type in ('sign-in', 'like', 'comment')
  )
select
  7 as month,
  count(distinct user_id) as monthly_active_users
from
  user_actions
where
  extract(
    month
    from
      event_date
  ) = 7
  AND extract(
    year
    from
      event_date
  ) = 2022
  and event_type in ('sign-in', 'like', 'comment')
  AND user_id in (
    select
      *
    from
      cte
  );