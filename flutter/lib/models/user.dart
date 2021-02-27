import 'package:flutter/foundation.dart';

class User {
  User({
    @required this.uid,
    @required this.name,
    @required this.email,
  });

  final String uid;
  final String name;
  final String email;
}
