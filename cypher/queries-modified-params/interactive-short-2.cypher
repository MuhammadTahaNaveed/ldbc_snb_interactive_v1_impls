// IS2. Recent messages of a person
/*
:param personId: 2199023263575
 */
MATCH (:Person {id: 2199023263575})<-[:HAS_CREATOR]-(message)
WITH
 message,
 message.id AS messageId,
 message.creationDate AS messageCreationDate
ORDER BY messageCreationDate DESC, messageId ASC
LIMIT 10
MATCH (message)-[:REPLY_OF*0..]->(post:Post),
      (post)-[:HAS_CREATOR]->(person)
RETURN
 messageId,
 coalesce(message.imageFile,message.content) AS messageContent,
 messageCreationDate,
 post.id AS postId,
 person.id AS personId,
 person.firstName AS personFirstName,
 person.lastName AS personLastName
ORDER BY messageCreationDate DESC, messageId ASC
