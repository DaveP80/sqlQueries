-- codewars Calculate Available Time (overlaps are possible) Kata 5
-- 64bcfea1aaff1a6962182f3b
-- partial solution
WITH cte AS (
with cte as (
select row_number() over() as rn, avail_start, avail_end from (
select distinct case when av.avail_start < avi.avail_start then av.avail_start else avi.avail_start end as avail_start,
case when av.avail_end > avi.avail_end then av.avail_end else avi.avail_end end as avail_end from availability av join availability avi on
av.id != avi.id where ((av.avail_start, av.avail_end) overlaps (avi.avail_start, avi.avail_end)) and av.user_id = 777 and avi.user_id = 777
 ) z
  )
select distinct c.rn, c.avail_start, c.avail_end from cte c join cte ce on c.rn != ce.rn where not ((c.avail_start, c.avail_end) overlaps (ce.avail_start, ce.avail_end))

)
SELECT 
rank() over(partition by (c.avail_start, c.avail_end) overlaps (ce.avail_start, ce.avail_end)) as p_rank,
c.avail_start, c.avail_end from cte c join cte ce on (c.avail_start, c.avail_end) overlaps (ce.avail_start, ce.avail_end) where c.rn != ce.rn;
