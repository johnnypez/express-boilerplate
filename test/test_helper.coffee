dbName = "boilerplate_test"

process.env.NODE_ENV = 'test'
process.env.MONGO_URL = "mongodb://localhost/#{dbName}"

global.expect = require "expect.js"
global._ = require "underscore"

db = require "../config/db"
exec = require("child_process").exec

# you can use mongoexport to dump collections into the fixtures dir and then load them in for tests here
# global.loadFixtures = (done)->
#   commands = [
#     "mongoimport --db #{dbName} --collection users --file test/fixtures/users.json",
#     "mongoimport --db #{dbName} --collection posts --file test/fixtures/posts.json"
#   ]
#   exec commands.join(' && '), done

# wait for db connection
before (done)->
  db.mongoose.connection.on "connected", done

# clean db after each test
beforeEach (done)->
  db.mongoose.connection.db.executeDbCommand({dropDatabase:1}, done)
 
# close db connection 
after (done)->
  # disconnect from mongo
  db.mongoose.connection.close done