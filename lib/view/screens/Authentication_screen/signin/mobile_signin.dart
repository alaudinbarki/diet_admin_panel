import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../helper/routes_helper.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/dimension.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/web_widgets/web_custom_button.dart';

class MobileSignInScreen extends StatefulWidget {
  const MobileSignInScreen({Key? key}) : super(key: key);

  @override
  State<MobileSignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<MobileSignInScreen> {
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
        // bottom: Platform.isAndroid ? true : false,
        // top: Platform.isAndroid ? true : false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: whitePrimary,
          body: Consumer<AuthProvider>(builder: (context, controller, child) {
            return SizedBox(
                height: mediaQueryWebSize(context).height,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.imgLogo,
                              height: 80.w,
                              width: 80.w,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Constant.login
                                .toText(
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                  fontSize: 32,
                                  fontFamily: poppinsBold,
                                  color: bluePrimary,
                                )
                                .paddingOnly(bottom: 10.h),
                            Constant.loginDetail
                                .toText(
                                  overflow: TextOverflow.clip,
                                  fontSize: 14,
                                  fontFamily: poppinsRegular,
                                  maxLine: 2,
                                  color: greyLight,
                                )
                                .paddingOnly(bottom: 10.h),
                            CustomTextField(
                              height: 50.h,
                              label: Constant.email,
                              width: double.infinity,
                              radius: 5.w,
                              controller: controller.signInEmailController,
                              hintText: Constant.hintEmail,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              suffixIcon: Image.asset(
                                Images.iconEmailCross,
                                width: 20.h,
                                height: 20.h,
                              ).paddingSymmetric(
                                  horizontal: 0.webT(context), vertical: 12.h),
                            ).paddingOnly(bottom: 20.h),
                            CustomTextField(
                              height: 50.h,
                              width: double.infinity,
                              label: Constant.password,
                              isPassword: true,
                              radius: 5.w,
                              controller: controller.signInPasswordController,
                              hintText: Constant.hintPassword,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              onEyeTap: () {
                                controller.passwordVisibility();
                              },
                              suffixIcon: Image.asset(
                                Images.iconPasswordHide,
                                width: 20.w,
                                height: 20.w,
                              ).paddingSymmetric(
                                  horizontal: 0.webT(context), vertical: 12.h),
                            ).paddingOnly(bottom: 10.h),
                            SizedBox(
                              width: 360.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 16.w,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            color: controller.isRememberMe
                                                ? bluePrimary
                                                : whitePrimary,
                                            border: Border.all(
                                                color: controller.isRememberMe
                                                    ? bluePrimary
                                                    : greyLight)),
                                        child: Icon(
                                          Icons.done,
                                          color: controller.isRememberMe
                                              ? whitePrimary
                                              : whitePrimary,
                                          size: 12.w,
                                        ).center,
                                      ),
                                      8.width,
                                      Constant.rememberMe.toText(
                                          textAlign: TextAlign.center,
                                          fontSize: 14,
                                          maxLine: 2,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: poppinsRegular)
                                    ],
                                  ).onPress(() {
                                    controller.setRememberMe();
                                  }),
                                  Constant.textBtnForgotPassword
                                      .toText(
                                          fontSize: 14,
                                          maxLine: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          color: pinkPrimary,
                                          fontFamily: poppinsRegular)
                                      .onPress(() {}),
                                ],
                              ).paddingOnly(bottom: 50.h),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: WebCustomButton(
                                buttonName: Constant.login,
                                radius: 5.w,
                                width: 360.w,
                                height: 45.h,
                                onPressed: () async {
                                  // if (formKey.currentState!.validate()) {
                                  //   FocusManager.instance.primaryFocus?.unfocus();
                                  Navigator.pushNamed(
                                      context, RouterHelper.dashboardScreen);
                                  //}
                                },
                              ).center.paddingOnly(bottom: 30.webH(context)),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 30),
                        Container(
                          height: mediaQueryWebSize(context).height / 2,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Images.loginImage),
                                fit: BoxFit.cover),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                renderingStoreButton(Images.iconGooglePlay,
                                    "Google Play", "Get it on"),
                                10.width,
                                renderingStoreButton(Images.iconApple,
                                    "App Store", "Download it on"),
                              ],
                            ).paddingSymmetric(
                                vertical: 32.webT(context),
                                horizontal: 40.webT(context)),
                          ),
                        ),
                      ]),
                ));
          }),
        ),
      ),
    );
  }

  renderingStoreButton(String image, String title, String subtitle) {
    return Container(
      width: 80.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: blackPrimary,
          border: Border.all(color: whitePrimary),
          borderRadius: BorderRadius.circular(5.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 12.w,
            height: 12.w,
            color: image.contains('apple') ? whitePrimary : null,
          ),
          5.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subtitle.toText(color: whitePrimary, fontSize: 10.h),
              title.toText(color: whitePrimary, fontSize: 14.h),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 5.w),
    );
  }
}
