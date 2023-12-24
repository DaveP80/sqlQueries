-- Leetcode No. 1193
with cte as (
select left(trans_date::TEXT, 7) as month, country, count(*) over (partition by left(trans_date::TEXT, 7), country) as approved_count from (select id, coalesce(country, 'XX') as country, state, amount, trans_date from transactions) z where state = 'approved'
),
cte2 as (
select left(trans_date::TEXT, 7) as month, country, count(*) over (partition by left(trans_date::TEXT, 7), country) as trans_count from (select id, coalesce(country, 'XX') as country, state, amount, trans_date from transactions) z
),
cte3 as (
select left(trans_date::TEXT, 7) as month, country, sum(amount) over (partition by left(trans_date::TEXT, 7), country) as trans_total_amount from (select id, coalesce(country, 'XX') as country, state, amount, trans_date from transactions) z
), 
cte4 as (
select left(trans_date::TEXT, 7) as month, country, sum(amount) over (partition by left(trans_date::TEXT, 7), country) as approved_total_amount from (select id, coalesce(country, 'XX') as country, state, amount, trans_date from transactions) z where state = 'approved'
) 
select distinct cte2.month, case when cte2.country = 'XX' then null else cte2.country end as country, cte2.trans_count, coalesce(c.approved_count, 0) approved_count, coalesce(cte3.trans_total_amount, 0) trans_total_amount, coalesce(cte4.approved_total_amount, 0) approved_total_amount from cte2 left join cte c on (c.month, c.country) = (cte2.month, cte2.country) left join cte3 on (cte2.month, cte2.country) = (cte3.month, cte3.country) left join cte4 on (cte2.month, cte2.country) = (cte4.month, cte4.country);
