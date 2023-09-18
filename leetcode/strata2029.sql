-- MySQL stratascratch 2029
with cte as (
    select
        user_id,
        count(*) as num
    from
        fact_events
    group by
        user_id
)
select
    client_id
from
    fact_events
where
    user_id in (
        select
            user_id
        from
            (
                select
                    f.user_id,
                    num,
                    count(*) as pose
                from
                    fact_events f
                    join cte c on f.user_id = c.user_id
                where
                    event_type = 'video call received'
                    or event_type = 'video call sent'
                    or event_type = 'voice call received'
                    or event_type = 'voice call sent'
                group by
                    1,
                    2
            ) a
        where
            pose * 1.0 / num * 1.0 * 100 >= 50
    )
group by
    client_id
order by
    count(*) desc
limit
    1;