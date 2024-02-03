import 'package:flutter/material.dart';

import '../dashbord/mobile_category.dart';
import 'dashbord/web_detail_category.dart';

class DetailCategoryScreen extends StatelessWidget {
  const DetailCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebDetailCategoryScreen();
        } else {
          return const MobileCategoryScreen();
        }
      },
    );
  }
}
