-- Leetcode No. 1193
with cte as (
select left(trans_date::TEXT, 7) as month, country, count(*) over (partition by extract(month from trans_date), country) as approved_count from transactions where state = 'approved'
),
cte2 as (
select left(trans_date::TEXT, 7) as month, country, count(*) over (partition by extract(month from trans_date), country) as trans_count from transactions
),
cte3 as (
select left(trans_date::TEXT, 7) as month, country, sum(amount) over (partition by extract(month from trans_date), country) as trans_total_amount from transactions
), 
cte4 as (
select left(trans_date::TEXT, 7) as month, country, sum(amount) over (partition by extract(month from trans_date), country) as approved_total_amount from transactions where state = 'approved'
) 
select c.month, c.country, cte2.trans_count, c.approved_count, cte3.trans_total_amount, cte4.approved_total_amount from cte c join cte2 on (c.month, c.country) = (cte2.month, cte2.country) join cte3 on (c.month, c.country) = (cte3.month, cte3.country) join cte4 on (c.month, c.country) = (cte4.month, cte4.country);
