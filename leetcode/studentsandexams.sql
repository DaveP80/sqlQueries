-- LeetCode No. 1280 Students and Examinations
-- MySQL
select
  z.student_id,
  student_name,
  z.subject_name,
  count(e.student_id) attended_exams
from
  (
    select
      student_id,
      student_name,
      subject_name
    from
      students
      cross join subjects
  ) z
  left join examinations e on z.student_id = e.student_id
  and z.subject_name = e.subject_name
group by
  1,
  3
order by
  1,
  3;