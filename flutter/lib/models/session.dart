import 'package:flutter/material.dart';

class Session {
  Session({
    @required this.title,
    @required this.link,
    @required this.ratings,
    @required this.tags,
    @required this.dateTime,
    @required this.maxAttendees,
    @required this.done,
    @required this.cancelled,
  });

  final String title;
  final String link;
  final int ratings;
  final List<String> tags;
  final DateTime dateTime;
  final int maxAttendees;
  final bool done;
  final bool cancelled;
}

class TeachingSession extends Session {
  TeachingSession({
    String title,
    String link,
    int ratings,
    List<String> tags,
    DateTime dateTime,
    int maxAttendees,
    bool done,
    bool cancelled,
    @required this.credits,
    @required this.student,
  }) : super(
    title: title,
    link: link,
    ratings: ratings,
    tags: tags,
    dateTime: dateTime,
    maxAttendees: maxAttendees,
    done: done,
    cancelled: cancelled,
  );

  final int credits;
  final String student;
}