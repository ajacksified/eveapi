module.exports =
  staticDir: '/public'
  googleAnalyticsId: process.env.GOOGLE_ANALYTICS_ID
  environment: process.env.NODE_ENV || "development"
  assetPath: 'assets'
  jsPath: 'assets/js'
  cssPath: 'assets/css'
  imgPath: 'assets/img'
  templatePath: 'assets/templates'
  name: 'EVE Database API'

  database: process.env.MONGO_PATH || "mongodb://localhost:27017/eveapi"
