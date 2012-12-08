# Here, we'll load whatever needs to handle our application logic
module.exports = (app, buildRequestData) ->
  itemController = require('./../../controllers/items.coffee')(app)

  app.get '/api/items', (req, res) ->
    item = itemController.find(req.query.query, (err, results) ->
      res.contentType('json')
      res.send JSON.stringify(results)
    )

  app.get '/api/items/:id', (req, res) ->
    item = itemController.get(req.params.id, (err, results) ->
      unless err || results.length < 1
        res.contentType('json')
        res.send JSON.stringify(results[0])
      else if err
        res.contentType('json')
        res.send JSON.stringify({error: err})
      else
        res.contentType('json')
        res.send JSON.stringify({})
    )
