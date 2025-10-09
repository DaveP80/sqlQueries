-- LeetCode No. 1112 Highest Grade For Each Student
-- MySQL
with
  cte as (
    select
      rank() over(
        partition by student_id
        order by
          grade desc,
          course_id
      ) as m_grade,
      student_id,
      course_id,
      grade
    from
      enrollments
  )
select
  student_id,
  course_id,
  grade
from
  cte
where
  m_grade = 1;