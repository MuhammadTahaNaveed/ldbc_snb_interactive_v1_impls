// Q13. Single shortest path
/*
:param [{ person1Id, person2Id }] => { RETURN
  2199023263575 AS person1Id,
  143 AS person2Id
}
*/
MATCH
    (person1:Person {id: 2199023263575}),
    (person2:Person {id: 143}),
    path = shortestPath((person1)-[:KNOWS*]-(person2))
RETURN
    CASE path IS NULL
        WHEN true THEN -1
        ELSE length(path)
    END AS shortestPathLength
