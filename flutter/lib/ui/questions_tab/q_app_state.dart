import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum QFilter {
  date,
  votes,
  answers,
}

extension QFilterExt on QFilter {
  // ignore: missing_return
  String get title {
    switch (this) {
      case QFilter.date: return 'Date';
      case QFilter.votes: return 'Votes';
      case QFilter.answers: return 'Answers';
    }
  }

  // ignore: missing_return
  IconData get icon {
    switch (this) {
      case QFilter.date: return FontAwesomeIcons.calendar;
      case QFilter.votes: return FontAwesomeIcons.chevronUp;
      case QFilter.answers: return FontAwesomeIcons.commentAlt;
    }
  }
}

class QAppBarState extends ChangeNotifier {
  final textController = TextEditingController();
  final focusNode = FocusNode();
  final animatedListKey = GlobalKey<AnimatedListState>();
  
  bool _isSearch = false;
  bool get isSearch => _isSearch;
  set isSearch(bool s) {
    if (_isSearch != s) {
      _isSearch = s;
      focusNode.requestFocus();
      notifyListeners();
    }
  }

  var _filter = QFilter.date;
  QFilter get filter => _filter;
  set filter(QFilter f) {
    if (_filter != f) {
      _filter = f;
      notifyListeners();
    }
  }

  final _tags = <String>['flutter', 'android', 'nodejs', 'ruby', 'python', 'ml'];
  
  void addTag() {
    final tag = textController.text;
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      _tags.add(tag);
      textController.clear();
      notifyListeners();
    }
  }

  void removeTag(String tag) {
    _tags.remove(tag);
    notifyListeners();
  }

  int get tagsLength => _tags.length;

  List<String> get tags => [..._tags.reversed];
}