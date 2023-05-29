-- MySQL
-- SQL query to report the fraction of players that logged in again on the day after the day they first logged in, 
-- rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least 
-- two consecutive days starting from their first login date, then divide that number by the total number of players.
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- Output: 
-- +-----------+
-- | fraction  |
-- +-----------+
-- | 0.33      |
-- +-----------+
SELECT 
ROUND(1.0*(
(SELECT COUNT(*) from 
(SELECT a.* FROM Activity a join (SELECT player_id, MIN(event_date) mindate FROM Activity GROUP BY player_id) b
WHERE DATEDIFF(a.event_date, b.mindate) = 1 and a.player_id = b.player_id) a)
/
(SELECT COUNT(distinct player_id) FROM Activity)
),2
) AS fraction;