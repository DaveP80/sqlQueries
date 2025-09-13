-- LeetCode 3338: Second Highest Salary
-- MySQL    
with
  cte as (
    select
      dense_rank() over(
        partition by dept
        order by
          salary desc
      ) as sal_rn,
      employees.*
    from
      employees
  )
select
  emp_id,
  dept
from
  cte
where
  sal_rn = 2
order by
  1;