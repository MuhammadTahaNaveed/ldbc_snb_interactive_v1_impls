MATCH (person:Person {id: 102}), (comment:Comment {id: 2199029728710})
CREATE (person)-[:LIKES {creationDate: 1347529096733}]->(comment)