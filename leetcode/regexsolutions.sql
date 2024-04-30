-- LeetCode No. 1527 MySQL
select
  distinct patient_id,
  patient_name,
  conditions
from
  patients
where
  conditions REGEXP '[[:space:]]DIAB1|^DIAB1';