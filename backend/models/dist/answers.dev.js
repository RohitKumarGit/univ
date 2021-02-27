"use strict";

var mongoose = require('mongoose');

var id = mongoose.Types.ObjectId;
var s = {
  type: String,
  required: true
};
var QuestionSchema = new mongoose.Schema({
  title: s,
  desc: s,
  awarded: {
    type: Boolean,
    "default": false
  },
  question: {
    type: id,
    ref: "Question"
  },
  student: {
    type: id,
    ref: "Student"
  },
  univ: {
    type: id,
    ref: "University"
  },
  file: {
    type: String
  }
}, {
  timestamps: true
});
var Question = mongoose.model("Answers", QuestionSchema);
module.exports = Question;