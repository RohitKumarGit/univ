"use strict";

var Router = require('express').Router();

var Student = require('../models/student');

var University = require('../models/university'); // done


Router.post('/', function _callee(req, res) {
  var student, univ;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          _context.prev = 0;
          _context.next = 3;
          return regeneratorRuntime.awrap(Student.create(req.body.student));

        case 3:
          student = _context.sent;
          _context.next = 6;
          return regeneratorRuntime.awrap(University.findById(req.body.student.univ));

        case 6:
          univ = _context.sent;
          univ.students.push(student._id);
          _context.next = 10;
          return regeneratorRuntime.awrap(univ.save());

        case 10:
          res.send({
            created: true,
            student: student,
            univ: univ
          });
          _context.next = 17;
          break;

        case 13:
          _context.prev = 13;
          _context.t0 = _context["catch"](0);
          console.log(_context.t0);
          res.status(400).send({
            error: _context.t0
          });

        case 17:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[0, 13]]);
});
Router.get('/hack', function _callee2(req, res) {
  var q;
  return regeneratorRuntime.async(function _callee2$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          _context2.next = 2;
          return regeneratorRuntime.awrap(Student.find());

        case 2:
          q = _context2.sent;
          res.send(q);

        case 4:
        case "end":
          return _context2.stop();
      }
    }
  });
});
Router.get('/', function _callee3(req, res) {
  var student;
  return regeneratorRuntime.async(function _callee3$(_context3) {
    while (1) {
      switch (_context3.prev = _context3.next) {
        case 0:
          _context3.prev = 0;
          _context3.next = 3;
          return regeneratorRuntime.awrap(Student.findOne({
            uid: req.query.uid
          }).populate("univ"));

        case 3:
          student = _context3.sent;
          res.send({
            student: student
          });
          _context3.next = 11;
          break;

        case 7:
          _context3.prev = 7;
          _context3.t0 = _context3["catch"](0);
          console.log(_context3.t0);
          res.status(400).send({
            error: _context3.t0
          });

        case 11:
        case "end":
          return _context3.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/verify', function _callee4(req, res) {
  var student;
  return regeneratorRuntime.async(function _callee4$(_context4) {
    while (1) {
      switch (_context4.prev = _context4.next) {
        case 0:
          _context4.prev = 0;
          _context4.next = 3;
          return regeneratorRuntime.awrap(Student.find({
            uid: req.query.email
          }).populate("univ"));

        case 3:
          student = _context4.sent;

          if (student.length) {
            res.send({
              isNew: false,
              student: student
            });
          }

          res.send({
            isNew: true
          });
          _context4.next = 12;
          break;

        case 8:
          _context4.prev = 8;
          _context4.t0 = _context4["catch"](0);
          console.log(_context4.t0);
          res.status(400).send({
            error: _context4.t0
          });

        case 12:
        case "end":
          return _context4.stop();
      }
    }
  }, null, null, [[0, 8]]);
});
Router.get('/all', function _callee5(req, res) {
  var students;
  return regeneratorRuntime.async(function _callee5$(_context5) {
    while (1) {
      switch (_context5.prev = _context5.next) {
        case 0:
          _context5.prev = 0;
          _context5.next = 3;
          return regeneratorRuntime.awrap(Student.find({
            univ: req.query.univ_id
          }));

        case 3:
          students = _context5.sent;
          res.send(students);
          _context5.next = 10;
          break;

        case 7:
          _context5.prev = 7;
          _context5.t0 = _context5["catch"](0);
          console.log(_context5.t0);

        case 10:
        case "end":
          return _context5.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
module.exports = Router;