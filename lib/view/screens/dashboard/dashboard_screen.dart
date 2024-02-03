import 'package:base_code/view/screens/dashboard/dashboard/mobile_dashboard.dart';
import 'package:base_code/view/screens/dashboard/dashboard/web_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebDashboardScreen();
        } else {
          return const MobileDashboardScreen();
        }
      },
    );
  }
}
