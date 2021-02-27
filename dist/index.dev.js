"use strict";

var express = require("express");

var app = express();

var parser = require('body-parser');

app.use(parser.json());

var morgan = require('morgan');

var path = require('path');

var port = process.env.PORT || 8082;

require('dotenv').config();

var answers = require('./backend/models/answers');

var notes = require('./backend/models/notes');

var questions = require('./backend/models/questions');

var sessions = require('./backend/models/sessions');

var student = require('./backend/models/student');

var university = require('./backend/models/university');

var mongoose = require('mongoose');

var uri = "mongodb+srv://user:uvOyX5UA6I2mjplk@cluster0.azmit.mongodb.net/NUCLEUS?retryWrites=true&w=majority";
mongoose.connect(uri, {
  useNewUrlParser: "true"
});
mongoose.connection.on("error", function (err) {
  console.log("err", err);
});
mongoose.connection.on("connected", function (err, res) {
  console.log("mongoose is connected");
});

var qrouter = require('./backend/routes/question');

var sessionsRouter = require('./backend/routes/sessions');

var studentRouter = require('./backend/routes/student');

var univRouter = require('./backend/routes/univ');

app.use(morgan('tiny'));
app.use('/api/qna', qrouter);
app.use('/api/session', sessionsRouter);
app.use('/api/student', studentRouter);
app.use('/api/univ', univRouter); // const AdminBro = require('admin-bro')
// const AdminBroExpress = require('@admin-bro/express')
// const AdminBroOptions = {
//   resources: [answers,notes,questions,sessions,student,university],
// }
// const adminBro = new AdminBro(AdminBroOptions)
// const router = AdminBroExpress.buildRouter(adminBro)
// app.use(router)

app.listen(port, function (err) {
  if (!err) {
    console.log("server is running at ", port);
  }
});