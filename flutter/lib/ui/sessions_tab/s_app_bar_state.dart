import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app_bar_state.dart';

enum SFilter {
  date,
  attendees,
}

extension SFilterExt on SFilter {
  // ignore: missing_return
  String get title {
    switch (this) {
      case SFilter.date: return 'Date';
      case SFilter.attendees: return 'Max Attendees';
    }
  }

  // ignore: missing_return
  IconData get icon {
    switch (this) {
      case SFilter.date: return FontAwesomeIcons.calendar;
      case SFilter.attendees: return FontAwesomeIcons.users;
    }
  }
}

class SAppBarState extends AppBarState {
  var _filter = SFilter.date;
  SFilter get filter => _filter;
  set filter(SFilter f) {
    if (_filter != f) {
      _filter = f;
      notifyListeners();
    }
  }
}