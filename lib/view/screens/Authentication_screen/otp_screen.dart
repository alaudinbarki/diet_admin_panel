
import 'package:flutter/material.dart';
import 'otp/mobile_otp_screen.dart';
import 'otp/web_otp_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebOtpScreen();
        } else {
          return const MobileOtpScreen();
        }
      },
    );
  }
}
