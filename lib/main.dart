import 'package:base_code/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/provider_helper.dart';
import 'helper/routes_helper.dart';
import 'helper/scroll_behaviour.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderHelper.providers,
      child: MaterialApp(
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(),
                child: child!,
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Dear Tracker',
          theme: ThemeData(
            primarySwatch: const MaterialColor(0xFF427069, primaryColor),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
          ),
          //   home: const LessonDashbord(),
          initialRoute: RouterHelper.dashboardScreen,
          routes: RouterHelper.routes
          ),
    );
  }
}
