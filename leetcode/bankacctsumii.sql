-- LeetCode No. 1587 MySQL
with cte as (
    select account, sum(amount) balance from transactions group by 1 having sum(amount) > 10000 
)
select name, balance from users natural join cte;
