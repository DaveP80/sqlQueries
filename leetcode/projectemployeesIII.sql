//Leetcode 1077: Project Employees III
//MySQL
with
  cte as (
    select
      max(experience_years) as m_y,
      project_id
    from
      project p
      join employee e on p.employee_id = e.employee_id
    group by
      project_id
  )
select
  project_id,
  p.employee_id
from
  project p
  join employee e on p.employee_id = e.employee_id
where
  e.experience_years = (
    select
      m_y
    from
      cte
    where
      cte.project_id = p.project_id
  );