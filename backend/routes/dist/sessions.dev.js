"use strict";

var Router = require('express').Router();

var Sessions = require('../models/sessions');

var Student = require('../models/student');

Router.post('/', function _callee(req, res) {
  var session;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          _context.prev = 0;
          _context.next = 3;
          return regeneratorRuntime.awrap(Sessions.create(req.body));

        case 3:
          session = _context.sent;
          res.send({
            session: session,
            created: true
          });
          _context.next = 10;
          break;

        case 7:
          _context.prev = 7;
          _context.t0 = _context["catch"](0);
          res.send({
            error: _context.t0,
            created: false
          });

        case 10:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/teaching', function _callee2(req, res) {
  var sessions;
  return regeneratorRuntime.async(function _callee2$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          _context2.prev = 0;
          _context2.next = 3;
          return regeneratorRuntime.awrap(Sessions.find({
            univ: req.query.univ_id,
            teaching: true
          }).populate("student attendees"));

        case 3:
          sessions = _context2.sent;
          res.send({
            sessions: sessions
          });
          _context2.next = 10;
          break;

        case 7:
          _context2.prev = 7;
          _context2.t0 = _context2["catch"](0);
          res.send({
            error: _context2.t0
          });

        case 10:
        case "end":
          return _context2.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/discussion', function _callee3(req, res) {
  var sessions;
  return regeneratorRuntime.async(function _callee3$(_context3) {
    while (1) {
      switch (_context3.prev = _context3.next) {
        case 0:
          _context3.prev = 0;
          _context3.next = 3;
          return regeneratorRuntime.awrap(Sessions.find({
            univ: req.query.univ_id,
            teaching: false
          }));

        case 3:
          sessions = _context3.sent;
          res.send({
            sessions: sessions
          });
          _context3.next = 10;
          break;

        case 7:
          _context3.prev = 7;
          _context3.t0 = _context3["catch"](0);
          res.send({
            error: _context3.t0
          });

        case 10:
        case "end":
          return _context3.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/cancelled', function _callee4(req, res) {
  var sessions;
  return regeneratorRuntime.async(function _callee4$(_context4) {
    while (1) {
      switch (_context4.prev = _context4.next) {
        case 0:
          _context4.prev = 0;
          _context4.next = 3;
          return regeneratorRuntime.awrap(Sessions.find({
            univ: req.query.univ_id,
            cancelled: true
          }));

        case 3:
          sessions = _context4.sent;
          res.send({
            sessions: sessions
          });
          _context4.next = 10;
          break;

        case 7:
          _context4.prev = 7;
          _context4.t0 = _context4["catch"](0);
          res.send({
            error: _context4.t0
          });

        case 10:
        case "end":
          return _context4.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/completed', function _callee5(req, res) {
  var sessions;
  return regeneratorRuntime.async(function _callee5$(_context5) {
    while (1) {
      switch (_context5.prev = _context5.next) {
        case 0:
          _context5.prev = 0;
          _context5.next = 3;
          return regeneratorRuntime.awrap(Sessions.find({
            univ: req.query.univ_id,
            done: true
          }));

        case 3:
          sessions = _context5.sent;
          res.send({
            sessions: sessions
          });
          _context5.next = 10;
          break;

        case 7:
          _context5.prev = 7;
          _context5.t0 = _context5["catch"](0);
          res.send({
            error: _context5.t0
          });

        case 10:
        case "end":
          return _context5.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/userteaching', function _callee6(req, res) {
  var sessions;
  return regeneratorRuntime.async(function _callee6$(_context6) {
    while (1) {
      switch (_context6.prev = _context6.next) {
        case 0:
          _context6.prev = 0;
          _context6.next = 3;
          return regeneratorRuntime.awrap(Sessions.find({
            student: req.query.student_id
          }));

        case 3:
          sessions = _context6.sent;
          res.send({
            sessions: sessions
          });
          _context6.next = 10;
          break;

        case 7:
          _context6.prev = 7;
          _context6.t0 = _context6["catch"](0);
          res.send({
            error: _context6.t0
          });

        case 10:
        case "end":
          return _context6.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/hack', function _callee7(req, res) {
  var q;
  return regeneratorRuntime.async(function _callee7$(_context7) {
    while (1) {
      switch (_context7.prev = _context7.next) {
        case 0:
          _context7.next = 2;
          return regeneratorRuntime.awrap(Question.find());

        case 2:
          q = _context7.sent;
          res.send(q);

        case 4:
        case "end":
          return _context7.stop();
      }
    }
  });
});
Router.post('/register', function _callee8(req, res) {
  var sessions;
  return regeneratorRuntime.async(function _callee8$(_context8) {
    while (1) {
      switch (_context8.prev = _context8.next) {
        case 0:
          _context8.prev = 0;
          _context8.next = 3;
          return regeneratorRuntime.awrap(Sessions.findById(req.body.session_id));

        case 3:
          sessions = _context8.sent;
          sessions.attendees.push(req.body.student_id);
          _context8.next = 7;
          return regeneratorRuntime.awrap(sessions.save());

        case 7:
          res.send({
            done: true
          });
          _context8.next = 13;
          break;

        case 10:
          _context8.prev = 10;
          _context8.t0 = _context8["catch"](0);
          res.status(400).send({
            done: false
          });

        case 13:
        case "end":
          return _context8.stop();
      }
    }
  }, null, null, [[0, 10]]);
});
Router.get('/userteaching1', function _callee9(req, res) {
  var sessions;
  return regeneratorRuntime.async(function _callee9$(_context9) {
    while (1) {
      switch (_context9.prev = _context9.next) {
        case 0:
          _context9.prev = 0;
          _context9.next = 3;
          return regeneratorRuntime.awrap(Sessions.find({
            attendees: req.query.student_id
          }));

        case 3:
          sessions = _context9.sent;
          res.send({
            sessions: sessions
          });
          _context9.next = 10;
          break;

        case 7:
          _context9.prev = 7;
          _context9.t0 = _context9["catch"](0);
          res.send({
            error: _context9.t0
          });

        case 10:
        case "end":
          return _context9.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.post('/rate', function _callee10(req, res) {
  var session;
  return regeneratorRuntime.async(function _callee10$(_context10) {
    while (1) {
      switch (_context10.prev = _context10.next) {
        case 0:
          _context10.prev = 0;
          _context10.next = 3;
          return regeneratorRuntime.awrap(Sessions.findById(req.body.session_id));

        case 3:
          session = _context10.sent;
          session.nrated += 1;
          session.ratings = (session.ratings + req.body.rating) / session.nrated;
          _context10.next = 8;
          return regeneratorRuntime.awrap(session.save());

        case 8:
          session = _context10.sent;
          res.send({
            session: session
          });
          _context10.next = 16;
          break;

        case 12:
          _context10.prev = 12;
          _context10.t0 = _context10["catch"](0);
          console.log(_context10.t0);
          res.send({
            error: _context10.t0
          });

        case 16:
        case "end":
          return _context10.stop();
      }
    }
  }, null, null, [[0, 12]]);
});
Router.post('/rsvp', function _callee11(req, res) {
  var session;
  return regeneratorRuntime.async(function _callee11$(_context11) {
    while (1) {
      switch (_context11.prev = _context11.next) {
        case 0:
          _context11.prev = 0;
          _context11.next = 3;
          return regeneratorRuntime.awrap(Sessions.findById(req.body.session_id));

        case 3:
          session = _context11.sent;
          session.rsvp = true;
          _context11.next = 7;
          return regeneratorRuntime.awrap(session.save());

        case 7:
          session = _context11.sent;
          res.send({
            session: session
          });
          _context11.next = 15;
          break;

        case 11:
          _context11.prev = 11;
          _context11.t0 = _context11["catch"](0);
          console.log(_context11.t0);
          res.send({
            error: _context11.t0
          });

        case 15:
        case "end":
          return _context11.stop();
      }
    }
  }, null, null, [[0, 11]]);
});
Router.post('/cancel', function _callee12(req, res) {
  var session;
  return regeneratorRuntime.async(function _callee12$(_context12) {
    while (1) {
      switch (_context12.prev = _context12.next) {
        case 0:
          _context12.prev = 0;
          _context12.next = 3;
          return regeneratorRuntime.awrap(Sessions.findById(req.body.session_id));

        case 3:
          session = _context12.sent;
          session.cancelled = true;
          _context12.next = 7;
          return regeneratorRuntime.awrap(session.save());

        case 7:
          session = _context12.sent;
          res.send({
            session: session
          });
          _context12.next = 14;
          break;

        case 11:
          _context12.prev = 11;
          _context12.t0 = _context12["catch"](0);
          res.send({
            error: _context12.t0
          });

        case 14:
        case "end":
          return _context12.stop();
      }
    }
  }, null, null, [[0, 11]]);
});
Router.post('/done', function _callee14(req, res) {
  var session, inst, student;
  return regeneratorRuntime.async(function _callee14$(_context14) {
    while (1) {
      switch (_context14.prev = _context14.next) {
        case 0:
          _context14.prev = 0;
          _context14.next = 3;
          return regeneratorRuntime.awrap(Sessions.findById(req.body.session_id));

        case 3:
          session = _context14.sent;
          session.done = true;
          inst = session.student;
          _context14.next = 8;
          return regeneratorRuntime.awrap(Student.findById(inst));

        case 8:
          student = _context14.sent;
          student.credits += session.credit * session.attendees.length;
          session.attendees.forEach(function _callee13(v) {
            var s;
            return regeneratorRuntime.async(function _callee13$(_context13) {
              while (1) {
                switch (_context13.prev = _context13.next) {
                  case 0:
                    _context13.next = 2;
                    return regeneratorRuntime.awrap(Student.findById(v));

                  case 2:
                    s = _context13.sent;
                    s.credits -= session.credit;
                    _context13.next = 6;
                    return regeneratorRuntime.awrap(s.save());

                  case 6:
                  case "end":
                    return _context13.stop();
                }
              }
            });
          });
          _context14.next = 13;
          return regeneratorRuntime.awrap(session.save());

        case 13:
          session = _context14.sent;
          res.send({
            session: session
          });
          _context14.next = 20;
          break;

        case 17:
          _context14.prev = 17;
          _context14.t0 = _context14["catch"](0);
          res.send({
            error: _context14.t0
          });

        case 20:
        case "end":
          return _context14.stop();
      }
    }
  }, null, null, [[0, 17]]);
});
module.exports = Router;