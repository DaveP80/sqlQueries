-- Codewars PSQL
-- https://www.codewars.com/kata/589cf45835f99b2909000115
-- Given a posts table that contains a created_at timestamp column write a query that returns date (without time 
-- component), a number of posts for a given date and a running (cumulative) total number of posts up until a 
-- given date. The resulting set should be ordered chronologically by date.
with cte as (
select  DATE(created_at) as date, count(*) from posts group by
  DATE(created_at) order by date
  )
  select c.*, (select sum(count) from cte z where z.date <= c.date)::INT as total from cte c;