// IS4. Content of a message
/*
:param messageId: 6597069786683
 */
MATCH (m:Message {id: 6597069786683 })
RETURN
    m.creationDate as messageCreationDate,
    coalesce(m.content, m.imageFile) as messageContent
