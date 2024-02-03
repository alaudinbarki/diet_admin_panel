import 'package:flutter/material.dart';

import 'dashbord/mobile_dashbord.dart';
import 'dashbord/web_dashbord.dart';

class LessonDashbord extends StatelessWidget {
  const LessonDashbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebLessonCourseDashbordScreen();
        } else {
          return const MobileCoursesDashbord();
        }
      },
    );
  }
}
