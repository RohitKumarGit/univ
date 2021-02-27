"use strict";

var mongoose = require('mongoose');

var id = mongoose.Types.ObjectId;
var universitySchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  students: [{
    type: id,
    ref: "Student"
  }],
  uid: {
    type: String,
    required: true
  },
  address: {
    type: String
  },
  phone: {
    type: Number
  },
  email: {
    type: String,
    required: true
  },
  logo: {
    type: String
  }
});
var University = mongoose.model("University", universitySchema);
module.exports = University;