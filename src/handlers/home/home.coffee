module.exports = (app, buildRequestData) ->
  app.get '/', (req, res) ->
    res.render 'layouts/layout',
      buildRequestData(
        partials:
          content: '../home/index'
      )
