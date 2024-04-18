// IS3. Friends of a person
/*
:param personId: 6597069786683
 */
MATCH (n:Person {id: 6597069786683 })-[r:KNOWS]-(friend)
RETURN
    friend.id AS personId,
    friend.firstName AS firstName,
    friend.lastName AS lastName,
    r.creationDate AS friendshipCreationDate
ORDER BY
    friendshipCreationDate DESC,
    toInteger(personId) ASC
