import 'package:flutter/material.dart';

import 'dashbord/mobile_receipe.dart';
import 'dashbord/web_receipe.dart';

class NewReceipeScreen extends StatelessWidget {
  const NewReceipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebNewReceipeScreen();
        } else {
          return  MobNewReceipeWidget();
        }
      },
    );
  }
}
