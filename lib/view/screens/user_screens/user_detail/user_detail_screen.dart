
import 'package:base_code/view/screens/Authentication_screen/signin/mobile_signin.dart';
import 'package:base_code/view/screens/Authentication_screen/signin/web_signin.dart';
import 'package:base_code/view/screens/user_screens/user_detail/user_detail_screen/mobile_user_detail.dart';
import 'package:base_code/view/screens/user_screens/user_detail/user_detail_screen/web_user_detail.dart';
import 'package:base_code/view/screens/user_screens/user_listing/user_listing_screen/web_user_listing.dart';
import 'package:flutter/material.dart';

import '../user_listing/user_listing_screen/mobile_user_listing.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebUserDetailScreen();
        } else {
          return const MobileUserDetailScreen();
        }
      },
    );
  }
}
