import 'package:flutter/material.dart';

class RouteTab {
  RouteTab({
    @required this.label,
    @required this.icon,
    @required this.build,
  });

  final String label;
  final IconData icon;
  final Function() build;
}

class Tabs extends ChangeNotifier {
  Tabs({
    @required this.routes,
    int selectedIndex,
  })  : assert(routes != null && routes.isNotEmpty),
        _selectedIndex = selectedIndex ?? 0;

  final List<RouteTab> routes;

  int _selectedIndex;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int i) {
    if (_selectedIndex != i) {
      _selectedIndex = i;
      notifyListeners();
    }
  }

  RouteTab get route => routes[_selectedIndex];
}
