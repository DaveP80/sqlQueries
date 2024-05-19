-- Leetcode No. 1661 Average time of process per machine
-- MySQL
select
  round(avg(b.timestamp - a.timestamp), 3) as processing_time,
  a.machine_id
from
  activity a
  join activity b on a.machine_id = b.machine_id
where
  a.process_id = b.process_id
  and a.activity_type > b.activity_type
group by
  2;
