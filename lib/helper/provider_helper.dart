import 'package:base_code/provider/dashboard_provider.dart';
import 'package:base_code/provider/recepie_provider.dart';
import 'package:base_code/provider/user_provider.dart';
import 'package:base_code/provider/utils_provider.dart';
import 'package:provider/provider.dart';
import '../provider/authentication_provider.dart';
import '../provider/drawar_provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<UtilProvider>(create: (context) => UtilProvider()),
    ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ChangeNotifierProvider<DashboardProvider>(
        create: (context) => DashboardProvider()),
    ChangeNotifierProvider<DrawarProvider>(
        create: (context) => DrawarProvider()),
    ChangeNotifierProvider<RecepieProvider>(
        create: (context) => RecepieProvider()),
    ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
  ];
}
