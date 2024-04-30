-- LeetCode No. 1148
select
  distinct author_id as id
from
  views
where
  author_id = viewer_id
order by
  1;