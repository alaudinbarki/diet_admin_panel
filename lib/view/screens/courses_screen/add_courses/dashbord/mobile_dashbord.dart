// ignore_for_file: must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/custom_text_field.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/routes_helper.dart';
import '../../../../../provider/recepie_provider.dart';
import '../../../../widgets/web_widgets/web_custom_button.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../../dashboard/components/custom_popup_menu.dart';

class MobileCoursesDashbord extends StatelessWidget {
  MobileCoursesDashbord({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: whitePrimary,
      drawer: CustomDrawer(
        fromMobile: true,
      ),
      appBar: AppBar(
        // toolbarHeight: 50.h,
        backgroundColor: whitePrimary,
        leading: Icon(
          Icons.menu,
          color: bluePrimary,
          size: 20.w,
        ).onPress(() {
          scaffoldKey.currentState!.openDrawer();
        }),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                  image: Images.iconProfileImage, width: 12.w, height: 12.w),
              4.width,
              "Marci Fumons".toText(fontSize: 12, color: blackPrimary),
              CustomPopupMenuButton(
                fromMobile: true,
              )
            ],
          )
        ],
      ),
      body: Container(
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
                          "Add New Courses".toText(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: bluePrimary),
                          "Create or edit course"
                              .toText(fontSize: 10, color: textGreyColor),
                        ],
                      ),
                      Row(
                        children: [
                          "Save to drafts".toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: bluePrimary),
                          20.width,
                          CustomButton(
                            buttonName: "Update",
                            onPressed: () {},
                            width: 106.w,
                            height: 45.h,
                            radius: 15.h,
                          ),
                        ],
                      )
                    ],
                  ).paddingSymmetric(vertical: 25.h),
                  Container(
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        borderRadius: BorderRadius.circular(30.webT(context))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Course Details".toText(
                            fontSize: 22,
                            color: blackPrimary,
                            fontWeight: FontWeight.w600),
                        25.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Cover image".toText(
                                      fontSize: 13,
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w600),
                                  15.height,
                                  Container(
                                          width: 220.w,
                                          height: 260.h,
                                          decoration: BoxDecoration(
                                              color: imagePickerColor
                                                  .withOpacity(0.2),
                                              border: Border.all(
                                                  color: greySecondary
                                                      .withOpacity(0.2)),
                                              borderRadius:
                                                  BorderRadius.circular(15.h)),
                                          child: controller2.selectedImage !=
                                                  null
                                              ? Image.memory(
                                                  controller2.selectedImage!,
                                                  fit: BoxFit.cover,
                                                )
                                              : CustomImage(
                                                  image: Images.iconGallery,
                                                  width: 34.w,
                                                  height: 34.h,
                                                ).center)
                                      .onPress(() {
                                    controller2.pickImageFromFiles();
                                  }),
                                  25.height,
                                  CustomButton(
                                    buttonName: "Upload Picture",
                                    onPressed: () {},
                                    width: 106.w,
                                    height: 45.h,
                                    radius: 15.h,
                                  ),
                                ],
                              ),
                            ),
                            20.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.height,
                                CustomTextField(
                                  height: 50.h,
                                  width: 120.w,
                                  label: "Course Title",
                                  radius: 8.h,
                                  controller: controller2.firstNameController,
                                  hintText: "Healthy Tips for Eating Well",
                                  textInputAction: TextInputAction.next,
                                ).paddingOnly(bottom: 20.h),
                                CustomTextField(
                                  height: 57.h,
                                  width: 120.w,
                                  label: "Upload Date",
                                  radius: 8.h,
                                  controller:
                                      controller2.emailAddressController,
                                  hintText: "Select Date",
                                  suffixIcon: const Icon(Icons.calendar_month),
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                ),
                                30.height,
                                CustomTextField(
                                  height: 57.h,
                                  width: 120.w,
                                  label: "Start  Date",
                                  radius: 8.h,
                                  controller:
                                      controller2.emailAddressController,
                                  hintText: "Select Date",
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                ),
                                CustomTextField(
                                  height: 57.h,
                                  width: 120.w,
                                  label: "Access Period (Days)",
                                  radius: 8.h,
                                  controller:
                                      controller2.emailAddressController,
                                  hintText: "Leave empty for lifetime access",
                                  suffixIcon: const Icon(Icons.calendar_month),
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                ),
                              ],
                            ),
                          ],
                        ),
                        50.height,
                        Row(
                          children: [
                            Column(
                              children: [
                                "Active Enrollees".toText(
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w600),
                                16.height,
                                CustomButton(
                                  buttonName: "2 156",
                                  onPressed: () {},
                                  width: 150.w,
                                  height: 57.h,
                                  buttonColor: Colors.transparent,
                                  borderColor: greenPrimary,
                                  buttonTextColor: greenPrimary,
                                  radius: 15.webT(context),
                                  textSize: 16,
                                ),
                              ],
                            ),
                            40.width,
                            Column(
                              children: [
                                "All-Time Enrollees".toText(
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w600),
                                16.height,
                                CustomButton(
                                  buttonName: "4 781 ",
                                  onPressed: () {},
                                  width: 150.w,
                                  height: 57.h,
                                  buttonColor: Colors.transparent,
                                  borderColor: pinkPrimary,
                                  buttonTextColor: womenLineColor,
                                  radius: 15.h,
                                  textSize: 16,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ).paddingSymmetric(
                        horizontal: 52.webW(context), vertical: 30.h),
                  ).paddingOnly(bottom: 25.webT(context)),
                  48.height,
                  Container(
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        borderRadius: BorderRadius.circular(30.webT(context))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Pricing".toText(
                            fontSize: 20,
                            color: blackPrimary,
                            fontWeight: FontWeight.w600),
                        25.height,
                        Row(
                          children: [
                            CustomTextField(
                              height: 57.h,
                              width: 120.w,
                              label: "Price in ZAR",
                              radius: 8.webT(context),
                              controller: controller2.emailAddressController,
                              hintText: "(0 for Free)",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                            ),
                            20.width,
                            CustomTextField(
                              height: 57.h,
                              width: 120.w,
                              label: "Discounted Price in ZAR",
                              radius: 8.h,
                              controller: controller2.emailAddressController,
                              hintText: "(0 for Free)",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                        50.height,
                        Row(
                          children: [
                            CustomTextField(
                              height: 57.h,
                              width: 120.w,
                              label: "Start Date",
                              radius: 8.h,
                              controller: controller2.emailAddressController,
                              hintText: "Select Date",
                              suffixIcon: const Icon(Icons.calendar_month),
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                            ),
                            20.width,
                            CustomTextField(
                              height: 57.h,
                              width: 120.w,
                              label: "End Date",
                              suffixIcon: const Icon(Icons.calendar_month),
                              radius: 8.h,
                              controller: controller2.emailAddressController,
                              hintText: "Select Date",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                            ),
                          ],
                        )
                      ],
                    ).paddingSymmetric(horizontal: 25.w, vertical: 30.h),
                  ).paddingOnly(bottom: 25.h),
                  47.webScaleHeight(context),
                  Container(
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(color: borderColor, width: 1.h),
                        borderRadius: BorderRadius.circular(16.h)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.height,
                        'Modules'.toText(
                            fontSize: 20,
                            color: blackPrimary,
                            fontWeight: FontWeight.w600),
                        30.height,
                        CustomButton(
                          buttonName: "New Lesson",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouterHelper.lessonDashbord);
                          },
                          borderColor: purplePrimary,
                          buttonColor: purplePrimary,
                          width: 70.w,
                          height: 40.h,
                          radius: 15.h,
                        ).align(Alignment.centerRight),
                        30.height,
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 58.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(13.h),
                                        color: whitePrimary,
                                        border: Border.all(color: greyLight)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        "Module Name to Appear Here".toText(
                                            fontSize: 11,
                                            maxLine: 2,
                                            fontWeight: FontWeight.w500,
                                            color: blackPrimary),
                                        Row(
                                          children: [
                                            Container(
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.w),
                                                color: whitePrimary,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade100,
                                                    offset: const Offset(0, 3),
                                                    blurRadius: 1,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          greenPrimary,
                                                      radius: 5.h),
                                                  10.webWidth(context),
                                                  "Published".toText(
                                                    fontSize: 12,
                                                    color: blackPrimary,
                                                  ),
                                                  10.webWidth(context),
                                                  const Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    size: 14,
                                                  )
                                                ],
                                              )
                                                  .paddingSymmetric(
                                                      horizontal: 10.w,
                                                      vertical: 5.h)
                                                  .center,
                                            )
                                                .align(Alignment.centerLeft)
                                                .paddingOnly(right: 10.w),
                                            const Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color: blackPrimary,
                                            ),
                                          ],
                                        )
                                      ],
                                    ).paddingAll(14.webT(context)),
                                  ).onPress(() {
                                    if (selectedIndex == index) {
                                      selectedIndex = -1;
                                    } else {
                                      selectedIndex = index;
                                    }
                                    controller.notifyListeners();
                                  }),
                                  if (selectedIndex == index)
                                    ListView.builder(
                                      itemCount: 3,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(Images.moveAlt),
                                                15.width,
                                                "Lesson name here".toText(
                                                    fontSize: 12,
                                                    maxLine: 2,
                                                    fontWeight: FontWeight.w400,
                                                    color: blackPrimary),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 70.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.w),
                                                    color: whitePrimary,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade100,
                                                        offset:
                                                            const Offset(0, 3),
                                                        blurRadius: 1,
                                                        spreadRadius: 1,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircleAvatar(
                                                          backgroundColor:
                                                              greenPrimary,
                                                          radius: 5.h),
                                                      10.webWidth(context),
                                                      "Published".toText(
                                                        fontSize: 12,
                                                        color: blackPrimary,
                                                      ),
                                                      10.webWidth(context),
                                                      const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        size: 14,
                                                      )
                                                    ],
                                                  )
                                                      .paddingSymmetric(
                                                          horizontal: 10.w,
                                                          vertical: 5.h)
                                                      .center,
                                                )
                                                    .align(Alignment.centerLeft)
                                                    .paddingOnly(right: 10.w),
                                                const Icon(
                                                  Icons
                                                      .keyboard_arrow_up_rounded,
                                                  color: blackPrimary,
                                                ),
                                              ],
                                            )
                                          ],
                                        ).paddingOnly(
                                            left: 20.webT(context),
                                            right: 20.webT(context),
                                            top: 25.webH(context));
                                      },
                                    )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                height: 1.webH(context),
                                color: dividerColor,
                              ).paddingSymmetric(vertical: 20.webT(context));
                            },
                            itemCount: 3),
                        75.height,
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              25.height,
                              "Add New Module".toText(
                                  fontSize: 18,
                                  color: blackPrimary,
                                  fontWeight: FontWeight.w600),
                              30.webHeight(context),
                              Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.h),
                                  color: greyButtonColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextField(
                                      controller: TextEditingController(),
                                      width: 180.w,
                                      height: 58.h,
                                      hintText: "New Module Name Here",
                                    ),
                                    WebCustomButton(
                                        width: 69.w,
                                        height: 53.h,
                                        radius: 12.h,
                                        buttonTextColor: whitePrimary,
                                        borderColor: greenPrimary,
                                        buttonColor: greenPrimary,
                                        buttonName: "Add",
                                        onPressed: () {}),
                                  ],
                                ).paddingSymmetric(horizontal: 10.w),
                              ),
                              30.webHeight(context),
                            ],
                          ).paddingAll(18.h),
                        ),
                        30.webScaleHeight(context),
                      ],
                    ).paddingAll(18.w).paddingSymmetric(horizontal: 10.h),
                  ).paddingSymmetric(horizontal: 8.h),
                  87.height,
                  WebCustomButton(
                    buttonName: "Publish",
                    onPressed: () {},
                    borderColor: purplePrimary,
                    buttonColor: purplePrimary,
                    width: 206.w,
                    height: 50.h,
                    radius: 15.h,
                  ).align(Alignment.centerLeft),
                  20.height,
                ],
              ).paddingSymmetric(
                horizontal: 46.webT(context),
              ),
            );
          },
        ),
      ),
    );
  }
}
