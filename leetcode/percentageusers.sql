-- LeetCode No. 1633 Percentage of Users Attended a Contest
-- MySQL
with
  cte as (
    select
      count(user_id) as c_users
    from
      users
  )
select
  contest_id,
  round(
    count(*) / (
      select
        c_users
      from
        cte
    ) * 100,
    2
  ) as percentage
from
  register
group by
  contest_id
order by
  2 desc,
  1;
