-- LeetCode No. 2041 Accepted Candidates From the Interviews
-- MySQL
with
  cte as (
    select
      candidate_id,
      sum(score) as inter_score,
      years_of_exp
    from
      candidates c
      join rounds r on c.interview_id = r.interview_id
    group by
      candidate_id
  )
select
  candidate_id
from
  cte
where
  years_of_exp > 1
  and inter_score > 15;