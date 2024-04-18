MATCH (author:Person {id: 8796093029267}), (country:Country {id: 0}), (forum:Forum {id: 549755863266})
CREATE (author)<-[:HAS_CREATOR]-(p:Post:Message {
    id: 2199025986581,
    creationDate: 1347529303996,
    locationIP: "61.16.220.210",
    browserUsed: "Chrome",
    language: "tk",
    content: CASE "About Abbas I of Persia, w Shah Mohammed in a coup and placed the 16-year-old Abbas on the th" WHEN '' THEN NULL ELSE "About Abbas I of Persia, w Shah Mohammed in a coup and placed the 16-year-old Abbas on the th" END,
    imageFile: CASE "" WHEN '' THEN NULL ELSE "" END,
    length: 93
  })<-[:CONTAINER_OF]-(forum), (p)-[:IS_LOCATED_IN]->(country)
WITH p
UNWIND [3] AS tagId
  MATCH (t:Tag {id: tagId})
  CREATE (p)-[:HAS_TAG]->(t)
