import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_custom_button.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountSettingWidget extends StatelessWidget {
  const AccountSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1294.webH(context),
      color: backgroundColor,
      child: Consumer<AuthProvider>(
        builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Account Settings".toTextWeb(
                            context: context,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        "Edit our update your account settings".toTextWeb(
                            context: context,
                            fontSize: 16,
                            color: textGreyColor),
                      ],
                    ),
                    WebCustomButton(
                      buttonName: "Update",
                      onPressed: () {},
                      width: 206.webT(context),
                      height: 45.webT(context),
                      radius: 15.webT(context),
                    )
                  ],
                ).paddingSymmetric(vertical: 25.webT(context)),
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(30.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Profile".toTextWeb(
                          context: context,
                          fontSize: 22,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      25.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 420.webW(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Profile Photo".toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w600),
                                15.webHeight(context),
                                Container(
                                        width: 420.webW(context),
                                        height: 260.webT(context),
                                        decoration: BoxDecoration(
                                            color: imagePickerColor
                                                .withOpacity(0.2),
                                            border: Border.all(
                                                color: greySecondary
                                                    .withOpacity(0.2)),
                                            borderRadius: BorderRadius.circular(
                                                15.webT(context))),
                                        child: controller.selectedImage != null
                                            ? Image.memory(
                                                controller.selectedImage!,
                                                fit: BoxFit.cover,
                                              )
                                            : CustomImage(
                                                image: Images.iconGallery,
                                                width: 34.webT(context),
                                                height: 34.webT(context),
                                              ).center)
                                    .onPress(() {
                                  controller.pickImageFromFiles();
                                }),
                                15.webHeight(context),
                                WebCustomButton(
                                  buttonName: "Upload Photo",
                                  onPressed: () {},
                                  borderColor: greenPrimary,
                                  buttonColor: greenPrimary,
                                  // width: 200.webT(context),
                                  height: 40.webT(context),
                                  radius: 15.webT(context),
                                ).align(Alignment.centerRight)
                              ],
                            ),
                          ),
                          30.webWidth(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                isLabelBold: true,
                                label: "First Name",
                                radius: 8.webT(context),
                                controller: controller.firstNameController,
                                hintText: "Name",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                label: "Last Name",
                                isLabelBold: true,
                                radius: 8.webT(context),
                                controller: controller.lastNameController,
                                hintText: "Surname",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                            ],
                          ),
                          30.webWidth(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                label: "Email Address",
                                isLabelBold: true,
                                radius: 8.webT(context),
                                controller: controller.emailAddressController,
                                hintText: "example@email.com",
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.emailAddress,
                              ).paddingOnly(bottom: 20.webH(context)),
                              18.webScaleHeight(context),
                              15.webHeight(context),
                              WebCustomButton(
                                buttonName: "Edit / change email address",
                                onPressed: () {},
                                width: 420.webW(context),
                                height: 50.webT(context),
                                buttonColor: greyButtonColor,
                                borderColor: greyButtonColor,
                                buttonTextColor: greyPrimary,
                                radius: 15.webT(context),
                                textSize: 16,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ).paddingAll(30.webT(context)),
                ).paddingOnly(bottom: 25.webT(context)),
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(30.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Change Password".toTextWeb(
                          context: context,
                          fontSize: 22,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      25.webHeight(context),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WebTextField(
                            height: 50.webT(context),
                            width: 420.webW(context),
                            isLabelBold: true,
                            label: "Change Password",
                            radius: 8.webT(context),
                            controller: controller.changePasswordController,
                            hintText: "Password",
                            textInputAction: TextInputAction.next,
                          ).paddingOnly(bottom: 20.webH(context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                isLabelBold: true,
                                label: "Repeat Password",
                                radius: 8.webT(context),
                                controller: controller.repeatPasswordController,
                                hintText: "Password",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                              30.webWidth(context),
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                isLabelBold: true,
                                label: "Repeat New Password",
                                radius: 8.webT(context),
                                controller:
                                    controller.repeatNewPasswordController,
                                hintText: "Password",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                              30.webWidth(context),
                              WebCustomButton(
                                buttonName: "Change password",
                                onPressed: () {},
                                width: 420.webW(context),
                                height: 50.webT(context),
                                buttonColor: Colors.transparent,
                                borderColor: bluePrimary,
                                buttonTextColor: bluePrimary,
                                radius: 15.webT(context),
                                textSize: 16,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ).paddingAll(30.webT(context)),
                ).paddingOnly(bottom: 25.webT(context)),
                Row(
                  children: [
                    WebCustomButton(
                      buttonName: "Update",
                      onPressed: () {},
                      width: 200.webW(context),
                      height: 45.webT(context),
                      radius: 15.webT(context),
                    ),
                    const SizedBox()
                  ],
                ),
                25.webHeight(context)
              ],
            ).paddingSymmetric(
              horizontal: 60.webT(context),
            ),
          );
        },
      ),
    );
  }
}
