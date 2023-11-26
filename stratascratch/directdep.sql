-- strata scratch 10357 Hard
-- To identify a payroll direct deposit transaction, we look for members who are getting paid similar amounts by the same company on a recurring basis. We therefore look for the following:
-- •	Members who get paid from the same company.
-- •	At least two distinct weeks within a 30-day period must show transactions (i.e., at least two transactions within a 30-day period).
-- •	The amounts of these transactions should differ by no more than $25.
with cte as (
select
	a.*,
	min(transaction_date) over(partition by extract(month
from
	transaction_date),
	user_id,
	employer,
	ROUND(transaction_amount / 25) * 25) mn,
	max(transaction_date) over(partition by extract(month
from
	transaction_date),
	user_id,
	employer,
	ROUND(transaction_amount / 25) * 25) mx
from
	dd_transactions a
)
select
	distinct user_id,
	employer,
	min(transaction_date)
from
	(
	select
		c.*,
		count(*) over(partition by user_id,
		employer,
		extract(month
	from
		transaction_date),
		ROUND(transaction_amount / 25) * 25)
	from
		cte c
	where
		mn + interval '6 days' < mx
) g
where
	count > 1
group by
	user_id,
	employer;