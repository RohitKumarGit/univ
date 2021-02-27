import 'package:flutter/material.dart';

import 'answer.dart';

class Question {
  Question({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.votes,
    @required this.date,
    @required this.name,
    @required this.isAnswered,
    @required this.voted,
    @required this.uid,
    @required this.answersList,
    this.tags = const [],
  });

  final String id;
  final String title;
  final String description;
  final int votes;
  final DateTime date;
  final String name;
  final bool isAnswered;
  final bool voted;
  final List<String> tags;
  final String uid;
  final List<Answer> answersList;

  int get answers => answersList.length;

  Color get upVoteCol => (voted ?? false) ? Colors.deepOrange : null;

  Color get downVoteCol => (voted ?? true) ? null : Colors.deepPurple;
}