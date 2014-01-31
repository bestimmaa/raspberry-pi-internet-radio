/*

Respond to HTTP GET requests http://URL.com/?radio=play&volume=100

*/
var regex =  /\/\?(([a-z]+)=([a-z]+|\d+))/
var http = require('http');
http.createServer(function (req, res) {
	console.log("Received request with url:"+req.url);
	var result = regex.exec(req.url);
	console.log("Found arguments: " + result);
	if (result != null){
		if (result.length == 4) {
			if (result[2] == "radio" & result[3] == "stop") {
				console.log("We should stop the radio...");
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
				console.log("We should start the radio...");
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
				console.log("We should start the radio...");
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
				console.log("Change station...");
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

}).listen(8080, '192.168.178.26');
console.log('Server running at http://192.168.178.26:8080/ and http://notanotherhoneypot.selfhost.eu');
