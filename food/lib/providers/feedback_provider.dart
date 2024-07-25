import 'package:flutter/material.dart';

class FeedbackProvider with ChangeNotifier {
  final List<Map<String, String>> _feedbacks = [];

  List<Map<String, String>> get feedbacks => _feedbacks;

  void addFeedback(String type, String text) {
    _feedbacks.add({
      'type': type,
      'text': text,
    });
    notifyListeners();
  }
}