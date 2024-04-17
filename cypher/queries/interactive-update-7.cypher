MATCH
  (author:Person {id: 8796093030860}),
  (country:Country {id: 76}),
  (message:Message {id: 2199024038761 + -1 + 1}) // $replyToCommentId is -1 if the message is a reply to a post and vica versa (see spec)
CREATE (author)<-[:HAS_CREATOR]-(c:Comment:Message {
    id: 2199024038763,
    creationDate: 1347528969834,
    locationIP: "213.55.65.79",
    browserUsed: "Firefox",
    content: "About Arnold Schoenberg, ist movement in German poetry and art, andAbout Ecce Cor M",
    length: 83
  })-[:REPLY_OF]->(message),
  (c)-[:IS_LOCATED_IN]->(country)
WITH c
UNWIND [146,11287] AS tagId
  MATCH (t:Tag {id: tagId})
  CREATE (c)-[:HAS_TAG]->(t)