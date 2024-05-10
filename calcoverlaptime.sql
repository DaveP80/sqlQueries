-- codewars Calculate Available Time (overlaps are possible) Kata 5
-- 64bcfea1aaff1a6962182f3b
-- partial solution
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
where user_id = 777;
