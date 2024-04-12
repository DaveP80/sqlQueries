-- DataLemur https://datalemur.com/questions/supercloud-customer
with
  cte as (
    select
      count(distinct product_category) as count_d
    from
      products
  )
select
  customer_id
from
  customer_contracts cc
  join products p on cc.product_id = p.product_id
group by
  customer_id
having
  count(distinct product_category) = (
    select
      count_d
    from
      cte
  );
