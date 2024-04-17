MATCH (person:Person {id: 26388279073665}), (post:Post {id: 1236953235741})
CREATE (person)-[:LIKES {creationDate: 1347528992194}]->(post)
