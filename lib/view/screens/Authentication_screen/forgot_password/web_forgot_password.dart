
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../helper/validation.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/dimension.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../widgets/web_widgets/web_custom_button.dart';
import '../../../widgets/web_widgets/web_text_field.dart';
import '../components/web_slider.dart';

class WebForgotPasswordScreen extends StatefulWidget {
  const WebForgotPasswordScreen({super.key});

  @override
  State<WebForgotPasswordScreen> createState() => _WebForgotPasswordScreenState();
}

class _WebForgotPasswordScreenState extends State<WebForgotPasswordScreen> {
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
          body: SingleChildScrollView(
            child: Consumer<AuthProvider>(
              builder: (context, controller, child) {
                return SizedBox(
                  width: mediaQueryWebSize(context).width,
                  child: Row(
                    children: [
                      // Forgot Password Fields
                      SizedBox(
                          height: mediaQueryWebSize(context).height,
                          width: mediaQueryWebSize(context).width / 2,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Images.imgLogo,
                                  height: 70.webH(context),
                                  width: 70.webH(context),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Constant.forgotPassword
                                    .toTextWeb(
                                      context: context,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                      fontSize: 40,
                                      fontFamily: poppinsMedium,
                                      color: blackPrimary,
                                    )
                                    .paddingOnly(bottom: 12.webH(context)),
                                Constant.forgotPasswordDescription
                                    .toTextWeb(
                                      context: context,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                      fontSize: 25,
                                      fontFamily: poppinsLight,
                                      color: greyLight,
                                    )
                                    .paddingOnly(bottom: 130.webH(context)),
                                WebTextField(
                                  controller: controller.signInEmailController,
                                  hintText: Constant.hintEmail,
                                  iconPadding: 15.webW(context),
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.webW(context),
                                        vertical: 15.webW(context)),
                                    child: SvgPicture.asset(
                                      Images.iconTick,
                                    ),
                                  ),
                                  validator: (value) {
                                    return Validation.emailValidation(value);
                                  },
                                ).paddingOnly(bottom: 50.webH(context)),
                                WebCustomButton(
                                  buttonName: Constant.btnSend,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                ).center.paddingOnly(bottom: 30.webH(context)),
                                ],
                            ).paddingSymmetric(horizontal: 180.webW(context)),
                          ]).paddingAll(30)),
                      SizedBox(
                          height: mediaQueryWebSize(context).height,
                          width: mediaQueryWebSize(context).width / 2,
                          child: Container(
                            color: bluePrimary,
                            child: const WebSlider().paddingSymmetric(
                                horizontal: 180.webW(context)),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}