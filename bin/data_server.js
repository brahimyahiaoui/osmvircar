var http = require('http');
var url = require('url');
var querystring = require('querystring');


var server = http.createServer(function(req, res) {
  var params = querystring.parse(url.parse(req.url).query);
  console.log(params);
  res.end();

});

server.listen(8080);

    