-- PSQL
-- StrataScratch No. 10351
-- Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. The user with 
-- the highest number of emails sent will have a rank of 1, and so on. Output the user, total emails, and their activity rank. 
-- Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.
-- In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. For tie 
-- breaker use alphabetical order of the user usernames.
SELECT
    *,
    ROW_NUMBER() OVER(
        ORDER BY
            total_emails DESC
    ) AS row_number
FROM
    (
        SELECT
            from_user,
            COUNT(*) as total_emails
        FROM
            google_gmail_emails
        GROUP BY
            from_user
    ) a
GROUP BY
    total_emails,
    from_user
ORDER BY
    total_emails DESC,
    from_user;
-- LeetCode No. 1581 Customer Who Visited but Did Not Make Any Transactions
select
  a.customer_id,
  count(*) count_no_trans
from
  visits a
  left join transactions b on a.visit_id = b.visit_id
where
  transaction_id is null
group by
  1;