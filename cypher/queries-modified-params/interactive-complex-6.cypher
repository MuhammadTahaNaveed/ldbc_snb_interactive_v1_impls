// Q6. Tag co-occurrence
/*
:param [{ personId, tagName }] => { RETURN
  6597069786683 AS personId,
  "Carl_Gustaf_Emil_Mannerheim" AS tagName
}
*/
MATCH (knownTag:Tag { name: "Carl_Gustaf_Emil_Mannerheim" })
WITH knownTag.id as knownTagId

MATCH (person:Person { id: 6597069786683 })-[:KNOWS*1..2]-(friend)
WHERE NOT person=friend
WITH
    knownTagId,
    collect(distinct friend) as friends
UNWIND friends as f
    MATCH (f)<-[:HAS_CREATOR]-(post:Post),
          (post)-[:HAS_TAG]->(t:Tag{id: knownTagId}),
          (post)-[:HAS_TAG]->(tag:Tag)
    WHERE NOT t = tag
    WITH
        tag.name as tagName,
        count(post) as postCount
RETURN
    tagName,
    postCount
ORDER BY
    postCount DESC,
    tagName ASC
LIMIT 10
