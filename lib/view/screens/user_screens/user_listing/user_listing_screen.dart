// import 'package:base_code/view/screens/Authentication_screen/signin/mobile_signin.dart';
// import 'package:base_code/view/screens/Authentication_screen/signin/web_signin.dart';
import 'package:base_code/view/screens/user_screens/user_listing/user_listing_screen/web_user_listing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/user_provider.dart';
import '../user_listing/user_listing_screen/mobile_user_listing.dart';

class UserListingScreen extends StatefulWidget {
  const UserListingScreen({Key? key}) : super(key: key);

  @override
  State<UserListingScreen> createState() => _UserListingScreenState();
}

class _UserListingScreenState extends State<UserListingScreen> {
  UserProvider? userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider?.getUsers().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return const WebUserListingScreen();
        } else {
          return const MobileUserListingScreen();
        }
      },
    );
  }
}
