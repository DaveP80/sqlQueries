-- Codewars PSQL
-- partially solved
-- https://www.codewars.com/kata/5821ee33ec380124f1000013

with cte as (
select first_name, last_name, credit_limit from customers limit 60
)
select first_name, last_name, old_limit, MAX(new_limit) new_limit from (
select first_name, last_name, c.credit_limit as old_limit, p.credit_limit as new_limit from cte c join prospects p ON 
p.full_name ilike '%' || first_name || '%' and p.full_name ilike '%' || last_name || '%' 
  ) z where new_limit > old_limit group by first_name, last_name, old_limit order by first_name;