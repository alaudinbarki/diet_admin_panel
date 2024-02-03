
import 'package:flutter/material.dart';
import 'forgot_password/mobile_forgot_password.dart';
import 'forgot_password/web_forgot_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebForgotPasswordScreen();
        } else {
          return const MobileForgotPasswordScreen();
        }
      },
    );
  }
}
