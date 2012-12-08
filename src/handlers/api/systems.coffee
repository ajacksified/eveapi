# Here, we'll load whatever needs to handle our application logic
module.exports = (app, buildRequestData) ->
  systemController = require('./../../controllers/systems.coffee')(app)

  app.get '/api/systems', (req, res) ->
    system = systemController.find(req.query.query, (err, results) ->
      res.contentType('json')
      res.send JSON.stringify(results)
    )

  app.get '/api/systems/:id', (req, res) ->
    system = systemController.get(req.params.id, (err, results) ->
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

