import 'package:flutter/material.dart';

class ReaderController extends ChangeNotifier {
  int _currentPage = 1;

  int get currentPage => _currentPage;

  bool get isCover => _currentPage == 1;

  void nextPage(int totalPages) {
    if (_currentPage == 1) {
      _currentPage = 2;
    } else if (_currentPage + 2 <= totalPages) {
      _currentPage += 2;
    } else if (_currentPage < totalPages) {
      _currentPage = totalPages;
    }

    notifyListeners();
  }

  void previousPage() {
    if (_currentPage == 2) {
      _currentPage = 1;
    } else if (_currentPage > 2) {
      _currentPage -= 2;
    }

    notifyListeners();
  }

  void jumpToPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}