import 'package:flutter/material.dart';

import '../data/model/custom_model/recepies_model.dart';
import '../data/model/custom_model/tab_item_model.dart';

class RecepieProvider extends ChangeNotifier {
  final List<TabItem> tabs = [
    TabItem(label: 'All', count: '265'),
    TabItem(label: 'Drafts', count: '10'),
    TabItem(label: 'Trash', count: '74'),
    TabItem(label: 'Imported', count: '8'),
  ];
  final List<TabItem> courseTabs = [
    TabItem(label: 'All', count: '265'),
    TabItem(label: 'Drafts', count: '10'),
    TabItem(label: 'Published', count: '74'),
    TabItem(label: 'Bin', count: '8'),
  ];
  final List<TabItem> selectedLanguagesList = [
    TabItem(label: 'Afrikaans', count: ''),
    TabItem(label: 'English', count: ''),
  ];
  int selectedAddNewLanguage = 0; // Track the selected index

  List<Recipe> recipeList = [
    Recipe(
      title: 'Chicken Salad with Mayonnaise Dressing',
      category: 'Chicken & Salad/Vegetables',
      author: 'Admin',
      uploadDate: '04-Aug-19 14:08',
      status: 'Published',
    ),
  ];
  String dropdownValue = 'Select Category';
  String additonalCategoriesValue = 'Select Categories';

  // List of items in our dropdown menu
  var items = [
    'Select Category',
    'Pizza Items',
    'Pasta Items',
  ];
  var additionalItems = [
    'Select Categories',
    'Pasta ',
    'Pasta Items',
  ];

  notifer() {
    notifyListeners();
  }
}
