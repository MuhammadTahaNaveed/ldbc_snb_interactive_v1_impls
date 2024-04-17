// IS5. Creator of a message
/*
:param messageId: 206158431836
 */
MATCH (m:Message {id: 206158431836 })-[:HAS_CREATOR]->(p:Person)
RETURN
    p.id AS personId,
    p.firstName AS firstName,
    p.lastName AS lastName
