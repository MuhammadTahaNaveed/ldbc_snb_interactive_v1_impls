MATCH (c:City {id: 117})
CREATE (p:Person {
    id: 35184372093118,
    firstName: "Sanjay",
    lastName: "Anand",
    gender: "male",
    birthday: 581990400000,
    creationDate: 1347533555467,
    locationIP: "103.1.131.183",
    browserUsed: "Firefox",
    languages: ["te","bn","en"],
    email: ["Sanjay35184372093118@gmail.com","Sanjay35184372093118@gmx.com","Sanjay35184372093118@yahoo.com"]
  })-[:IS_LOCATED_IN]->(c)
WITH p, count(*) AS dummy1
UNWIND [4,571,1187,2931,8163,10222,12296] AS tagId
  MATCH (t:Tag {id: tagId})
  CREATE (p)-[:HAS_INTEREST]->(t)
WITH p, count(*) AS dummy2
UNWIND [[3650,2007]] AS s
  MATCH (u:Organisation {id: s[0]})
  CREATE (p)-[:STUDY_AT {classYear: s[1]}]->(u)
WITH p, count(*) AS dummy3
UNWIND [[554,2008]] AS w
  MATCH (comp:Organisation {id: w[0]})
  CREATE (p)-[:WORKS_AT {workFrom: w[1]}]->(comp)
