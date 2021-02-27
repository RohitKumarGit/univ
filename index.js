const express = require("express");
const app = express()
const parser = require('body-parser')
app.use(parser.json())
var morgan = require('morgan')
const path = require('path')
const port = process.env.PORT || 8082;
require('dotenv').config()
const answers = require('./backend/models/answers')
const notes = require('./backend/models/notes')
const questions = require('./backend/models/questions')
const sessions = require('./backend/models/sessions')
const student = require('./backend/models/student')
const university = require('./backend/models/university')
const mongoose = require('mongoose')
const uri = "mongodb+srv://user:uvOyX5UA6I2mjplk@cluster0.azmit.mongodb.net/NUCLEUS?retryWrites=true&w=majority"
mongoose.connect(uri, {
    useNewUrlParser: "true",
  })
  mongoose.connection.on("error", err => {
    console.log("err", err)
  })
  mongoose.connection.on("connected", (err, res) => {
    console.log("mongoose is connected")
  })
const qrouter = require('./backend/routes/question')
const sessionsRouter = require('./backend/routes/sessions')
const studentRouter = require('./backend/routes/student')
const univRouter = require('./backend/routes/univ')
app.use(morgan('tiny'))
app.use('/api/qna',qrouter)
app.use('/api/session',sessionsRouter)
app.use('/api/student',studentRouter)
app.use('/api/univ',univRouter)
// const AdminBro = require('admin-bro')
// const AdminBroExpress = require('@admin-bro/express')
// const AdminBroOptions = {
//   resources: [answers,notes,questions,sessions,student,university],
// }
// const adminBro = new AdminBro(AdminBroOptions)
// const router = AdminBroExpress.buildRouter(adminBro)
// app.use(router)

  app.listen(port, function (err) {
    if (!err) {
      console.log("server is running at ", port)
    }
})
