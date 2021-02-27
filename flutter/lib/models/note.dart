import 'package:flutter/foundation.dart';

class Note {
  const Note({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.pdfLink,
    @required this.thumbnailLink,
    @required this.tags,
  });

  final String id;
  final String title;
  final String description;
  final String pdfLink;
  final String thumbnailLink;
  final List<String> tags;
}