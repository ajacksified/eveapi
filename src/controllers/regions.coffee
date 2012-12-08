module.exports = (app) ->
  collection = app.db.collection('regions')

  regions =
    get: (id, cb) ->
      id = id + ""
      data = collection.find({ regionID: id }, { limit: 1 })

      data.toArray((err, results) ->
        cb(err, results)
      )

    find: (query, cb) ->
      data = collection.find(query, { limit: 25 })

      data.toArray((err, results) ->
        cb(err, results)
      )

  return {
    get: regions.get
    find: regions.find
  }

