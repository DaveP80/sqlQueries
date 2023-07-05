## Codewars
### PSQL
<details>
<p>
You will be given a table where each record represents a node in a graph. Each node has an outbound connection to another (but not necessarily different) node, and these connections are stored as differences between the nodes' id's.
For example, assume there're 3 rows in a table with the following data: id = 1, id = 2, id = 3. If the node with id = 1 has a connection to the node with id = 3, this connection will be represented as a number 2 (stored in the first row's step field) because the difference between their id's is 3 - 1 = 2.
It is also known that some nodes are marked as terminal, i.e. if we were to traverse this graph, reaching such node would stop the traversal.
You have to implement a function which receives an id of a node, traverses the graph, and returns the id of the first encountered terminal node. On top of that, this function must not be recursive, and there're a few limitations in place to ensure this:
The function name can appear only once in your code
CREATE has to be used exactly once
You cannot use WITH
You cannot use EXECUTE
</p>
<pre>
<code>
 id | step | terminal
----+------+----------
  1 |   7  |  false
  2 |   1  |  true
  3 |   2  |  false
  4 |   3  |  false
  5 |  -3  |  false
  6 |   0  |  true
  7 |  -3  |  false
  8 |  -4  |  true
  -- id 3 returns 2
</code>
</pre>
</details>

```sql
CREATE FUNCTION last_node(first_node int) RETURNS int AS $$
DECLARE
    current_id INT := first_node;
    terminal_found BOOLEAN := (SELECT terminal from nodes where id = first_node);
    nstep INT := first_node;
BEGIN
    WHILE NOT terminal_found LOOP
        SELECT id+step, terminal, id INTO current_id, terminal_found, nstep
        FROM nodes
        WHERE id = current_id;
        IF terminal_found THEN
            RETURN nstep;
        END IF;
    END LOOP;
    RETURN first_node;
END;
$$ LANGUAGE plpgsql;
```