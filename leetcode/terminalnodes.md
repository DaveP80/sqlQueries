## Codewars
### Partially solved
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
</details>

```sql
CREATE FUNCTION last_node(first_node int) RETURNS int AS $$
    SELECT id from nodes WHERE id = first_node and terminal = true
    UNION
    SELECT CASE WHEN terminal = true id ELSE -1 END, step, CASE WHEN terminal = false THEN id + step ELSE -1 END as storestep from 
    nodes WHERE id = (SELECT step + id FROM nodes WHERE id = first_node)
$$ LANGUAGE SQL;
```