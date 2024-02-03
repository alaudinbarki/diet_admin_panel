import 'package:flutter/material.dart';

import '../admin_receipe/dashboard/mobile_receipe.dart';
import 'dashbord/mobile_receipe.dart';
import 'dashbord/web_receipe.dart';

class DetailReceipeScreen extends StatelessWidget {
  const DetailReceipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebDetailReceipeScreen();
        } else {
          return const MobDetailReceipeScreen();
        }
      },
    );
  }
}
