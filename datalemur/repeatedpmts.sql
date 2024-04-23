-- DataLemur Hard
-- https://datalemur.com/questions/repeated-payments
with
  cte as (
    SELECT
      *
    from
      transactions
  )
select
  count(*) as subtot
from
  cte c
  join cte ct on c.merchant_id = ct.merchant_id
  and c.credit_card_id = ct.credit_card_id
  and c.amount = ct.amount
where
  EXTRACT(
    epoch
    FROM
      ct.transaction_timestamp:: timestamp - c.transaction_timestamp:: timestamp
  ) / 60 <= 10
  and ct.transaction_id > c.transaction_id;
