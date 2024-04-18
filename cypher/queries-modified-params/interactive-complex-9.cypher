// Q9. Recent messages by friends or friends of friends
/*
:param [{ personId, maxDate }] => { RETURN
  6597069786683 AS personId,
  1289908800000 AS maxDate
}
*/
MATCH (root:Person {id: 6597069786683 })-[:KNOWS*1..2]-(friend:Person)
WHERE NOT friend = root
WITH collect(distinct friend) as friends
UNWIND friends as friend
    MATCH (friend)<-[:HAS_CREATOR]-(message:Message)
    WHERE message.creationDate < 1289908800000
RETURN
    friend.id AS personId,
    friend.firstName AS personFirstName,
    friend.lastName AS personLastName,
    message.id AS commentOrPostId,
    coalesce(message.content,message.imageFile) AS commentOrPostContent,
    message.creationDate AS commentOrPostCreationDate
ORDER BY
    commentOrPostCreationDate DESC,
    message.id ASC
LIMIT 20
