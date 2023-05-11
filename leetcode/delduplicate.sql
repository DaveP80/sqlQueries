-- Input: 
-- Person table:
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Output: 
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+

-- Write an SQL query to delete all the duplicate emails, keeping only one unique 
-- email with the smallest id. Note that you are supposed to write a DELETE 
-- statement and not a SELECT one.
DELETE t1 FROM Person t1
INNER JOIN Person t2
WHERE t1.id > t2.id AND t1.email = t2.email;