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
    @required this.credits,
  });

  final String title;
  final String link;
  final int ratings;
  final List<String> tags;
  final DateTime dateTime;
  final int maxAttendees;
  final bool done;
  final bool cancelled;
  final int credits;
}
