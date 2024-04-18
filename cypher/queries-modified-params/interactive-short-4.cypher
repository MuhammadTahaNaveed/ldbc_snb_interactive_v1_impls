// IS4. Content of a message
/*
:param messageId: 2061585185686
 */
MATCH (m:Message {id: 2061585185686 })
RETURN
    m.creationDate as messageCreationDate,
    coalesce(m.content, m.imageFile) as messageContent
