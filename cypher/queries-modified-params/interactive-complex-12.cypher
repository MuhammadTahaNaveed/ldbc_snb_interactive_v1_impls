// Q12. Expert search
/*
:param [{ personId, tagClassName }] => { RETURN
  6597069786683 AS personId,
  "Monarch" AS tagClassName
}
*/
MATCH (tag:Tag)-[:HAS_TYPE|IS_SUBCLASS_OF*0..]->(baseTagClass:TagClass)
WHERE tag.name = "Monarch" OR baseTagClass.name = "Monarch"
WITH collect(tag.id) as tags
MATCH (:Person {id: 6597069786683 })-[:KNOWS]-(friend:Person)<-[:HAS_CREATOR]-(comment:Comment)-[:REPLY_OF]->(:Post)-[:HAS_TAG]->(tag:Tag)
WHERE tag.id in tags
RETURN
    friend.id AS personId,
    friend.firstName AS personFirstName,
    friend.lastName AS personLastName,
    collect(DISTINCT tag.name) AS tagNames,
    count(DISTINCT comment) AS replyCount
ORDER BY
    replyCount DESC,
    toInteger(personId) ASC
LIMIT 20
