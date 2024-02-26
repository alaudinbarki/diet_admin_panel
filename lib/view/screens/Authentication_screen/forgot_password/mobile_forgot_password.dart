// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../utils/colors.dart';
import '../../../../helper/validation.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/images.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_button.dart';
import '../components/header_section.dart';

class MobileForgotPasswordScreen extends StatefulWidget {
  const MobileForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<MobileForgotPasswordScreen> createState() =>
      _MobileForgotPasswordScreenState();
}

class _MobileForgotPasswordScreenState
    extends State<MobileForgotPasswordScreen> {
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
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: whitePrimary,
          body: Consumer<AuthProvider>(builder: (context, controller, child) {
            return SingleChildScrollView(
              child: WillPopScope(
                onWillPop: () {
                  controller.clearTextFields();
                  controller.resetValidation();

                  return Future.value(true);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const HeaderSection(
                        isBack: true,
                        image: Images.imgForgotPassword,
                        title: Constant.forgotPassword,
                        description: Constant.forgotPasswordDescription),
                    60.height,
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              label: Constant.emailAddress,
                              controller: controller.forgotPasswordController,
                              hintText: Constant.hintEmail,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              suffixIcon: controller.isValidForgotEmail
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.h, horizontal: 20.w),
                                      child: SvgPicture.asset(
                                        Images.iconTick,
                                      ),
                                    )
                                  : const SizedBox(),
                              validator: (value) {
                                Future.delayed(Duration.zero, () {
                                  if (Validation.emailValidation(value) ==
                                      null) {
                                    controller.setValidForgotEmail(true);
                                  } else {
                                    controller.setValidForgotEmail(false);
                                  }
                                });
                                return Validation.emailValidation(value);
                              },
                            ),
                            90.height,
                            CustomButton(
                              buttonName: Constant.btnSend,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                            ).center,
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
