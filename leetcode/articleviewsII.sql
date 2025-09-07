-- Leetcode 1149 Article Views II
-- MySQL
with cte as (
select
	count(distinct article_id) as count_a,
	viewer_id,
	view_date
from
	views
group by
	viewer_id,
	view_date
)
select
	distinct v.viewer_id as id
from
	views v
join cte on
	v.viewer_id = cte.viewer_id
where
	count_a > 1
order by
	1;