-- Codewars SQL Statistics: MIN, MEDIAN, MAX PSQL
--  you need to create a simple SELECT statement. Your task is to calculate the MIN, MEDIAN and 
-- MAX scores of the students from the results table.
SELECT MIN(score),
(select percentile_disc(0.50) within group (order by score DESC)
from result)::INT::FLOAT AS median, MAX(score) max from result;