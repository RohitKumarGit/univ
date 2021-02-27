import 'package:flutter/foundation.dart';

class User {
  User({
    @required this.credits,
    @required this.studentId,
    @required this.name,
    @required this.email,
    @required this.univId,
  });

  final int credits;
  final String studentId;
  final String name;
  final String email;
  final String univId;
}
