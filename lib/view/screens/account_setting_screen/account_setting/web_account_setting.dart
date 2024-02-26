import 'package:base_code/view/screens/account_setting_screen/components/account_setting_widgets.dart';
import 'package:base_code/view/screens/dashboard/components/custom_drawer.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../utils/colors.dart';

class WebAccountSettingScreen extends StatefulWidget {
  const WebAccountSettingScreen({super.key});

  @override
  State<WebAccountSettingScreen> createState() =>
      _WebAccountSettingScreenState();
}

class _WebAccountSettingScreenState extends State<WebAccountSettingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
        key: scaffoldKey,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: backgroundColor,
            body: SizedBox(
              width: 1920.webW(context),
              height: 1294.webH(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomDrawer(),
                  const AccountSettingWidget().expanded
                ],
              ),
            )),
      ),
    );
  }
}
