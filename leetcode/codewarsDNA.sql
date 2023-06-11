-- PSQL
-- CodeWars problem
-- In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G". Your function 
-- receives one side of the DNA (string, except for Haskell); you need to return the other 
-- complementary side. DNA strand is never empty or there is no DNA at all.
-- Example: (input --> output)
-- "ATTGC" --> "TAACG"
-- "GTAT" --> "CATA"
CREATE OR REPLACE FUNCTION DNA_strand(dna VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    modstring VARCHAR;
    i INT := 1;
    j CHAR(1);
BEGIN
    modstring := dna;

    WHILE i <= LENGTH(modstring) LOOP
        j := SUBSTRING(modstring, i, 1);

        IF j = 'A' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), 'T', SUBSTRING(modstring, i + 1));
        ELSIF j = 'T' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), 'A', SUBSTRING(modstring, i + 1));
        ELSIF j = 'G' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), 'C', SUBSTRING(modstring, i + 1));
        ELSIF j = 'C' THEN
            modstring := CONCAT(LEFT(modstring, i - 1), 'G', SUBSTRING(modstring, i + 1));
        END IF;

        i := i + 1;
    END LOOP;

    RETURN modstring;
END;
$$ LANGUAGE plpgsql;

SELECT dna, DNA_strand(dna) AS res FROM dnastrand;

--Transform solution
-- Note Translate does not work with mysql
SELECT dna, TRANSLATE(dna, 'ATGC', 'TACG') AS res 
FROM dnastrand;