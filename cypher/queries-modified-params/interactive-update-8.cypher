MATCH (p1:Person {id: 21990232558208}), (p2:Person {id: 32985348841200})
CREATE (p1)-[:KNOWS {creationDate: 1347529389109}]->(p2)
