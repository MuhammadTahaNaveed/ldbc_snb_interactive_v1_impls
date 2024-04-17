MATCH (p:Person {id: 6597069776618})
CREATE (f:Forum {id: 2199023287110, title: "Album 14 of Brian Kelly", creationDate: 1347529304194})-[:HAS_MODERATOR]->(p)
WITH f
UNWIND [12273] AS tagId
  MATCH (t:Tag {id: tagId})
  CREATE (f)-[:HAS_TAG]->(t)
