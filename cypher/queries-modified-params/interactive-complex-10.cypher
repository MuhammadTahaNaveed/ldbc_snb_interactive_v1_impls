// Q10. Friend recommendation
/*
:param [{ personId, month }] => { RETURN
  6597069786683 AS personId,
  5 AS month
}
*/
MATCH (person:Person {id: 6597069786683})-[:KNOWS*2..2]-(friend),
       (friend)-[:IS_LOCATED_IN]->(city:City)
WHERE NOT friend=person AND
      NOT (friend)-[:KNOWS]-(person)
WITH person, city, friend, datetime({epochMillis: friend.birthday}) as birthday
WHERE  (birthday.month=5 AND birthday.day>=21) OR
        (birthday.month=(5%12)+1 AND birthday.day<22)
WITH DISTINCT friend, city, person
OPTIONAL MATCH (friend)<-[:HAS_CREATOR]-(post:Post)
WITH friend, city, collect(post) AS posts, person
WITH friend,
     city,
     size(posts) AS postCount,
     size([p IN posts WHERE (p)-[:HAS_TAG]->()<-[:HAS_INTEREST]-(person)]) AS commonPostCount
RETURN friend.id AS personId,
       friend.firstName AS personFirstName,
       friend.lastName AS personLastName,
       commonPostCount - (postCount - commonPostCount) AS commonInterestScore,
       friend.gender AS personGender,
       city.name AS personCityName
ORDER BY commonInterestScore DESC, personId ASC
LIMIT 10
