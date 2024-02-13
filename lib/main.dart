import 'package:base_code/firebase_options.dart';
import 'package:base_code/utils/colors.dart';
// import 'package:base_code/view/widgets/extention/object_extension.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

import 'helper/provider_helper.dart';
import 'helper/routes_helper.dart';
import 'helper/scroll_behaviour.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//   @override
//   void initState() {
//     print(analytics.appInstanceId);
//     super.initState();
//   }

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
          initialRoute: RouterHelper.initial,
          routes: RouterHelper.routes),
    );
  }
}
