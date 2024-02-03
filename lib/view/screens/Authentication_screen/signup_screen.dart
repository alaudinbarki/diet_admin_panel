
import 'package:base_code/view/screens/Authentication_screen/signup/mobile_signup.dart';
import 'package:base_code/view/screens/Authentication_screen/signup/web_signup.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebSignUpScreen();
        } else {
          return const MobileSignUpScreen();
        }
      },
    );
  }
}
