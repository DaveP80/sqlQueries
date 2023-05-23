-- Postgres
-- Find the popularity percentage for each user on Meta/Facebook. The popularity percentage is 
-- defined as the total number of friends the user has divided by the total number of users on 
-- the platform, then converted into a percentage by multiplying by 100.
-- Output each user along with their popularity percentage.
-- facebook_friends
--  user1 | user2 
-- -------+-------
--      2 |     1
--      1 |     3
--      4 |     1
--      1 |     5
--      1 |     6
--      2 |     6
--      7 |     2
--      8 |     3
--      3 |     9
WITH cte AS (
    select
        distinct user1 AS users
    from
        facebook_friends
    group by
        user1
    UNION
    select
        distinct user2
    from
        facebook_friends
    group by
        user2
),
cte2 AS (
    SELECT
        c.users,
        COUNT(*) AS pcount
    FROM
        cte c
        join facebook_friends c2 ON c.users = c2.user2
    GROUP BY
        c.users
),
cte3 AS (
    SELECT
        q.users,
        COUNT(*) AS pcount2
    FROM
        cte q
        join facebook_friends c3 ON q.users = c3.user1
    GROUP BY
        q.users
),
cte4 AS (
    SELECT
        COALESCE(cte2.users, cte3.users) AS user_id,
        cte2.pcount AS count1,
        cte3.pcount2 AS count2
    FROM
        cte2 FULL
        OUTER JOIN cte3 ON cte2.users = cte3.users
),
cte5 AS (
    SELECT
        cte4.user_id,
        COALESCE(cte4.count1, 0) + COALESCE(cte4.count2, 0) AS total_friends
    FROM
        cte4
)
SELECT
    cte5.user_id,
    100.0 * cte5.total_friends /(
        SELECT
            COUNT(*)
        FROM
            cte
    ) AS ratio
FROM
    cte5;
-- Output
--  user_id |        ratio        
-- ---------+---------------------
--        9 | 11.1111111111111111
--        3 | 33.3333333333333333
--        5 | 11.1111111111111111
--        6 | 22.2222222222222222
--        2 | 33.3333333333333333
--        1 | 55.5555555555555556
--        8 | 11.1111111111111111
--        4 | 11.1111111111111111
--        7 | 11.1111111111111111