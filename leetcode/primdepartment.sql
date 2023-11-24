-- LeetCode No. 1789 Primary Department for Each Employee
-- MySQL
with cte as (
    select
        employee_id,
        department_id
    from
        Employee
    where
        primary_flag = 'Y'
)
select
    employee_id,
    department_id
from
    Employee
where
    employee_id not in (
        select
            employee_id
        from
            cte
    )
group by
    employee_id
having
    count(*) = 1
union
select
    *
from
    cte;