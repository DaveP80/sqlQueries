-- LeetCode No. 175 Combine Two Tables
-- MySQL
select
  firstName,
  lastName,
  city,
  state
from
  Person
  LEFT JOIN LATERAL (
    SELECT
      *
    FROM
      Address
    WHERE
      Person.personId = Address.personId
  ) Address ON true;