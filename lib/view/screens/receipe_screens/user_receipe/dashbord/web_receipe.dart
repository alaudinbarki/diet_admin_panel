import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/constant.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../components/receipe_widet/receipe_widget.dart';

class WebUserReceipeScreen extends StatefulWidget {
  const WebUserReceipeScreen({super.key});

  @override
  State<WebUserReceipeScreen> createState() => _WebUserReceipeScreenState();
}

class _WebUserReceipeScreenState extends State<WebUserReceipeScreen> {
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
                  ReceipeWidget(
                    title: Constant.userRecepies,
                  ).expanded,
                ],
              ),
            )),
      ),
    );
  }
}
