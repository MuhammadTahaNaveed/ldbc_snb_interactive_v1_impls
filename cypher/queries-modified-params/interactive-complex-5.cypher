// Q5. New groups
/*
:param [{ personId, minDate }] => { RETURN
  6597069786683 AS personId,
  1288612800000 AS minDate
}
*/
MATCH (person:Person { id: 6597069786683 })-[:KNOWS*1..2]-(friend)
WHERE
    NOT person=friend
WITH DISTINCT friend
MATCH (friend)<-[membership:HAS_MEMBER]-(forum)
WHERE
    membership.joinDate > 1288612800000
WITH
    forum,
    collect(friend) AS friends
OPTIONAL MATCH (friend)<-[:HAS_CREATOR]-(post)<-[:CONTAINER_OF]-(forum)
WHERE
    friend IN friends
WITH
    forum,
    count(post) AS postCount
RETURN
    forum.title AS forumName,
    postCount
ORDER BY
    postCount DESC,
    forum.id ASC
LIMIT 20
