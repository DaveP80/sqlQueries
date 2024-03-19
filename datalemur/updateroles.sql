-- datalemur Advertiser Status [Facebook SQL Interview Question]
-- Hard
select
	coalesce(a_user_id,
	user_id) as user_id,
	case
		when status = 'NEW'
		and paid > 0 then 'EXISTING'
		when status = 'EXISTING'
		and paid <= 0 then 'CHURN'
		when status = 'CHURN'
		and paid > 0 then 
'RESURRECT'
		when a_user_id is null
		and paid > 0 then 'NEW'
		when status = 'RESURRECT'
		and paid > 0 then 'EXISTING'
		when status = 'EXISTING'
		and paid > 0 then 'EXISTING'
		else 'CHURN'
	end as status
from
	(
	select
		a.user_id a_user_id,
		status,
		d.user_id,
		coalesce(paid,
		0) as paid
	from
		advertiser a
	full outer 
join daily_pay d on
		a.user_id = d.user_id
) z
order by
	1;
