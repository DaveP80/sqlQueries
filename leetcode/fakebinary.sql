-- Postgresql
-- Codewars Fake Binary
-- Given a string of digits, you should replace any digit below 5 with '0' and 
-- any digit 5 and above with '1'. Return the resulting string.
-- you are given a table 'fakebin' with column 'x', return a table with 
--column 'x' and your result in a column named 'res'.
CREATE OR REPLACE FUNCTION strand(x VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    modstring VARCHAR;
    i INT := 1;
    j CHAR(1);
BEGIN
    modstring := x;

    WHILE i <= LENGTH(modstring) LOOP
        j := SUBSTRING(modstring, i, 1);

        IF j = '0' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), '0', SUBSTRING(modstring, i + 1));
        ELSIF j = '1' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), '0', SUBSTRING(modstring, i + 1));
        ELSIF j = '2' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), '0', SUBSTRING(modstring, i + 1));
        ELSIF j = '3' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), '0', SUBSTRING(modstring, i + 1));
        ELSIF j = '4' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), '0', SUBSTRING(modstring, i + 1));
        ELSE 
            modstring := CONCAT(LEFT(modstring, i - 1), '1', SUBSTRING(modstring, i + 1));
        END IF;

        i := i + 1;
    END LOOP;
    RETURN modstring;
END;
$$ LANGUAGE plpgsql;
SELECT x, strand(x) AS res FROM fakebin;