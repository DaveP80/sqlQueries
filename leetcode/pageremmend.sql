-- Leetcode No. 1264 Page Recommendations
-- MySQL
with
  cte as (
    select
      page_id
    from
      Likes
    where
      user_id = 1
  ),
  cte2 as (
    select
      l.page_id as recommended_page,
      cte.page_id as not_recommend
    from
      friendship f
      join Likes l on (
        user2_id = user_id
        or user1_id = user_id
      )
      left join cte on l.page_id = cte.page_id
    where
      user1_id = 1
      or user2_id = 1
  )
select
  distinct recommended_page
from
  cte2
where
  not_recommend is NULL;