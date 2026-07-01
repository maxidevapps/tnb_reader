import 'package:flutter/material.dart';

class ReaderController extends ChangeNotifier {
  int _currentPage = 1;

  int get currentPage => _currentPage;

  void nextPage(int totalPages) {
    if (_currentPage < totalPages) {
      _currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPage > 1) {
      _currentPage--;
      notifyListeners();
    }
  }

  void jumpToPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}