// IS1. Profile of a person
/*
:param personId: 2199023263575
 */
MATCH (n:Person {id: 2199023263575 })-[:IS_LOCATED_IN]->(p:City)
RETURN
    n.firstName AS firstName,
    n.lastName AS lastName,
    n.birthday AS birthday,
    n.locationIP AS locationIP,
    n.browserUsed AS browserUsed,
    p.id AS cityId,
    n.gender AS gender,
    n.creationDate AS creationDate
