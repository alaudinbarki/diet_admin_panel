import 'package:flutter/material.dart';

import '../units_of_measurement/dashbord/mobile_meausrement.dart';
import 'dashbord/mobile_category.dart';
import 'dashbord/web_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebCategoryScreen();
        } else {
          return const MobileCategoryScreen();
        }
      },
    );
  }
}
