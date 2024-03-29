create table account_balance
(
    account_no          varchar(20),
    transaction_date    date,
    debit_credit        varchar(10),
    transaction_amount  decimal
);

insert into account_balance values ('acc_1', to_date('2022-01-20', 'YYYY-MM-DD'), 'credit', 100);
insert into account_balance values ('acc_1', to_date('2022-01-21', 'YYYY-MM-DD'), 'credit', 500);
insert into account_balance values ('acc_1', to_date('2022-01-22', 'YYYY-MM-DD'), 'credit', 300);
insert into account_balance values ('acc_1', to_date('2022-01-23', 'YYYY-MM-DD'), 'credit', 200);
insert into account_balance values ('acc_2', to_date('2022-01-20', 'YYYY-MM-DD'), 'credit', 500);
insert into account_balance values ('acc_2', to_date('2022-01-21', 'YYYY-MM-DD'), 'credit', 1100);
insert into account_balance values ('acc_2', to_date('2022-01-22', 'YYYY-MM-DD'), 'debit', 1000);
insert into account_balance values ('acc_3', to_date('2022-01-20', 'YYYY-MM-DD'), 'credit', 1000);
insert into account_balance values ('acc_4', to_date('2022-01-20', 'YYYY-MM-DD'), 'credit', 1500);
insert into account_balance values ('acc_4', to_date('2022-01-21', 'YYYY-MM-DD'), 'debit', 500);
insert into account_balance values ('acc_5', to_date('2022-01-20', 'YYYY-MM-DD'), 'credit', 900);

-- Write a query to return the account no and the transaction date when the account balance reached 1000.
-- Include only those accounts whose balance currently is >= 1000;

-- Solution table will have columns, account_no | transaction_date

-- Solution:
with cte as
        (select account_no, transaction_date
            , case when debit_credit = 'debit'
                       then transaction_amount * -1 else transaction_amount end as trns_amt
         from account_balance),
    final_data as
        (select *
         , sum(trns_amt) over (partition by account_no order by transaction_date
                              range between unbounded preceding and unbounded following) as final_balance
         , sum(trns_amt) over (partition by account_no order by transaction_date) as current_balance
         , case when sum(trns_amt) over (partition by account_no order by transaction_date) >= 1000
                    then 1 else 0 end as flag
         from cte)
select account_no, min(transaction_date) as transaction_date
from final_data
where final_balance >= 1000
and flag = 1
group by account_no;


-- alternate solution

SELECT account_no, transaction_date
FROM (
  SELECT account_no, transaction_date, SUM(CASE WHEN debit_credit = 'credit' THEN transaction_amount ELSE -transaction_amount END) OVER (PARTITION BY account_no ORDER BY transaction_date) AS balance, transaction_amount
  FROM account_balance
) AS subquery
WHERE balance >= 1000
  AND balance - transaction_amount < 1000;