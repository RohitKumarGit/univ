"use strict";

// post - done
// upvote - done
// downvote -done
// post answer - done
// get all questions of univ - done
//  get all unanswerd questions  - done
// get all answered questions 
var Router = require('express').Router();

var Question = require('../models/questions');

var Answers = require('../models/answers');

var Student = require('../models/student');

Router.post('/question', function _callee(req, res) {
  var q;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          _context.prev = 0;
          _context.next = 3;
          return regeneratorRuntime.awrap(Question.create(req.body));

        case 3:
          q = _context.sent;
          res.send({
            question: q
          });
          _context.next = 10;
          break;

        case 7:
          _context.prev = 7;
          _context.t0 = _context["catch"](0);
          res.status(400).send();

        case 10:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.post('/upvote', function _callee2(req, res) {
  var q;
  return regeneratorRuntime.async(function _callee2$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          _context2.prev = 0;
          _context2.next = 3;
          return regeneratorRuntime.awrap(Question.findById(req.body.question_id));

        case 3:
          q = _context2.sent;
          q.upvote += 1;
          _context2.next = 7;
          return regeneratorRuntime.awrap(q.save());

        case 7:
          res.send({
            question: q
          });
          _context2.next = 13;
          break;

        case 10:
          _context2.prev = 10;
          _context2.t0 = _context2["catch"](0);
          res.status(400).send();

        case 13:
        case "end":
          return _context2.stop();
      }
    }
  }, null, null, [[0, 10]]);
});
Router.post('/downvote', function _callee3(req, res) {
  var q;
  return regeneratorRuntime.async(function _callee3$(_context3) {
    while (1) {
      switch (_context3.prev = _context3.next) {
        case 0:
          _context3.prev = 0;
          _context3.next = 3;
          return regeneratorRuntime.awrap(Question.findById(req.body.question_id));

        case 3:
          q = _context3.sent;
          q.downvote += 1;
          _context3.next = 7;
          return regeneratorRuntime.awrap(q.save());

        case 7:
          res.send({
            question: q
          });
          _context3.next = 13;
          break;

        case 10:
          _context3.prev = 10;
          _context3.t0 = _context3["catch"](0);
          res.status(400).send();

        case 13:
        case "end":
          return _context3.stop();
      }
    }
  }, null, null, [[0, 10]]);
});
Router.post('/answer', function _callee4(req, res) {
  var q, a;
  return regeneratorRuntime.async(function _callee4$(_context4) {
    while (1) {
      switch (_context4.prev = _context4.next) {
        case 0:
          _context4.prev = 0;
          _context4.next = 3;
          return regeneratorRuntime.awrap(Question.findById(req.body.qid));

        case 3:
          q = _context4.sent;
          _context4.next = 6;
          return regeneratorRuntime.awrap(Answers.create(req.body.answer));

        case 6:
          a = _context4.sent;
          q.answered = true, q.answers.push(a._id);
          _context4.next = 10;
          return regeneratorRuntime.awrap(q.save());

        case 10:
          _context4.next = 12;
          return regeneratorRuntime.awrap(a.save());

        case 12:
          res.send();
          _context4.next = 18;
          break;

        case 15:
          _context4.prev = 15;
          _context4.t0 = _context4["catch"](0);
          res.status(400).send();

        case 18:
        case "end":
          return _context4.stop();
      }
    }
  }, null, null, [[0, 15]]);
});
Router.get('/', function _callee5(req, res) {
  var questions;
  return regeneratorRuntime.async(function _callee5$(_context5) {
    while (1) {
      switch (_context5.prev = _context5.next) {
        case 0:
          _context5.prev = 0;
          _context5.next = 3;
          return regeneratorRuntime.awrap(Question.find({
            univ: req.query.univ_id
          }).populate("answers student"));

        case 3:
          questions = _context5.sent;
          res.send({
            questions: questions
          });
          _context5.next = 10;
          break;

        case 7:
          _context5.prev = 7;
          _context5.t0 = _context5["catch"](0);
          res.status(400).send();

        case 10:
        case "end":
          return _context5.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/unanswered', function _callee6(req, res) {
  var questions;
  return regeneratorRuntime.async(function _callee6$(_context6) {
    while (1) {
      switch (_context6.prev = _context6.next) {
        case 0:
          _context6.prev = 0;
          _context6.next = 3;
          return regeneratorRuntime.awrap(Question.find({
            univ: req.query.univ_id,
            answered: false
          }));

        case 3:
          questions = _context6.sent;
          res.send({
            questions: questions
          });
          _context6.next = 10;
          break;

        case 7:
          _context6.prev = 7;
          _context6.t0 = _context6["catch"](0);
          res.status(400).send();

        case 10:
        case "end":
          return _context6.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/answered', function _callee7(req, res) {
  var questions;
  return regeneratorRuntime.async(function _callee7$(_context7) {
    while (1) {
      switch (_context7.prev = _context7.next) {
        case 0:
          _context7.prev = 0;
          _context7.next = 3;
          return regeneratorRuntime.awrap(Question.find({
            univ: req.query.univ_id,
            answered: true
          }));

        case 3:
          questions = _context7.sent;
          res.send({
            questions: questions
          });
          _context7.next = 10;
          break;

        case 7:
          _context7.prev = 7;
          _context7.t0 = _context7["catch"](0);
          res.status(400).send();

        case 10:
        case "end":
          return _context7.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.post('/award', function _callee8(req, res) {
  var a, s, s1;
  return regeneratorRuntime.async(function _callee8$(_context8) {
    while (1) {
      switch (_context8.prev = _context8.next) {
        case 0:
          _context8.prev = 0;
          _context8.next = 3;
          return regeneratorRuntime.awrap(Answers.findById(req.body.aid));

        case 3:
          a = _context8.sent;
          a.awarded = true;
          _context8.next = 7;
          return regeneratorRuntime.awrap(Student.findById(a.student));

        case 7:
          s = _context8.sent;
          s.credits += 5;
          _context8.next = 11;
          return regeneratorRuntime.awrap(Student.findById(req.body.aid1));

        case 11:
          s1 = _context8.sent;
          // a1d - jisne q pucha h
          sq.credits -= 5;
          _context8.next = 15;
          return regeneratorRuntime.awrap(s.save());

        case 15:
          _context8.next = 17;
          return regeneratorRuntime.awrap(s1.save());

        case 17:
          _context8.next = 19;
          return regeneratorRuntime.awrap(a.save());

        case 19:
          res.send();
          _context8.next = 25;
          break;

        case 22:
          _context8.prev = 22;
          _context8.t0 = _context8["catch"](0);
          res.status(400).send();

        case 25:
        case "end":
          return _context8.stop();
      }
    }
  }, null, null, [[0, 22]]);
});
module.exports = Router;