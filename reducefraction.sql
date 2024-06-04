-- CodeWars 576400f2f716ca816d001614
-- PostgreSQL
CREATE OR REPLACE FUNCTION gcd(a INTEGER, b INTEGER) RETURNS INTEGER AS $$
DECLARE
    temp INTEGER;
BEGIN
    -- Make sure a is greater than or equal to b
    IF a < b THEN
        temp := a;
        a := b;
        b := temp;
    END IF;

    -- Use the Euclidean Algorithm to find the GCD
    WHILE b <> 0 LOOP
        temp := b;
        b := a % b;
        a := temp;
    END LOOP;

    RETURN a;
END;
$$ LANGUAGE plpgsql;

select numerator, denominator, numerator / gcd(numerator, denominator) as reduced_numerator,
denominator / gcd(numerator, denominator) as reduced_denominator from fraction order by 1,2;
