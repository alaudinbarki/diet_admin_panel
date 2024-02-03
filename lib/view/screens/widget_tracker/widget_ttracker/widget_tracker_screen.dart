
import 'package:base_code/view/screens/widget_tracker/widget_ttracker/widget_tracker_screen/mobile_widget_tracker.dart';
import 'package:base_code/view/screens/widget_tracker/widget_ttracker/widget_tracker_screen/web_widget_tracker.dart';
import 'package:flutter/material.dart';

class WidgetTrackerScreen extends StatelessWidget {
  const WidgetTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebWidgetTracker();
        } else {
          return const MobileWidgetTracker();
        }
      },
    );
  }
}
