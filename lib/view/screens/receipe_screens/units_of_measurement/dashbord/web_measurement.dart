import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../utils/colors.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../components/unit_measurement/unit_of_measurement.dart';

class WebMeasurementScreen extends StatefulWidget {
  const WebMeasurementScreen({super.key});

  @override
  State<WebMeasurementScreen> createState() => _WebMeasurementScreenState();
}

class _WebMeasurementScreenState extends State<WebMeasurementScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
        key: scaffoldKey,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: whitePrimary,
            body: SizedBox(
              width: 1920.webW(context),
              height: 1294.webH(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomDrawer(),
                  const UnitOfMeasurementScreen().expanded
                ],
              ),
            )),
      ),
    );
  }
}
