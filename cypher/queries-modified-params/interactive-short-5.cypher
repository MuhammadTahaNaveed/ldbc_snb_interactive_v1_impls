// IS5. Creator of a message
/*
:param messageId: 6597069786683
 */
MATCH (m:Message {id: 6597069786683 })-[:HAS_CREATOR]->(p:Person)
RETURN
    p.id AS personId,
    p.firstName AS firstName,
    p.lastName AS lastName
