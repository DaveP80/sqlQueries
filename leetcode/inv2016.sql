-- Input: 
-- Insurance table:
-- +-----+----------+----------+-----+-----+
-- | pid | tiv_2015 | tiv_2016 | lat | lon |
-- +-----+----------+----------+-----+-----+
-- | 1   | 10       | 5        | 10  | 10  |
-- | 2   | 20       | 20       | 20  | 20  |
-- | 3   | 10       | 30       | 20  | 20  |
-- | 4   | 10       | 40       | 40  | 40  |
-- +-----+----------+----------+-----+-----+
-- Output: 
-- +----------+
-- | tiv_2016 |
-- +----------+
-- | 45.00    |
-- +----------+
-- SQL query to report the sum of all total investment values in 2016  tiv_2016,  for all policyholders who:
-- have the same tiv_2015 value as one or more other policyholders, and
-- are not located in the same city like any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
-- Round tiv_2016 to two decimal places.
select ROUND(SUM(tiv_2016), 2) tiv_2016 
FROM insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
) AND (lat, lon) NOT IN (
    SELECT lat, lon
    FROM insurance
    GROUP BY lat, lon
    HAVING COUNT(*) > 1
);