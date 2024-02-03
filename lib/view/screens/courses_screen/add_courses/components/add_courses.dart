import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/screens/courses_screen/add_courses/components/widgets/add_modules.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_custom_button.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/recepie_provider.dart';

class AddCourseWidget extends StatelessWidget {
  const AddCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1294.webH(context),
      color: backgroundColor,
      child: Consumer2<RecepieProvider, AuthProvider>(
        builder: (context, controller, controller2, child) {
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
                        "Add New Courses".toTextWeb(
                            context: context,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        "Create or edit course".toTextWeb(
                            context: context,
                            fontSize: 16,
                            color: textGreyColor),
                      ],
                    ),
                    Row(
                      children: [
                        "Save to drafts".toTextWeb(
                            context: context,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        20.webScaleWidth(context),
                        WebCustomButton(
                          buttonName: "Update",
                          onPressed: () {},
                          width: 206.webT(context),
                          height: 45.webT(context),
                          radius: 15.webT(context),
                        ),
                      ],
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
                      "Course Details".toTextWeb(
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
                                "Cover image".toTextWeb(
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
                                        child: controller2.selectedImage != null
                                            ? Image.memory(
                                                controller2.selectedImage!,
                                                fit: BoxFit.cover,
                                              )
                                            : CustomImage(
                                                image: Images.iconGallery,
                                                width: 34.webT(context),
                                                height: 34.webT(context),
                                              ).center)
                                    .onPress(() {
                                  controller2.pickImageFromFiles();
                                }),
                                15.webHeight(context),
                                WebCustomButton(
                                  buttonName: "Upload Photo",
                                  onPressed: () {},
                                  borderColor: greenPrimary,
                                  buttonColor: greenPrimary,
                                  width: 200.webT(context),
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
                                label: "Course Title",
                                radius: 8.webT(context),
                                controller: controller2.firstNameController,
                                hintText: "Healthy Tips for Eating Well",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                              30.webWidth(context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WebTextField(
                                    height: 57.webT(context),
                                    width: 420.webW(context),
                                    label: "Upload Date",
                                    isLabelBold: true,
                                    radius: 8.webT(context),
                                    controller:
                                        controller2.emailAddressController,
                                    hintText: "Select Date",
                                    suffixIcon:
                                        const Icon(Icons.calendar_month),
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  100.webScaleWidth(context),
                                  Column(
                                    children: [
                                      "Active Enrollees".toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          color: blackPrimary,
                                          fontWeight: FontWeight.w600),
                                      16.webHeight(context),
                                      WebCustomButton(
                                        buttonName: "2 156",
                                        onPressed: () {},
                                        width: 165.webW(context),
                                        height: 57.webT(context),
                                        buttonColor: Colors.transparent,
                                        borderColor: greenPrimary,
                                        buttonTextColor: greenPrimary,
                                        radius: 15.webT(context),
                                        textSize: 16,
                                      ),
                                    ],
                                  ),
                                  40.webScaleWidth(context),
                                  Column(
                                    children: [
                                      "All-Time Enrollees".toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          color: blackPrimary,
                                          fontWeight: FontWeight.w600),
                                      16.webHeight(context),
                                      WebCustomButton(
                                        buttonName: "4 781 ",
                                        onPressed: () {},
                                        width: 165.webW(context),
                                        height: 57.webT(context),
                                        buttonColor: Colors.transparent,
                                        borderColor: pinkPrimary,
                                        buttonTextColor: womenLineColor,
                                        radius: 15.webT(context),
                                        textSize: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      16.webHeight(context),
                      Row(
                        children: [
                          WebTextField(
                            height: 57.webT(context),
                            width: 420.webW(context),
                            label: "Access Period (Days)",
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: controller2.emailAddressController,
                            hintText: "Leave empty for lifetime access",
                            suffixIcon: const Icon(Icons.calendar_month),
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ),
                          32.webScaleWidth(context),
                          WebTextField(
                            height: 57.webT(context),
                            width: 420.webW(context),
                            label: "Start Date",
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: controller2.emailAddressController,
                            hintText: "Select Date",
                            suffixIcon: const Icon(Icons.calendar_month),
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                      66.webHeight(context),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Short Description".toTextWeb(
                              context: context,
                              fontSize: 16,
                              color: blackPrimary,
                              fontWeight: FontWeight.w600),
                          16.webHeight(context),
                          Container(
                            height: 198.webT(context),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: whitePrimary,
                                border: Border.all(
                                    color: borderColor, width: 1.webT(context)),
                                borderRadius:
                                    BorderRadius.circular(16.webT(context))),
                            child:
                                "Type a short course description of maximum 2 sentences."
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        color: greyLight,
                                        fontWeight: FontWeight.w500)
                                    .paddingSymmetric(
                                        horizontal: 3.w, vertical: 10.h),
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(
                      horizontal: 52.webW(context), vertical: 30.h),
                ).paddingOnly(bottom: 25.webT(context)),
                48.webScaleHeight(context),
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(30.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Pricing".toTextWeb(
                          context: context,
                          fontSize: 22,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      25.webHeight(context),
                      WebTextField(
                        height: 57.webT(context),
                        width: 420.webW(context),
                        label: "Price in ZAR",
                        isLabelBold: true,
                        radius: 8.webT(context),
                        controller: controller2.emailAddressController,
                        hintText: "(0 for Free)",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      66.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WebTextField(
                            height: 57.webT(context),
                            width: 420.webW(context),
                            label: "Discounted Price in ZAR",
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: controller2.emailAddressController,
                            hintText: "(0 for Free)",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ),
                          WebTextField(
                            height: 57.webT(context),
                            width: 420.webW(context),
                            label: "Start Date",
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: controller2.emailAddressController,
                            hintText: "Select Date",
                            suffixIcon: const Icon(Icons.calendar_month),
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ),
                          WebTextField(
                            height: 57.webT(context),
                            width: 420.webW(context),
                            label: "End Date",
                            isLabelBold: true,
                            suffixIcon: const Icon(Icons.calendar_month),
                            radius: 8.webT(context),
                            controller: controller2.emailAddressController,
                            hintText: "Select Date",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ),
                        ],
                      )
                    ],
                  ).paddingSymmetric(
                      horizontal: 52.webW(context), vertical: 30.h),
                ).paddingOnly(bottom: 25.webT(context)),
                47.webScaleHeight(context),
                const ModuleWidget(),
                87.webScaleHeight(context),
                WebCustomButton(
                  buttonName: "Publish",
                  onPressed: () {},
                  borderColor: purplePrimary,
                  buttonColor: purplePrimary,
                  width: 206.webT(context),
                  height: 50.webT(context),
                  radius: 15.webT(context),
                ).align(Alignment.centerLeft),
                20.webScaleHeight(context),
              ],
            ).paddingSymmetric(
              horizontal: 46.webT(context),
            ),
          );
        },
      ),
    );
  }
}
