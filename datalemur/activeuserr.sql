-- DataLemur HARD
-- Active User Retention [Facebook SQL Interview Question]
with cte as (
select
	distinct ua.user_id
from
	user_actions ua
where
	ua.event_type in ('like', 'sign-in', 'comment')
	AND
EXTRACT(month from ua.event_date) = 6
)
select
	7 as month,
	count(ua.user_id) monthly_active_users
from
	(
	select
		distinct ua.user_id
	from
		user_actions ua
	where
		ua.event_type in ('like', 'sign-in', 'comment')
			AND
EXTRACT(month from ua.event_date) = 7
) ua
join cte ub ON
	ua.user_id = ub.user_id;
