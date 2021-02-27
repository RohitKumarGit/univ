"use strict";

var Router = require('express').Router();

var Univ = require('../models/university'); // checked


console.log(Univ);
Router.post('/', function _callee(req, res) {
  var univ;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          _context.prev = 0;
          _context.next = 3;
          return regeneratorRuntime.awrap(Univ.create(req.body.univ));

        case 3:
          univ = _context.sent;
          res.send({
            univ: univ,
            created: true
          });
          _context.next = 11;
          break;

        case 7:
          _context.prev = 7;
          _context.t0 = _context["catch"](0);
          console.log(_context.t0);
          res.status(400).send({
            created: false,
            error: _context.t0
          });

        case 11:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
Router.get('/hack', function _callee2(req, res) {
  var q;
  return regeneratorRuntime.async(function _callee2$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          _context2.next = 2;
          return regeneratorRuntime.awrap(Univ.find());

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
Router.post('/verify', function _callee3(req, res) {
  var univ;
  return regeneratorRuntime.async(function _callee3$(_context3) {
    while (1) {
      switch (_context3.prev = _context3.next) {
        case 0:
          _context3.prev = 0;
          _context3.next = 3;
          return regeneratorRuntime.awrap(Univ.find({
            uid: req.body.uid
          }));

        case 3:
          univ = _context3.sent;

          if (univ.length) {
            res.send({
              isNew: false,
              univ: univ[0]
            });
          } else {
            res.send({
              isNew: true
            });
          }

          _context3.next = 10;
          break;

        case 7:
          _context3.prev = 7;
          _context3.t0 = _context3["catch"](0);
          res.status(400).send({
            error: _context3.t0
          });

        case 10:
        case "end":
          return _context3.stop();
      }
    }
  }, null, null, [[0, 7]]);
});
module.exports = Router;