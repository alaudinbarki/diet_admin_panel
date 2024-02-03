

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../../helper/routes_helper.dart';
import '../../../../utils/colors.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/dimension.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../widgets/extention/border_extension.dart';
import '../../../widgets/web_widgets/web_custom_button.dart';
import '../components/web_slider.dart';

class WebOtpScreen extends StatefulWidget {
  const WebOtpScreen({Key? key}) : super(key: key);

  @override
  State<WebOtpScreen> createState() => _WebOtpScreenState();
}

class _WebOtpScreenState extends State<WebOtpScreen> {
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
                        child: Column(
                          children: [
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
                                Constant.verifyOTP
                                    .toTextWeb(
                                      context: context,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                      fontSize: 40,
                                      fontFamily: poppinsMedium,
                                      color: blackPrimary,
                                    )
                                    .paddingOnly(bottom: 12.webH(context)),
                                Constant.verifyOTPDescription
                                    .toTextWeb(
                                      context: context,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                      fontSize: 25,
                                      fontFamily: poppinsLight,
                                      color: greyLight,
                                    )
                                    .paddingOnly(bottom: 130.webH(context)),
                                Row(
                                  children: [
                                    Constant.verificationCode.toTextWeb(
                                        context: context,
                                        fontSize: 30,
                                        color: bluePrimary,
                                        fontFamily: poppinsRegular)
                                  ],
                                ).paddingOnly(
                                    bottom: 20.webH(context),
                                    left: 50.webW(context)),
                                Pinput(
                                  keyboardType: TextInputType.number,
                                  defaultPinTheme: PinTheme(
                                    width: 100.webH(context),
                                    height: 100.webH(context),
                                    textStyle: TextStyle(
                                        fontSize: webDesignHeight <
                                                mediaQueryWebSize(context)
                                                    .height
                                            ? 40.webW(context)
                                            : 40.webH(context),
                                        color: blackPrimary,
                                        fontFamily: poppinsMedium,
                                        fontWeight: FontWeight.w600),
                                    decoration: BoxDecoration(
                                      color: greySecondary,
                                      border: Border.all(color: greySecondary),
                                      borderRadius: borderRadiusCircular(10),
                                    ),
                                  ),
                                  length: 4,
                                  forceErrorState: true,
                                  //errorText: 'Error',
                                  pinputAutovalidateMode:
                                      PinputAutovalidateMode.onSubmit,
                                  validator: (pin) {
                                    if (RegExp(r'^\d+$').hasMatch(pin!)) {
                                      return null;
                                    } else {
                                      return 'Pin is incorrect';
                                    }
                                  },
                                ).paddingOnly(bottom: 40.webH(context)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.iconChat,
                                          height: 40.webH(context),
                                          width: 36.webW(context),
                                        ).onPress(() {
                                          Navigator.pop(context);
                                        }).paddingOnly(right: 10.webW(context)),
                                        Constant.textBtnResend
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 20,
                                                color: blackPrimary,
                                                fontFamily: poppinsRegular)
                                            .onPress(() {
                                          Navigator.pushNamed(context,
                                              RouterHelper.signUpScreen);
                                        })
                                      ],
                                    ),
                                    Constant.textBtnClear
                                        .toTextWeb(
                                            context: context,
                                            fontSize: 20,
                                            color: blackPrimary,
                                            fontFamily: poppinsRegular)
                                        .onPress(() {
                                      Navigator.pushNamed(
                                          context, RouterHelper.signUpScreen);
                                    }),
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 50.webW(context)),
                                40.webHeight(context),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Constant.otpExpiresIn.toTextWeb(
                                        context: context,
                                        fontSize: 20,
                                        color: greyPrimary,
                                        fontFamily: poppinsRegular),
                                    "40s "
                                        .toTextWeb(
                                            context: context,
                                            fontSize: 35,
                                            color: blackPrimary,
                                            fontFamily: poppinsMedium)
                                        .onPress(() {}),
                                  ],
                                ).paddingOnly(bottom: 40.webH(context)),
                                WebCustomButton(
                                  buttonName: Constant.btnVerify,
                                  onPressed: () async {
                                    // if (formKey.currentState!.validate()) {
                                    // FocusManager.instance.primaryFocus?.unfocus();
                                    // Navigator.pushNamed(
                                    //     context, RouterHelper.packagesScreen);
                                    // }
                                  },
                                ).paddingOnly(bottom: 20.webH(context)),
                                Constant.textChangeNumber
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 25,
                                        color: bluePrimary,
                                        fontFamily: poppinsRegular)
                                    .onPress(() {})
                              ],
                            ).paddingSymmetric(horizontal: 180.webW(context)),
                          ],
                        ).paddingAll(30),
                      ),
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
