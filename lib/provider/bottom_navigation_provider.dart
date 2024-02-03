import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int currentIndex = 0;

  setCurrentIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
