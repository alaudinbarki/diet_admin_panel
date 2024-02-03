import 'package:flutter/material.dart';

import '../../categories/dashbord/mobile_category.dart';
import 'dashbord/web_detail_ingredients.dart';

class IngrediantsDetailScreen extends StatelessWidget {
  const IngrediantsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebDetailIngredientsScreen();
        } else {
          return const MobileCategoryScreen();
        }
      },
    );
  }
}
