import 'package:flutter/material.dart';

import '../helper/routes_helper.dart';

class OnBoardingProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);

  int currentPage = 0;
  int totalPages = 3;

  void nextPageBySlide(int page) {
    currentPage = page;
    notifyListeners();
  }

  void nextPageByButton(BuildContext context) {
    if (currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, RouterHelper.signInScreen);
    }
  }
}
