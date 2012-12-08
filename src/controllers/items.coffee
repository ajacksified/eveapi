module.exports = (app) ->
  collection = app.db.collection('items')

  items =
    get: (id, cb) ->
      id = id + ""
      data = collection.find({ typeID: id }, { limit: 1 })

      data.toArray((err, results) ->
        cb(err, results)
      )

    find: (query, cb) ->
      data = collection.find(query, { limit: 25 })

      data.toArray((err, results) ->
        cb(err, results)
      )

  return {
    get: items.get
    find: items.find
  }
