
import 'dart:io';

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/colors.dart';
import '../../../../helper/routes_helper.dart';
import '../../../../helper/validation.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_button.dart';
import '../components/header_section.dart';

class MobileSignUpScreen extends StatefulWidget {
  const MobileSignUpScreen({Key? key}) : super(key: key);

  @override
  State<MobileSignUpScreen> createState() => _MobileSignUpScreenState();
}

class _MobileSignUpScreenState extends State<MobileSignUpScreen> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderSection(
                      image: Images.imgLogin,
                      title: Constant.signUp,
                      description: Constant.signUpDescription),
                  30.height,
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            label: Constant.userName,
                            controller: controller.signUpUserNameController,
                            hintText: Constant.hintUserName,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              return Validation.nameValidation(value);
                            },
                          ),
                          20.height,
                          CustomTextField(
                            label: Constant.email,
                            controller: controller.signUpEmailController,
                            hintText: Constant.hintEnterEmail,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            suffixIcon: controller.isValidSignUpEmail
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 20.w),
                                    child: SvgPicture.asset(
                                      Images.iconTick,
                                    ),
                                  )
                                : const SizedBox(),
                            validator: (value) {
                              if (controller
                                  .signUpEmailController.text.isNotEmpty) {
                                Future.delayed(Duration.zero, () {
                                  if (Validation.emailValidation(value) ==
                                      null) {
                                    controller.setValidSignUpEmail(true);
                                  } else {
                                    controller.setValidSignUpEmail(false);
                                  }
                                });
                                return Validation.emailValidation(value);
                              } else {
                                return null;
                              }
                            },
                          ),
                          20.height,
                          CustomTextField(
                            label: Constant.password,
                            obscureText: true,
                            controller: controller.signUpPasswordController,
                            hintText: Constant.hintPassword,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              return Validation.passwordValidation(value);
                            },
                          ),
                          45.height,
                          CustomButton(
                            buttonName: Constant.signUp,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            },
                          ).center,
                          25.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Constant.alreadySignedUp.toText(
                                  fontSize: 14,
                                  color: blackPrimary,
                                  fontFamily: poppinsLight),
                              Constant.textBtnSignIn
                                  .toText(
                                      fontSize: 14,
                                      color: bluePrimary,
                                      fontFamily: poppinsMedium)
                                  .onPress(() {
                                Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        RouterHelper.signInScreen,
                                        (route) => false)
                                    .then((value) =>
                                        formKey.currentState!.reset());
                                controller.clearTextFields();
                                controller.resetValidation();
                                // Navigator.pushNamed(
                                //     context, RouterHelper.signInScreen);
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
