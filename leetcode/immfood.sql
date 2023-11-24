-- LeetCode No. 1174 Immediate Food Delivery II
-- MySQL
select
    round(
        (
            count(*) /(
                select
                    count(distinct customer_id)
                from
                    delivery
            )
        ) * 100,
        2
    ) immediate_percentage
from
    (
        select
            customer_id,
            min(order_date) od,
            min(customer_pref_delivery_date) cd
        from
            delivery
        group by
            1
    ) z
    join (
        select
            *
        from
            delivery
    ) b on z.customer_id = b.customer_id
    and z.od = b.order_date
    and z.cd = b.customer_pref_delivery_date
where
    z.od = z.cd;