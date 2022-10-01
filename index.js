// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({optionsSuccessStatus: 200}));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});

app.get("api/")
// your first API endpoint... 
app.get("/api/:date?", function (req, res) {
  let input = req.params.date
  if (input){
  if (/\d{5,}/.test(input)){
    let unixTime = parseInt(input);
    let utcTime = new Date(unixTime).toUTCString();
    res.json({unix: unixTime, utc: utcTime});
  } else {
    let dateInput = new Date(req.params.date);
    let unixDate = + dateInput;
    let utcDate = dateInput.toUTCString();
    if (dateInput == "Invalid Date"){
      res.json({error: "Invalid Date"});
    }
    else{
      res.json({unix: unixDate, utc: utcDate });      
    };
  };
  } else {
    res.json({unix: Date.now(), utc: new Date().toUTCString() })
  };
});


// listen for requests :)
var listener = app.listen(process.env.PORT, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
