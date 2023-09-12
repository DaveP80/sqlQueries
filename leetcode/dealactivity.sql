-- Codewars https://www.codewars.com/kata/64acfdf6dddc25fe18dfba71
-- The query should include the following information in the result set:
-- deal_id
-- deal_name
-- is_active boolean that is true if there has been at least one login within the last 90 days and false otherwise.
-- last_login string that represents the number of days and hours since the last login for each deal, in the format 
-- "X days and Y hours ago". Even for durations of exactly 1 day or 1 hour, it should be displayed as "1 days" or 
-- "1 hours" (we are not bothering about single form).
select
    d.deal_id,
    deal_name,
    case
        when EXTRACT(
            DAY
            FROM
                (CURRENT_TIMESTAMP - occurred_at)
        ) < 90 then true
        else false
    end is_active,
    concat(
        EXTRACT(
            DAY
            FROM
                (CURRENT_TIMESTAMP - occurred_at)
        ),
        ' days and ',
        EXTRACT(
            HOUR
            FROM
                (CURRENT_TIMESTAMP - occurred_at)
        ),
        ' hours ago'
    ) last_login
from
    deals d
    join deal_login_fact df ON d.deal_id = df.deal_id
order by
    d.deal_id desc;
-- output
+---------+-----------+------------+--------------------------+
| deal_id | deal_name | is_active  |        last_login        |
+---------+-----------+------------+--------------------------+
|   10    |  Deal 10  |   false    |  120 days and 0 hours ago |
|   9     |   Deal 9  |   false    |  120 days and 0 hours ago |
|   8     |   Deal 8  |   false    |  120 days and 0 hours ago |
|   7     |   Deal 7  |   false    |  120 days and 0 hours ago |
|   6     |   Deal 6  |   false    |  120 days and 0 hours ago |
|   5     |   Deal 5  |   true     |   60 days and 0 hours ago |
|   4     |   Deal 4  |   true     |   60 days and 0 hours ago |
|   3     |   Deal 3  |   true     |   60 days and 0 hours ago |
|   2     |   Deal 2  |   true     |   60 days and 0 hours ago |
|   1     |   Deal 1  |   true     |   60 days and 0 hours ago |
+---------+-----------+------------+--------------------------+