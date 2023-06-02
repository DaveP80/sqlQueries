-- postgreSQL
-- strata scratch problem
-- Calculate each user's average session time. A session is defined as the time difference between a 
-- page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are 
-- multiple of the same events on that day, consider only the latest page_load and earliest page_exit, 
-- with an obvious restriction that load time event should happen before exit time event . Output the 
-- user_id and their average session time.
-- user_id |     timestamp      |   action   
-- --------+-------------------+------------
--   0     | 2019-04-25 13:30:15 | page_load
--   0     | 2019-04-25 13:30:18 | page_load
--   0     | 2019-04-25 13:30:40 | scroll_down
--   0     | 2019-04-25 13:30:45 | scroll_up
--   0     | 2019-04-25 13:31:10 | scroll_down
--   0     | 2019-04-25 13:31:25 | scroll_down
--   0     | 2019-04-25 13:31:40 | page_exit
--   1     | 2019-04-25 13:40:00 | page_load
--   1     | 2019-04-25 13:40:10 | scroll_down
--   1     | 2019-04-25 13:40:15 | scroll_down
--   1     | 2019-04-25 13:40:20 | scroll_down
--   1     | 2019-04-25 13:40:25 | scroll_down
--   1     | 2019-04-25 13:40:30 | scroll_down
--   1     | 2019-04-25 13:40:35 | page_exit
--   2     | 2019-04-25 13:41:21 | page_load
--   2     | 2019-04-25 13:41:30 | scroll_down
--   2     | 2019-04-25 13:41:35 | scroll_down
--   2     | 2019-04-25 13:41:40 | scroll_up
--   1     | 2019-04-26 11:15:00 | page_load
--   1     | 2019-04-26 11:15:10 | scroll_down
--   1     | 2019-04-26 11:15:20 | scroll_down
--   1     | 2019-04-26 11:15:25 | scroll_up
--   1     | 2019-04-26 11:15:35 | page_exit
--   0     | 2019-04-28 14:30:15 | page_load
--   0     | 2019-04-28 14:30:10 | page_load
--   0     | 2019-04-28 13:30:40 | scroll_down
--   0     | 2019-04-28 15:31:40 | page_exit
WITH cte AS (
SELECT user_id, MAX(timestamp) pl, action FROM facebook_web_log WHERE action = 'page_load' GROUP BY user_id, DATE(timestamp), action
),
cte2 AS (
SELECT user_id, MIN(timestamp) pe, action FROM facebook_web_log WHERE action = 'page_exit' GROUP BY user_id, DATE(timestamp), action
)
SELECT user_id, AVG(time_difference) as avg FROM
(
SELECT cte2.user_id, 
cte2.pe - cte.pl time_difference
FROM cte JOIN cte2 ON cte.user_id = cte2.user_id and DATE(pl) = DATE(pe)
) z
GROUP BY user_id;
--   user_id |   avg  
-- --------+--------
--    0    | 1883.5
--    1    |   35  
