import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  String _title = "abc";
  String get title => _title;
  set setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  String _content = "abcdefghijklmnopqrstuvwxyz";
  String get content => _content;
  set setContent(String value) {
    _content = value;
    notifyListeners();
  }



  String _noteId = "abcdefghijklmnopqrstuvwxyz";
  String get noteId => _noteId;
  set setNoteId(String value) {
    _noteId = value;
    notifyListeners();
  }


}
