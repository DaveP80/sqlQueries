-- codewars Calculate Available Time (overlaps are possible) Kata 5
-- 64bcfea1aaff1a6962182f3b
-- partial solution
<<<<<<< HEAD
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
=======
with
ranked as (
select 
  user_id
  ,avail_start
  ,avail_end
,row_number() over (partition by user_id order by avail_start) as rn
from
  availability
where
  user_id = 777
),

overlap as (
select 
*
  ,case
  when lead(avail_start) over (partition by user_id order by rn) < avail_end then 1 else 0 end as overlap
from
  ranked
), 

tile as (
select 
*
,case
  when lag(overlap) over (partition by user_id order by rn) = 0 then 1
  else 0
  end as flag 
from overlap
),

tile2 as (
select 
*
,sum(flag) over (order by rn) as tile
from tile
),

agg as (
SELECT
user_id
,tile
,min(avail_start) as avail_start
,max(avail_end) as avail_end
from tile2
group by user_id, tile
)

select 
sum(EXTRACT (EPOCH FROM  (avail_end - avail_start) )::int/60) as total_minutes
from agg
where user_id = 777
>>>>>>> 5d42ff8 (solution that passes most test cases)
