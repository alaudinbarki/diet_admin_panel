
import 'package:base_code/view/screens/Authentication_screen/signin/mobile_signin.dart';
import 'package:base_code/view/screens/Authentication_screen/signin/web_signin.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebSignInScreen();
        } else {
          return const MobileSignInScreen();
        }
      },
    );
  }
}
