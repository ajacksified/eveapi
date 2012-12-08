module.exports = (app) ->
  collection = app.db.collection('systems')

  systems =
    get: (id, cb) ->
      id = id + ""
      data = collection.find({ solarSystemID: id }, { limit: 1 })

      data.toArray((err, results) ->
        cb(err, results)
      )

    find: (query, cb) ->
      data = collection.find(query, { limit: 25 })

      data.toArray((err, results) ->
        cb(err, results)
      )

  return {
    get: systems.get
    find: systems.find
  }

