-- LeetCode No. 2324 Medium
-- Product Sales Analysis IV
with cte as (
    select *, rank() over(partition by user_id order by sum_price desc)  as rn from (
    select sz.product_id, user_id, sum(quantity*price) as sum_price from sales sz natural join product group by user_id, product_id
    )  z
)
select user_id, product_id from cte where rn = 1;