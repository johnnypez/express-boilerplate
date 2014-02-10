mongoose = require 'mongoose' 

mongoose.connect(process.env.MONGO_URL or process.env.MONGOLAB_URI or 'mongodb://localhost/boilerplate')

module.exports =
  mongoose: mongoose