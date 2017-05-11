http = require 'http'
express = require 'express'
bodyParser = require 'body-parser'

PORT = process.env.PORT or 5000

app = express()
app.use express.static __dirname+'/../public'
app.use bodyParser.json()

# require controller endpoints here

# default for requests
app.get '/*', (req, res) -> res.sendFile 'index.html', { root: __dirname + '/../public' }

http.createServer(app).listen PORT, -> console.log "Express started on port #{PORT}"