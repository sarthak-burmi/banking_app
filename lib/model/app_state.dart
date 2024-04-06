import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _activePage = '/home';
  String get activePage => _activePage;

  void setActivePage(String page) {
    _activePage = page;
    notifyListeners();
  }
}
