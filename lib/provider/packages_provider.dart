import 'package:flutter/material.dart';


class PackagesProvider extends ChangeNotifier {

  // Constants
  bool isMonthly = true;

  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.75,
  );

  int currentPage = 0;
  int totalPages = 4;

  void nextPageBySlide(int page) {
    currentPage = page;
    notifyListeners();
    debugPrint("page ================== : $currentPage");
  }

  setMonthlyPackages(bool value) {
    isMonthly = value;
    notifyListeners();
  }
}
