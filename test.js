//+19149964218
// Download the helper library from https://www.twilio.com/docs/node/install
// Your Account Sid and Auth Token from twilio.com/console
// and set the environment variables. See http://twil.io/secure
const accountSid = "AC09c05253e221564c5a125d2806486f18";
const authToken = "a39aee1d16a13f04e5672be2e44ee512";
const client = require('twilio')(accountSid, authToken);

client.messages
      .create({body: 'Hi there!', from: '+19149964218', to: '+916203861756'})
      .then(message => console.log(message.sid));
