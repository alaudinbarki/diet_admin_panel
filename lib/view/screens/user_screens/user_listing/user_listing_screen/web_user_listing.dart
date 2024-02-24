import 'package:base_code/view/screens/dashboard/components/custom_drawer.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../utils/colors.dart';
import '../components/user_listing_widget.dart';

class WebUserListingScreen extends StatefulWidget {
  const WebUserListingScreen({super.key});

  @override
  State<WebUserListingScreen> createState() => _WebUserListingScreenState();
}

class _WebUserListingScreenState extends State<WebUserListingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // List userData = [];

  // Future getUser() async {
  //   try {
  //     FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  //     QuerySnapshot<Map<String, dynamic>> data =
  //         await firebaseStore.collection('users').get();
  //     userData = data.docs.toList();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }

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
                  const UserListingWidget().expanded,
                ],
              ),
            )),
      ),
    );
  }
}
