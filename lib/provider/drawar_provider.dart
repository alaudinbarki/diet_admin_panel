import 'package:base_code/helper/routes_helper.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/custom_model/drawer_model.dart';
import '../utils/images.dart';

class DrawarProvider extends ChangeNotifier {
  DrawerItems? selectedItem; // Track the selected item
  DrawerItems? selectedSubItem; // Currently selected sub-item

  void setSelectedItem(DrawerItems item) {
    selectedItem = item;
    notifyListeners(); // Notify listeners about the change
  }

  void setSelectedSubItem(DrawerItems item) {
    selectedSubItem = item;
    notifyListeners();
  }

  List<DrawerItems> drawerItems = [
    DrawerItems(
        image: Images.iconDashboard,
        title: "Dashboard",
        path: RouterHelper.dashboardScreen),
    DrawerItems(
        image: Images.iconRecipe,
        isExpanded: false,
        title: "Recipes",
        subItems: [
          DrawerItems(
              title: "Admin Recipes", path: RouterHelper.adminReceipeScreen),
          DrawerItems(
              title: "User Recipes", path: RouterHelper.userReceipeScreen),
          DrawerItems(title: "Add New", path: RouterHelper.newReceipeScreen),
          DrawerItems(title: "Categories", path: RouterHelper.categoriesScreen),
          DrawerItems(
              title: "Ingredients", path: RouterHelper.ingrediantsScreen),
          DrawerItems(
              title: "Units of Measurement",
              path: RouterHelper.measurementsScreen),
          // Add more sub-items if needed
        ],
        path: RouterHelper.adminReceipeScreen),
    DrawerItems(
        image: Images.iconRecipe,
        isExpanded: false,
        title: "Courses",
        subItems: [
          DrawerItems(
              title: "All Courses", path: RouterHelper.allCoursesDashbord),
          DrawerItems(
              title: "Add New Courses", path: RouterHelper.addCourseDashbord),
          // Add more sub-items if needed
        ],
        path: RouterHelper.adminReceipeScreen),
    DrawerItems(
        image: Images.iconLibrary,
        title: "Push Notifications",
        path: RouterHelper.dashboardScreen),
    DrawerItems(
        image: Images.iconWidgetTracker,
        title: "Widget Tracker",
        path: RouterHelper.widgetTrackerScreen),
    DrawerItems(
        image: Images.iconProfile,
        title: "User",
        path: RouterHelper.userListingScreen),
    // DrawerItems(
    //     image: Images.iconLogout,
    //     title: "Log out",
    //     path: RouterHelper.dashboardScreen),
  ];
  notifier() {
    notifyListeners();
  }
}
