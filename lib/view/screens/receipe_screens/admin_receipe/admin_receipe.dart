import 'package:flutter/material.dart';

import 'dashboard/mobile_receipe.dart';
import 'dashboard/web_receipe.dart';

class AdminReceipeScreen extends StatelessWidget {
  const AdminReceipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebAdminReceipeScreen();
        } else {
          return const MobAdminReceipeScreen();
        }
      },
    );
  }
}
