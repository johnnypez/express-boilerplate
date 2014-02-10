require '../test_helper'
request = require "request"

port = 3333
app  = require "../../app"
server = null

path = (str)->
  "http://localhost:#{port}#{str}"

describe "app", ->
  before (done) ->
    server = app.listen port, done
    
  after (done) -> server.close() and done()

  it "should exist", (done) ->
    expect(app).to.be.ok
    done()

  it "should be listening at localhost:3333", (done) ->
    request path('/'), (err, res, body) ->
      expect(res.statusCode).to.be 200
      expect(body).to.be "Hello Boilerplate"
      done()
