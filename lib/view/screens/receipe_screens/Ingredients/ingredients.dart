import 'package:flutter/material.dart';

import '../Ingredients/dashbord/mobile_receipe.dart';
import 'dashbord/web_receipe.dart';

class IngrediantsScreen extends StatelessWidget {
  const IngrediantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebIngredientsScreen();
        } else {
          return MobileIngrediantsScreen();
        }
      },
    );
  }
}
