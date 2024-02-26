// import 'package:base_code/data/model/custom_model/recipe_model.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../utils/colors.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../components/detail_receipe_widget/detail_receipe_widget.dart';

class WebDetailReceipeScreen extends StatefulWidget {
  // final RecipeModel recipe;

  const WebDetailReceipeScreen({
    super.key,

    //  required this.recipe
  });

  @override
  State<WebDetailReceipeScreen> createState() => _WebDetailReceipeScreenState();
}

class _WebDetailReceipeScreenState extends State<WebDetailReceipeScreen> {
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
                  const DetailReceipeWidget(
                          // recipe: widget.recipe,
                          )
                      .expanded
                ],
              ),
            )),
      ),
    );
  }
}
