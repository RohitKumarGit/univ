import 'package:flutter/material.dart';

class AppBarState extends ChangeNotifier {
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

  final _tags = <String>[];
  
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

  void search() {
    notifyListeners();
  }
}