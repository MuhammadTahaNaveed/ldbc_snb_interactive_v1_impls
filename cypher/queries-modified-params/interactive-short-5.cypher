// IS5. Creator of a message
/*
:param messageId: 2061585185686
 */
MATCH (m:Message {id: 2061585185686 })-[:HAS_CREATOR]->(p:Person)
RETURN
    p.id AS personId,
    p.firstName AS firstName,
    p.lastName AS lastName
