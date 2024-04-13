-- LeetCode 1251 Average Selling Price
-- MySQL
with
  cte as (
    select
      p.product_id,
      round(sum(price * units) / sum(units), 2) as average_price
    from
      prices p
      join unitssold ut on p.product_id = ut.product_id
    where
      purchase_date >= start_date
      and purchase_date <= end_date
    group by
      p.product_id
  )
select
  *
from
  cte
union
select
  product_id,
  0 as average_price
from
  prices
where
  product_id not in (
    select
      product_id
    from
      cte
  );
