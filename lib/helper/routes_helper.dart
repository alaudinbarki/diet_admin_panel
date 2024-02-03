import 'package:base_code/view/screens/account_setting_screen/account_setting_screen.dart';
import 'package:base_code/view/screens/user_screens/user_listing/user_listing_screen.dart';
import 'package:flutter/material.dart';
import '../view/screens/Authentication_screen/signin_screen.dart';
import '../view/screens/connection_screen/connection_error_screen.dart';
import '../view/screens/courses_screen/add_courses/add_course_dashbord_screen.dart';
import '../view/screens/courses_screen/all_courses/all_course_dashbord_screen.dart';
import '../view/screens/courses_screen/lesson_content/lesson_dashbord.dart';
import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/screens/receipe_screens/Ingredients/detail_ingredients/detail_ingredients.dart';
import '../view/screens/receipe_screens/Ingredients/ingredients.dart';
import '../view/screens/receipe_screens/add_new_receipe/new_receipe.dart';
import '../view/screens/receipe_screens/admin_receipe/admin_receipe.dart';
import '../view/screens/receipe_screens/categories/categories.dart';
import '../view/screens/receipe_screens/categories/detail_category/detail_category.dart';
import '../view/screens/receipe_screens/detail_receipe/detail_receipe_sceen.dart';
import '../view/screens/receipe_screens/units_of_measurement/measurements.dart';
import '../view/screens/receipe_screens/user_receipe/user_receipe.dart';
import '../view/screens/splash_screen/splash_screen.dart';
import '../view/screens/user_screens/user_detail/user_detail_screen.dart';
import '../view/screens/widget_tracker/widget_ttracker/widget_tracker_screen.dart';

class RouterHelper {
  static const initial = "/";
  static const signInScreen = "/signInScreen";
  static const signUpScreen = "/signUpScreen";
  static const otpScreen = "/otpScreen";
  static const dashboardScreen = "/dashboardScreen";
  static const noConnectionScreen = "/noConnectionScreen";
  static const receipeScreen = "/receipeScreen";
  static const userListingScreen = "/userListingScreen";
  static const userDetailScreen = "/userDetailScreen";
  static const widgetTrackerScreen = "/widgetTrackerScreen";
  static const accountSettingScreen = "/accountSettingScreen";
  static const userReceipeScreen = "/userReceipeScreen";
  static const adminReceipeScreen = "/adminReceipeScreen";
  static const newReceipeScreen = "/newReceipeScreen";
  static const categoriesScreen = "/categoriesScreen";
  static const ingrediantsScreen = "/ingrediantsScreen";
  static const measurementsScreen = "/measurementsScreen";
  static const allCoursesDashbord = "/allCoursesDashbord";
  static const addCourseDashbord = "/addCourseDashbord";
  static const lessonDashbord = "/lessonDashbord";
  static const detailCategoryScreen = "/detailCategoryScreen";
  static const ingrediantsDetailScreen = "/ingrediantsDetailScreen";
  static const detailReceipeScreen = "/detailReceipeScreen";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    noConnectionScreen: (context) => const NoConnection(),
    signInScreen: (context) => const SignInScreen(),
    dashboardScreen: (context) => const DashboardScreen(),
    accountSettingScreen: (context) => const AccountSettingScreen(),
    userDetailScreen: (context) => const UserDetailScreen(),
    userListingScreen: (context) => const UserListingScreen(),
    widgetTrackerScreen: (context) => const WidgetTrackerScreen(),
    userReceipeScreen: (context) => const UserReceipeScreen(),
    adminReceipeScreen: (context) => const AdminReceipeScreen(),
    newReceipeScreen: (context) => const NewReceipeScreen(),
    categoriesScreen: (context) => const CategoriesScreen(),
    ingrediantsScreen: (context) => const IngrediantsScreen(),
    measurementsScreen: (context) => const MeasurementsScreen(),
    allCoursesDashbord: (context) => const AllCoursesDashbord(),
    addCourseDashbord: (context) => const AddCourseDashbord(),
    lessonDashbord: (context) => const LessonDashbord(),
    detailCategoryScreen: (context) => const DetailCategoryScreen(),
    ingrediantsDetailScreen: (context) => const IngrediantsDetailScreen(),
    detailReceipeScreen: (context) => const DetailReceipeScreen(),
  };
}
