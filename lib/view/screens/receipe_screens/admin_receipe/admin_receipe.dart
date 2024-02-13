import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/recepie_provider.dart';
import 'dashboard/mobile_receipe.dart';
import 'dashboard/web_receipe.dart';

class AdminReceipeScreen extends StatefulWidget {
  const AdminReceipeScreen({Key? key}) : super(key: key);

  @override
  State<AdminReceipeScreen> createState() => _AdminReceipeScreenState();
}

class _AdminReceipeScreenState extends State<AdminReceipeScreen> {
  RecepieProvider? recepieProvider;

  @override
  void initState() {
    super.initState();
    recepieProvider = Provider.of<RecepieProvider>(context, listen: false);
    recepieProvider!.getRecipes().then((value) {});
  }

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
