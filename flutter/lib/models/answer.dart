import 'package:flutter/material.dart';

class Answer {
  Answer({
    @required this.id,
    @required this.name,
    @required this.answer,
    @required this.accepted,
    @required this.date,
    @required this.student,
  });

  final String id;
  final DateTime date;
  final String name;
  final String answer;
  final bool accepted;
  final String student;
}