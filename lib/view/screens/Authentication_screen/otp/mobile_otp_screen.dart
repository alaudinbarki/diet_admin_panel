import 'dart:io';
import 'package:base_code/utils/constant.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/screens/Authentication_screen/components/header_section.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../../utils/colors.dart';
import '../../../../helper/routes_helper.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/images.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/extention/border_extension.dart';

class MobileOtpScreen extends StatefulWidget {
  const MobileOtpScreen({Key? key}) : super(key: key);

  @override
  State<MobileOtpScreen> createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
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
                      isBack: true,
                      image: Images.imgVerify,
                      title: Constant.verifyOTP,
                      description: Constant.verifyOTPDescription),
                  45.height,
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Constant.verificationCode
                              .toText(
                                  fontSize: 13,
                                  color: blackPrimary,
                                  fontFamily: poppinsRegular)
                              .paddingOnly(left: 28.w),
                          8.height,
                          Pinput(
                            defaultPinTheme: PinTheme(
                              width: 60.w,
                              height: 60.w,
                              textStyle: const TextStyle(
                                  fontSize: 28,
                                  color: blackPrimary,
                                  fontFamily: poppinsMedium,
                                  fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                color: whiteSecondary,
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
                              if (pin == '222222') return null;
                              return 'Pin is incorrect';
                            },
                          ).center,
                          20.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Images.iconChat,
                                    height: 22.h,
                                    width: 24.w,
                                  ).onPress(() {
                                    Navigator.pop(context);
                                  }),
                                  8.width,
                                  Constant.textBtnResend
                                      .toText(
                                          fontSize: 16,
                                          color: blackPrimary,
                                          fontFamily: poppinsRegular)
                                      .onPress(() {
                                    Navigator.pushNamed(
                                        context, RouterHelper.signUpScreen);
                                  })
                                ],
                              ),
                              Constant.textBtnClear
                                  .toText(
                                      fontSize: 16,
                                      color: blackPrimary,
                                      fontFamily: poppinsRegular)
                                  .onPress(() {
                                Navigator.pushNamed(
                                    context, RouterHelper.signUpScreen);
                              })
                            ],
                          ).paddingSymmetric(horizontal: 25.w),
                          45.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Constant.otpExpiresIn.toText(
                                  fontSize: 13,
                                  color: greyPrimary,
                                  fontFamily: poppinsRegular),
                              "40s "
                                  .toText(
                                      fontSize: 25,
                                      color: blackPrimary,
                                      fontFamily: poppinsMedium)
                                  .onPress(() {})
                            ],
                          ),
                          55.height,
                          CustomButton(
                            buttonName: Constant.btnVerify,
                            onPressed: () async {
                              // if (formKey.currentState!.validate()) {
                              // FocusManager.instance.primaryFocus?.unfocus();
                              // Navigator.pushNamed(
                              //     context, RouterHelper.packagesScreen);
                              // }
                            },
                          ).center,
                          15.height,
                          Constant.textChangeNumber
                              .toText(
                                  fontSize: 15,
                                  color: bluePrimary,
                                  fontFamily: poppinsRegular)
                              .onPress(() {})
                              .center
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
