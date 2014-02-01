/*

Respond to HTTP GET requests http://URL.com/?radio=play&volume=100

*/
var regex =  /\/\?(([a-z]+)=([a-z]+|\d+))/
var ip = "192.168.178.26"
var port = "8080"

var http = require('http');
http.createServer(function (req, res) {
	console.log("Received request with url:"+req.url);
	var result = regex.exec(req.url);
	console.log("Found arguments: " + result);
	if (result != null){
		if (result.length == 4) {
			if (result[2] == "radio" & result[3] == "stop") {
				console.log("Starting radio...");
				var sys = require('sys')
				var exec = require('child_process').exec;
				function puts(error, stdout, stderr) {
				 	sys.puts(stdout);
				 	res.writeHead(200, {'Content-Type': 'text/plain'});
	  				res.end(stdout);
				}
				exec("mpc stop", puts);
			};
			if (result[2] == "radio" & result[3] == "start") {
				console.log("Stopping radio...");
				var sys = require('sys')
				var exec = require('child_process').exec;
				function puts(error, stdout, stderr) {
				 	sys.puts(stdout);
				 	res.writeHead(200, {'Content-Type': 'text/plain'});
	  				res.end(stdout);
				}
				exec("mpc play", puts);
			};

			if (result[2] == "volume") {
				console.log("Changing volume...");
				var sys = require('sys')
				var exec = require('child_process').exec;
				function puts(error, stdout, stderr) {
				 	sys.puts(stdout);
				 	res.writeHead(200, {'Content-Type': 'text/plain'});
	  				res.end(stdout);
				}
				exec("mpc volume "+result[3], puts);
			};

			if (result[2] == "station") {
				console.log("Changing station...");
				var sys = require('sys')
				var exec = require('child_process').exec;
				function puts(error, stdout, stderr) {
				 	sys.puts(stdout);
				 	res.writeHead(200, {'Content-Type': 'text/plain'});
	  				res.end(stdout);
				}
				exec("mpc clear;"+"mpc load "+result[3]+".pls"+";mpc play", puts);
			};

		}

		else{
					res.writeHead(200, {'Content-Type': 'text/plain'});
	  				res.end("Bad number of arguments!");
		}

	}

	else{
			res.writeHead(200, {'Content-Type': 'text/plain'});
  			res.end('Hello World!');
	}

}).listen(port, ip);
console.log('Server running at http://'+ip+':'+port+' and '+process.env.SERVER_URL);
