import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  //Search controller
  TextEditingController searchController = TextEditingController();

  bool? searchTapped;

  setSearchTapped(bool value) {
    searchTapped = value;
    notifyListeners();
  }
}
