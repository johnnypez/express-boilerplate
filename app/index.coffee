express = require "express"
app = express()

# ssl =  (req, res, next) ->
#   if req.headers['x-forwarded-proto'] isnt "https"
#     res.status(426).json error: 'SSL Required', message: "Please use #{req.app.get('host.url')}"
#   else
#     next()

app.configure ->
  app.set 'host.url', 'http://localhost:3000'

app.configure 'production', ->
  app.set 'host.url', 'https://boilerplate.herokuapp.com'
  # app.use ssl

# LOGGING
logfmt = require("logfmt").namespace(app: 'boilerplate')
app.use logfmt.requestLogger()

# DEFAULT ROUTES
app.get '/', (req, res)->
  res.send "Hello Boilerplate"

module.exports = app