-- MySQL
-- Write a SQL query for a report that provides the pairs 
-- (actor_id, director_id) where the actor has cooperated 
-- with the director at least three times.
-- Input: 
-- ActorDirector table:
-- +-------------+-------------+-------------+
-- | actor_id    | director_id | timestamp   |
-- +-------------+-------------+-------------+
-- | 1           | 1           | 0           |
-- | 1           | 1           | 1           |
-- | 1           | 1           | 2           |
-- | 1           | 2           | 3           |
-- | 1           | 2           | 4           |
-- | 2           | 1           | 5           |
-- | 2           | 1           | 6           |
-- +-------------+-------------+-------------+
SELECT
    a.actor_id,
    a.director_id
FROM
    (
        SELECT
            actor_id,
            director_id,
            COUNT(*) c
        FROM
            ActorDirector
        GROUP BY
            actor_id,
            director_id
    ) a
WHERE
    a.c >= 3;
 --Another Solution
SELECT
    actor_id,
    director_id
FROM
    ActorDirector
GROUP BY
    actor_id,
    director_id
HAVING
    COUNT(*) >= 3;
-- Output: 
-- +-------------+-------------+
-- | actor_id    | director_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- +-------------+-------------+