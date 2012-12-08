# Here, we'll load whatever needs to handle our application logic
module.exports = (app, buildRequestData) ->
  regionController = require('./../../controllers/regions.coffee')(app)

  app.get '/api/regions', (req, res) ->
    region = regionController.find(req.query.query, (err, results) ->
      res.contentType('json')
      res.send JSON.stringify(results)
    )

  app.get '/api/regions/:id', (req, res) ->
    region = regionController.get(req.params.id, (err, results) ->
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

