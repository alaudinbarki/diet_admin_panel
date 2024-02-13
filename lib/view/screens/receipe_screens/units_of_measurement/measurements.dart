import 'package:flutter/material.dart';

// import '../Ingredients/dashbord/mobile_receipe.dart';
import 'dashbord/mobile_meausrement.dart';
import 'dashbord/web_measurement.dart';

class MeasurementsScreen extends StatelessWidget {
  const MeasurementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebMeasurementScreen();
        } else {
          return const MobMeasurementScreen();
        }
      },
    );
  }
}
