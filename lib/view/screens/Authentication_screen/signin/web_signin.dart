import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../helper/routes_helper.dart';
// import '../../../../helper/validation.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/dimension.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../widgets/web_widgets/web_custom_button.dart';
import '../../../widgets/web_widgets/web_text_field.dart';

class WebSignInScreen extends StatefulWidget {
  const WebSignInScreen({super.key});

  @override
  State<WebSignInScreen> createState() => _WebSignInScreenState();
}

class _WebSignInScreenState extends State<WebSignInScreen> {
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
                      // SignIn Fields
                      SizedBox(
                          height: mediaQueryWebSize(context).height,
                          width: mediaQueryWebSize(context).width / 2,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Images.imgLogo,
                                  height: 160.webH(context),
                                  width: 160.webW(context),
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Constant.login
                                      .toTextWeb(
                                        context: context,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                        fontSize: 40,
                                        fontFamily: poppinsBold,
                                        color: bluePrimary,
                                      )
                                      .paddingOnly(bottom: 10.webH(context)),
                                  SizedBox(
                                    width: 380.webW(context),
                                    child: Constant.loginDetail
                                        .toTextWeb(
                                          context: context,
                                          overflow: TextOverflow.clip,
                                          fontSize: 16,
                                          fontFamily: poppinsRegular,
                                          maxLine: 2,
                                          color: greyLight,
                                        )
                                        .paddingOnly(bottom: 50.webH(context)),
                                  ),
                                  Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          WebTextField(
                                            height: 50.webT(context),
                                            label: Constant.email,
                                            radius: 8.webT(context),
                                            controller: controller
                                                .signInEmailController,
                                            hintText: Constant.hintEmail,
                                            iconPadding: 5.webT(context),
                                            textInputType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            suffixIcon: Image.asset(
                                              Images.iconEmailCross,
                                              width: 20.webT(context),
                                              height: 20.webT(context),
                                            ).paddingSymmetric(
                                                horizontal: 0.webT(context),
                                                vertical: 12.webT(context)),
                                          ).paddingOnly(
                                              bottom: 20.webH(context)),
                                          WebTextField(
                                            height: 50.webT(context),
                                            label: Constant.password,
                                            isPassword: true,
                                            radius: 8.webT(context),
                                            iconPadding: 5.webT(context),
                                            controller: controller
                                                .signInPasswordController,
                                            hintText: Constant.hintPassword,
                                            textInputType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.done,
                                            onEyeTap: () {
                                              controller.passwordVisibility();
                                            },
                                            suffixIcon: Image.asset(
                                              Images.iconPasswordHide,
                                              width: 20.webT(context),
                                              height: 20.webT(context),
                                            ).paddingSymmetric(
                                                horizontal: 0.webT(context),
                                                vertical: 12.webT(context)),
                                          ).paddingOnly(
                                              bottom: 10.webH(context)),
                                        ],
                                      )),
                                  SizedBox(
                                    width: 360.webW(context),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 16.webT(context),
                                              width: 16.webT(context),
                                              decoration: BoxDecoration(
                                                  color: controller.isRememberMe
                                                      ? bluePrimary
                                                      : whitePrimary,
                                                  border: Border.all(
                                                      color: controller
                                                              .isRememberMe
                                                          ? bluePrimary
                                                          : greyLight)),
                                              child: Icon(
                                                Icons.done,
                                                color: controller.isRememberMe
                                                    ? whitePrimary
                                                    : whitePrimary,
                                                size: 11.webH(context),
                                              ).center,
                                            ),
                                            8.webWidth(context),
                                            Constant.rememberMe.toTextWeb(
                                                context: context,
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
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 14,
                                                maxLine: 2,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                color: pinkPrimary,
                                                fontFamily: poppinsRegular)
                                            .onPress(() {}),
                                      ],
                                    ).paddingOnly(bottom: 50.webH(context)),
                                  ),
                                  SizedBox(
                                    width: 360.webW(context),
                                    child: WebCustomButton(
                                      buttonName: controller.loading
                                          ? Constant.loading
                                          : Constant.login,
                                      radius: 8.webT(context),
                                      width: 360.webW(context),
                                      height: 45.webH(context),
                                      onPressed: controller.loading
                                          ? () {}
                                          : () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                controller.signIn(
                                                    context: context);
                                              }

                                              //   FocusManager.instance.primaryFocus?.unfocus();
                                              // Navigator.pushNamed(context,
                                              //     RouterHelper.dashboardScreen);
                                              //}
                                            },
                                    )
                                        .center
                                        .paddingOnly(bottom: 30.webH(context)),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 180.webW(context)),
                            ),
                          ]).paddingAll(30)),
                      Container(
                        height: mediaQueryWebSize(context).height,
                        width: mediaQueryWebSize(context).width / 2,
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
                              40.webWidth(context),
                              renderingStoreButton(Images.iconApple,
                                  "App Store", "Download it on"),
                            ],
                          ).paddingSymmetric(
                              vertical: 32.webT(context),
                              horizontal: 40.webT(context)),
                        ),
                      ),
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

  renderingStoreButton(String image, String title, String subtitle) {
    return Container(
      width: 135.webT(context),
      height: 40.webT(context),
      decoration: BoxDecoration(
          color: blackPrimary,
          border: Border.all(color: whitePrimary),
          borderRadius: BorderRadius.circular(5.webT(context))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 24.webT(context),
            height: 24.webT(context),
            color: image.contains('apple') ? whitePrimary : null,
          ),
          5.webWidth(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subtitle.toText(color: whitePrimary, fontSize: 10.webT(context)),
              title.toText(color: whitePrimary, fontSize: 14.webT(context)),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 8.webT(context)),
    );
  }
}
