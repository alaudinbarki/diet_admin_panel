import 'package:base_code/view/screens/account_setting_screen/account_setting/web_account_setting.dart';
import 'package:flutter/material.dart';
import 'account_setting/mobile_account_setting.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebAccountSettingScreen();
        } else {
          return const MobileAccountSettingScreen();
        }
      },
    );
  }
}
