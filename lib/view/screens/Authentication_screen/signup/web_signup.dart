
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../helper/routes_helper.dart';
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
import '../components/web_social_buttons.dart';

class WebSignUpScreen extends StatefulWidget {
  const WebSignUpScreen({super.key});

  @override
  State<WebSignUpScreen> createState() => _WebSignInScreenState();
}

class _WebSignInScreenState extends State<WebSignUpScreen> {
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
                      // SignUp Fields
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
                                Constant.signUptoDealTracker
                                    .toTextWeb(
                                      context: context,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                      fontSize: 40,
                                      fontFamily: poppinsMedium,
                                      color: blackPrimary,
                                    )
                                    .paddingOnly(bottom: 40.webH(context)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WebSocialButton(
                                        image: Images.iconGoogle,
                                        onPressed: () {}),
                                    SizedBox(width: 40.webH(context)),
                                    WebSocialButton(
                                        image: Images.iconApple,
                                        onPressed: () {}),
                                  ],
                                ).paddingOnly(bottom: 30.webH(context)),
                                Constant.orText
                                    .toTextWeb(
                                      context: context,
                                      overflow: TextOverflow.clip,
                                      fontSize: 30,
                                      fontFamily: poppinsMedium,
                                      color: greyLight,
                                    )
                                    .paddingOnly(bottom: 30.webH(context)),
                                WebTextField(
                                  iconPadding: 15.webW(context),
                                  controller:
                                      controller.signUpUserNameController,
                                  hintText: Constant.hintUserName,
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    return Validation.nameValidation(value);
                                  },
                                ).paddingOnly(bottom: 20.webH(context)),
                                WebTextField(
                                  controller: controller.signInEmailController,
                                  hintText: Constant.hintEmail,
                                  iconPadding: 15.webW(context),
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    return Validation.emailValidation(value);
                                  },
                                ).paddingOnly(bottom: 20.webH(context)),
                                WebTextField(
                                  iconPadding: 15.webW(context),
                                  controller:
                                      controller.signInPasswordController,
                                  hintText: Constant.hintPassword,
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  onEyeTap: () {
                                    controller.passwordVisibility();
                                  },
                                  validator: (value) {
                                    return Validation.passwordValidation(value);
                                  },
                                ).paddingOnly(bottom: 50.webH(context)),
                                WebCustomButton(
                                  buttonName: Constant.signUp,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                ).center.paddingOnly(bottom: 30.webH(context)),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Constant.alreadySignedUp.toText(
                                          fontSize: 14,
                                          color: blackPrimary,
                                          fontFamily: poppinsMedium),
                                      Constant.textBtnSignIn
                                          .toText(
                                              fontSize: 14,
                                              color: bluePrimary,
                                              fontFamily: poppinsMedium)
                                          .onPress(() {
                                        Navigator.pushNamed(
                                            context, RouterHelper.signInScreen);
                                      })
                                    ],
                                  ),
                                ),
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
