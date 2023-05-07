CREATE TABLE bank (
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  bank_id INTEGER REFERENCES bank(id),
  credit NUMERIC,
  debit NUMERIC
);

-- make sure values entered in debit column are always negative
CREATE FUNCTION ensure_debit_is_negative()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.debit >= 0 THEN
    NEW.debit = -NEW.debit;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ensure_debit_is_negative
BEFORE INSERT ON transactions
FOR EACH ROW
EXECUTE FUNCTION ensure_debit_is_negative();

INSERT INTO bank (name) VALUES ('person A'), ('person B'), ('person C');

INSERT INTO transactions (bank_id, credit, debit) VALUES
  (1, 100, -50),
  (1, 200, -150),
  (2, 75, -125),
  (2, 125, -100),
  (3, 50, 75);

-- get balance of each unique band_id/user
SELECT bank.id, SUM(transactions.credit + transactions.debit) AS total
FROM bank
JOIN transactions ON bank.id = transactions.bank_id
GROUP BY bank.id;

-- query total credit and debits by a certain id
SELECT SUM(credit + debit) AS total
FROM transactions
WHERE bank_id = 1;