-- StrataScratch No. 2145
-- Tiktok want to find out what were the top two most active user days during an advertising 
-- campaign they ran in the first week of August 2022 (between the 1st to the 7th).
-- Identify the two days with the highest user activity during the advertising campaign.
-- They've also specified that user activity must be measured in terms of unique users.
-- Output the day, date, and number of users.
with cte as (
SELECT CASE
           WHEN a.d = 1 THEN 'Monday'
           WHEN a.d = 2 THEN 'Tuesday'
           WHEN a.d = 3 THEN 'Wednesday'
           WHEN a.d = 4 THEN 'Thursday'
           WHEN a.d = 5 THEN 'Friday'
           WHEN a.d = 6 THEN 'Saturday'
           WHEN a.d = 7 THEN 'Sunday'
       END AS day_of_week,
       a.date_visited,
       a.count, rank() over (order by count desc) r
FROM (
    SELECT EXTRACT(DAY FROM date_visited) AS d,
           date_visited,
           COUNT(DISTINCT user_id) AS count
    FROM user_streaks
    WHERE date_visited BETWEEN '2022-08-01' AND '2022-08-07'
    GROUP BY d, date_visited order by count desc
) a
)
select day_of_week,date_visited,count from cte where r < 3;
-- Output
+------------+--------------+-------+
| day_of_week | date_visited | count |
+------------+--------------+-------+
|   Sunday   |  2022-08-07  |   5   |
|   Friday   |  2022-08-05  |   4   |
|  Saturday  |  2022-08-06  |   4   |
| Wednesday  |  2022-08-03  |   4   |
+------------+--------------+-------+