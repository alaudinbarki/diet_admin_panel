// import 'dart:io';

// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

// import 'package:base_code/helper/validation.dart';
import 'package:base_code/provider/authentication_provider.dart';
// import 'package:base_code/utils/constant.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/screens/dashboard/components/custom_drawer.dart';
import 'package:base_code/view/screens/dashboard/components/custom_popup_menu.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// import '../../../../../helper/routes_helper.dart';
import '../../../../../utils/colors.dart';
// import '../../../../../utils/style.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text_field.dart';
// import '../../../../widgets/web_widgets/web_custom_button.dart';
// import '../../../../widgets/web_widgets/web_text_field.dart';

class MobileUserDetailScreen extends StatefulWidget {
  const MobileUserDetailScreen({Key? key}) : super(key: key);

  @override
  State<MobileUserDetailScreen> createState() => _MobileUserDetailState();
}

class _MobileUserDetailState extends State<MobileUserDetailScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
        // bottom: Platform.isAndroid ? true : false,
        // top: Platform.isAndroid ? true : false,
        child: Scaffold(
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
                      image: Images.iconProfileImage,
                      width: 12.w,
                      height: 12.w),
                  4.width,
                  "Marci Fumons".toText(fontSize: 12, color: blackPrimary),
                  CustomPopupMenuButton(
                    fromMobile: true,
                  )
                ],
              )
            ],
          ),
          body: Consumer<AuthProvider>(builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 73.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "View User Profile".toText(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: bluePrimary),
                            "Summary of single user profile"
                                .toText(fontSize: 12, color: textColor),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 10.w),
                  ),
                  10.height,
                  Container(
                    decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Profile Details".toText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 300.h,
                                  width: 175.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      border: Border.all(
                                          color: containerBorderColor)),
                                ),
                                5.height,
                                CustomButton(
                                    width: 175.w,
                                    height: 40.h,
                                    radius: 5.w,
                                    buttonTextColor: whitePrimary,
                                    borderColor: blueSecondary,
                                    buttonColor: blueSecondary,
                                    buttonName: "Full View",
                                    onPressed: () {}),
                              ],
                            ),
                            5.width,
                            Container(
                              height: 345.h,
                              width: 175.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  border:
                                      Border.all(color: containerBorderColor)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 175.w,
                                    decoration: BoxDecoration(
                                        color: containerShadowColor,
                                        borderRadius:
                                            BorderRadius.circular(5.w),
                                        border: const Border(
                                            bottom: BorderSide(
                                                color: containerBorderColor))),
                                    child: "Biographical Information"
                                        .toText(
                                          color: blackPrimary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        )
                                        .align(Alignment.centerLeft)
                                        .paddingSymmetric(horizontal: 5.w),
                                  ),
                                  10.height,
                                  renderingRow(context, "Email Address:",
                                      "francisp@omail.com"),
                                  renderingRow(context, "Gender:", "Female"),
                                  renderingRow(context, "Date of birth:",
                                      "15 June 1991"),
                                  renderingRow(context, "Age:", "33"),
                                  renderingRow(
                                      context, "Location:", "Cape Town"),
                                  renderingRow(
                                      context, "Country:", "South Africa"),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ).paddingAll(5.w),
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  SizedBox(
                    width: 340.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller:
                                  TextEditingController(text: "Francis Pugh"),
                              width: 180.w,
                              height: 45.h,
                              borderColor: containerBorderColor,
                            ),
                            10.height,
                            Container(
                              height: 150.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  border:
                                      Border.all(color: containerBorderColor)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 75.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            "Status".toText(
                                                fontSize: 12,
                                                color: greenPrimary,
                                                fontWeight: FontWeight.w500),
                                            "Basic".toText(
                                                fontSize: 12,
                                                color: blackPrimary,
                                                fontWeight: FontWeight.w500)
                                          ],
                                        ).align(Alignment.center),
                                      ),
                                      10.height,
                                      SizedBox(
                                        width: 75.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            "Platform".toText(
                                                fontSize: 12,
                                                color: purplePrimary,
                                                fontWeight: FontWeight.w500),
                                            "Android".toText(
                                                fontSize: 12,
                                                color: blackPrimary,
                                                fontWeight: FontWeight.w500)
                                          ],
                                        ).align(Alignment.center),
                                      ),
                                    ],
                                  ),
                                  10.width,
                                  SizedBox(
                                    width: 75.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        "Join Date".toText(
                                            fontSize: 12,
                                            color: yellowPrimary,
                                            fontWeight: FontWeight.w500),
                                        "25 May 2023".toText(
                                            fontSize: 12,
                                            color: blackPrimary,
                                            fontWeight: FontWeight.w500)
                                      ],
                                    ).align(Alignment.centerRight),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 7.w).center,
                            ),
                          ],
                        ),
                        10.width,
                        Container(
                          height: 345.h,
                          width: 175.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              border: Border.all(color: containerBorderColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50.h,
                                width: 175.w,
                                decoration: BoxDecoration(
                                    color: containerShadowColor,
                                    borderRadius: BorderRadius.circular(5.w),
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: containerBorderColor))),
                                child: "Weight Statistics"
                                    .toText(
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )
                                    .align(Alignment.centerLeft)
                                    .paddingSymmetric(horizontal: 5.w),
                              ),
                              35.webScaleHeight(context),
                              renderingRow(
                                  context, "Starting Weight:", "85.5 kg"),
                              renderingRow(context, "Height:", "1.36 m"),
                              renderingRow(context, "Starting BMI:", "30.5"),
                              renderingRow(context, "Current BMI:", "19.9"),
                              renderingRow(context, "Latest Weight:", "65.2"),
                              renderingRow(
                                  context, "Total Weight Lost:", "21.7 kg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  Container(
                    height: 345.h,
                    // width: 175.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        border: Border.all(color: containerBorderColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          // width: 175.w,
                          decoration: BoxDecoration(
                              color: containerShadowColor,
                              borderRadius: BorderRadius.circular(5.w),
                              border: const Border(
                                  bottom:
                                      BorderSide(color: containerBorderColor))),
                          child: "Account activity"
                              .toText(
                                color: blackPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )
                              .align(Alignment.centerLeft)
                              .paddingSymmetric(horizontal: 5.w),
                        ),
                        10.height,
                        Column(
                          children: [
                            Row(
                              children: [
                                renderingColumn(context, "Recipe was declined.",
                                    "10-Jan-23  10:30"),
                                renderingColumn(
                                    context,
                                    "Profile picture has been updated.",
                                    "07-Mar-23  17:39"),
                                renderingColumn(
                                    context,
                                    "Account login from new device.",
                                    "Device: Xiaomi Redmi Pro 2\n31-Oct-23  23:58"),
                                renderingColumn(context,
                                    "Cancelled subscription", "05-May-22"),
                              ],
                            ),
                            Row(
                              children: [
                                renderingColumn(
                                    context,
                                    "Account login from new location.",
                                    "Location: New York, USA\n31-Oct-23  23:58"),
                                renderingColumn(
                                    context,
                                    "4 Recipes have been approved by Admin.",
                                    "19-Dec-22"),
                                renderingColumn(context, "Added a weight entry",
                                    "22-Jun-19  15:23"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  Container(
                    decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(13.webT(context)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "User Recipe Collection".toText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 345.h,
                                width: 175.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    border: Border.all(
                                        color: containerBorderColor)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 175.w,
                                      decoration: BoxDecoration(
                                          color: containerShadowColor,
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          border: const Border(
                                              bottom: BorderSide(
                                                  color:
                                                      containerBorderColor))),
                                      child: "Private Recipes"
                                          .toText(
                                            color: blackPrimary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )
                                          .align(Alignment.centerLeft)
                                          .paddingSymmetric(horizontal: 5.w),
                                    ),
                                    35.webScaleHeight(context),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 175.w,
                                          child:
                                              "Chicken Salad with Mayonnaise Dressing"
                                                  .toText(
                                                      fontSize: 12,
                                                      color: blackPrimary,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      maxLine: 2),
                                        ).center,
                                        25.webScaleHeight(context),
                                        SizedBox(
                                          width: 175.w,
                                          child:
                                              "Grilled Cheese Sandwich and Tomato Soup"
                                                  .toText(
                                                      fontSize: 12,
                                                      color: blackPrimary,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      maxLine: 2),
                                        ).center,
                                        25.webScaleHeight(context),
                                        SizedBox(
                                          width: 175.w,
                                          child: "Frozen Oats Cups".toText(
                                              fontSize: 12,
                                              color: blackPrimary,
                                              fontWeight: FontWeight.w400,
                                              maxLine: 2),
                                        ).center,
                                        25.webScaleHeight(context),
                                        SizedBox(
                                          width: 175.w,
                                          child: "Apple and Yogurt Parfait"
                                              .toText(
                                                  fontSize: 12,
                                                  color: blackPrimary,
                                                  fontWeight: FontWeight.w400,
                                                  maxLine: 2),
                                        ).center,
                                        25.webScaleHeight(context),
                                        SizedBox(
                                          width: 175.w,
                                          child: "Homemade Dried Fruit Bars"
                                              .toText(
                                                  fontSize: 12,
                                                  color: blackPrimary,
                                                  fontWeight: FontWeight.w400,
                                                  maxLine: 2),
                                        ).center,
                                      ],
                                    ).paddingAll(5),
                                  ],
                                )),
                            Container(
                                height: 345.h,
                                width: 175.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: Border.all(
                                        color: containerBorderColor)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50.h,
                                      // width: 175.w,
                                      decoration: BoxDecoration(
                                          color: containerShadowColor,
                                          borderRadius: BorderRadius.circular(
                                              13.webT(context)),
                                          border: const Border(
                                              bottom: BorderSide(
                                                  color:
                                                      containerBorderColor))),
                                      child: "Shared Recipes"
                                          .toText(
                                            color: blackPrimary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )
                                          .align(Alignment.centerLeft)
                                          .paddingSymmetric(
                                              horizontal: 20.webT(context)),
                                    ),
                                    35.webScaleHeight(context),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 175.w,
                                          child:
                                              "Chicken Salad with Mayonnaise Dressing"
                                                  .toText(
                                                      fontSize: 12,
                                                      color: blackPrimary,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      maxLine: 2),
                                        ).center,
                                        25.webScaleHeight(context),
                                        SizedBox(
                                          width: 175.w,
                                          child:
                                              "Grilled Cheese Sandwich and Tomato Soup"
                                                  .toText(
                                                      fontSize: 12,
                                                      color: blackPrimary,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      maxLine: 2),
                                        ).center,
                                        25.webScaleHeight(context),
                                        SizedBox(
                                          width: 175.w,
                                          child: "Frozen Oats Cups".toText(
                                              fontSize: 12,
                                              color: blackPrimary,
                                              fontWeight: FontWeight.w400,
                                              maxLine: 2),
                                        ).center,
                                        25.webScaleHeight(context),
                                      ],
                                    ).paddingAll(5.w),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ).paddingAll(40.webT(context)),
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  Container(
                      height: 345.h,
                      // width: 175.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          border: Border.all(color: containerBorderColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50.h,
                            // width: 175.w,
                            decoration: BoxDecoration(
                                color: containerShadowColor,
                                borderRadius: BorderRadius.circular(5.w),
                                border: const Border(
                                    bottom: BorderSide(
                                        color: containerBorderColor))),
                            child: "Pending Approval"
                                .toText(
                                  color: blackPrimary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                )
                                .align(Alignment.centerLeft)
                                .paddingSymmetric(horizontal: 12.webT(context)),
                          ),
                          35.webScaleHeight(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              "Chicken Salad with Mayonnaise Dressing"
                                  .toText(
                                      fontSize: 12,
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w400,
                                      maxLine: 2)
                                  .center,
                              5.height,
                              "Chicken Salad with Mayonnaise Dressing"
                                  .toText(
                                      fontSize: 12,
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w400,
                                      maxLine: 2)
                                  .center,
                            ],
                          ).paddingAll(5.w),
                          25.webScaleHeight(context),
                        ],
                      )).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  Container(
                    width: 500.w,
                    decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(13.webT(context)),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 500.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                "Weight Entries".toText(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: blackPrimary),
                                100.width,
                                Container(
                                  width: 80.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: bluePrimary,
                                      borderRadius: BorderRadius.circular(5.w)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomImage(
                                          image: Images.iconCalender,
                                          width: 12.w,
                                          height: 12.w),
                                      3.width,
                                      "Pick a Date"
                                          .toText(
                                              fontSize: 12,
                                              color: whitePrimary,
                                              fontWeight: FontWeight.w500)
                                          .onPress(() {
                                        controller.selectDate(context);
                                      })
                                    ],
                                  ).center,
                                ),
                              ],
                            ),
                            35.webScaleHeight(context),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      "Day on the Plan".toText(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: blackPrimary),
                                      CustomImage(
                                          image: Images.iconFilter,
                                          width: 10.w,
                                          height: 10.w)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: "Weight".toText(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: blackPrimary),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Row(
                                    children: [
                                      "Day of Entry".toText(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: blackPrimary),
                                      CustomImage(
                                          image: Images.iconFilter,
                                          width: 12.w,
                                          height: 12.w)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 65.w,
                                  child: "Action"
                                      .toText(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: blackPrimary)
                                      .align(Alignment.centerRight),
                                ),
                              ],
                            ),
                            Container(
                              height: 1.webH(context),
                              color: dividerColor,
                            ).paddingSymmetric(vertical: 20.webT(context)),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 200.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                        width: 12.w,
                                                        child: Container(
                                                          width: 12.w,
                                                          height: 12.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.w),
                                                              border: Border.all(
                                                                  color:
                                                                      textGreyColor)),
                                                        ))
                                                    .paddingSymmetric(
                                                        horizontal: 5.w),
                                                "Round 2  Day 25"
                                                    .toText(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: blackPrimary)
                                                    .center
                                                    .expanded,
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100.w,
                                            child: "87.5 kg".toText(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: blackPrimary),
                                          ),
                                          SizedBox(
                                            width: 100.w,
                                            child: Row(
                                              children: [
                                                "04-Aug-19  14:08".toText(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: blackPrimary),
                                                CustomImage(
                                                    image: Images.iconFilter,
                                                    width: 8.w,
                                                    height: 8.w)
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 65.w,
                                            child: CustomImage(
                                              image: Images.iconDropDown,
                                              iconColor: bluePrimary,
                                              width: 14.w,
                                              height: 14.w,
                                            ).align(Alignment.centerRight),
                                          ),
                                        ],
                                      ).onPress(() {
                                        if (selectedIndex == index) {
                                          selectedIndex = -1;
                                        } else {
                                          selectedIndex = index;
                                        }
                                        controller.notifyListeners();
                                      }),
                                      if (selectedIndex == index)
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                blueSecondary.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(5.w),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 395.h,
                                                    width: 145.w,
                                                    decoration: BoxDecoration(
                                                        color: whitePrimary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.w),
                                                        border: Border.all(
                                                            color:
                                                                containerBorderColor)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 55.h,
                                                          width: 145.w,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  containerShadowColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.w),
                                                              border: const Border(
                                                                  bottom: BorderSide(
                                                                      color:
                                                                          containerBorderColor))),
                                                          child:
                                                              "Weight and measurements"
                                                                  .toText(
                                                                    color:
                                                                        blackPrimary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12,
                                                                  )
                                                                  .align(Alignment
                                                                      .centerLeft)
                                                                  .paddingSymmetric(
                                                                      horizontal:
                                                                          20.webT(
                                                                              context)),
                                                        ),
                                                        30.webScaleHeight(
                                                            context),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "Weight".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          containerTextColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "13.8 kg".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          blackPrimary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              ],
                                                            ),
                                                            5.webScaleHeight(
                                                                context),
                                                            const Divider(),
                                                            5.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Chest:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "136 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            5.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Neck:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "67 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            10.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Left Arm:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "18 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            5.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Right Arm:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "18 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            10.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Waist:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "56 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            5.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Hips:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "65 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            10.webScaleHeight(
                                                                context),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 60.w,
                                                                    child: "Left Thigh:".toText(
                                                                        fontSize:
                                                                            10,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 60.w,
                                                                    child: "37 cm".toText(
                                                                        fontSize:
                                                                            10,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            ),
                                                            10.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Left Calf:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "16 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            5.webScaleHeight(
                                                                context),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "Right Calf:".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                containerTextColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            maxLine: 2)),
                                                                    SizedBox(
                                                                        width: 60
                                                                            .w,
                                                                        child: "18 cm".toText(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                blackPrimary,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            maxLine: 2)),
                                                                  ],
                                                                )),
                                                            5.webScaleHeight(
                                                                context),
                                                            const Divider(),
                                                            5.webScaleHeight(
                                                                context),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "Blood Pressure:".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          containerTextColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "120/80 mmHg".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          blackPrimary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              ],
                                                            ),
                                                            5.webScaleHeight(
                                                                context),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "Blood Sugar".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          containerTextColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "5.6 mmol/L".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          blackPrimary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ).paddingSymmetric(
                                                            horizontal: 20
                                                                .webT(context),
                                                            vertical: 5.h)
                                                      ],
                                                    ),
                                                  ),
                                                  7.width,
                                                  Container(
                                                    height: 395.h,
                                                    width: 145.w,
                                                    decoration: BoxDecoration(
                                                        color: whitePrimary,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                13.webT(
                                                                    context)),
                                                        border: Border.all(
                                                            color:
                                                                containerBorderColor)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 55.h,
                                                          width: 145.w,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  containerShadowColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.w),
                                                              border: const Border(
                                                                  bottom: BorderSide(
                                                                      color:
                                                                          containerBorderColor))),
                                                          child: "Images"
                                                              .toText(
                                                                color:
                                                                    blackPrimary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12,
                                                              )
                                                              .align(Alignment
                                                                  .centerLeft)
                                                              .paddingSymmetric(
                                                                  horizontal: 20
                                                                      .webT(
                                                                          context)),
                                                        ),
                                                        30.webScaleHeight(
                                                            context),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "Body".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          containerTextColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child: "Face".toText(
                                                                      fontSize:
                                                                          10,
                                                                      color:
                                                                          blackPrimary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ).paddingSymmetric(
                                                            horizontal: 20
                                                                .webT(context))
                                                      ],
                                                    ),
                                                  ),
                                                  7.width,
                                                  Container(
                                                    height: 395.h,
                                                    width: 145.w,
                                                    decoration: BoxDecoration(
                                                        color: whitePrimary,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                13.webT(
                                                                    context)),
                                                        border: Border.all(
                                                            color:
                                                                containerBorderColor)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 55.h,
                                                          width: 160.w,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  containerShadowColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.w),
                                                              border: const Border(
                                                                  bottom: BorderSide(
                                                                      color:
                                                                          containerBorderColor))),
                                                          child: "Journal Entry"
                                                              .toText(
                                                                color:
                                                                    blackPrimary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12,
                                                              )
                                                              .align(Alignment
                                                                  .centerLeft)
                                                              .paddingSymmetric(
                                                                  horizontal: 20
                                                                      .webT(
                                                                          context)),
                                                        ),
                                                        25.webScaleHeight(
                                                            context),
                                                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
                                                            .toText(
                                                                fontSize: 10,
                                                                color:
                                                                    blackPrimary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                maxLine: 16)
                                                            .paddingSymmetric(
                                                              horizontal: 20
                                                                  .webT(
                                                                      context),
                                                            ),
                                                        20.webScaleHeight(
                                                            context),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ).paddingAll(10.w),
                                        ).paddingSymmetric(
                                            vertical: 10.h, horizontal: 7.w),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 1.webH(context),
                                    color: dividerColor,
                                  ).paddingSymmetric(
                                      vertical: 20.webT(context));
                                },
                                itemCount: 5),
                          ],
                        ).paddingAll(40.webT(context)),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  Container(
                    decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(13.webT(context)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "App Spend".toText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                        35.webScaleHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: "Date"
                                  .toText(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: containerTextColor)
                                  .align(Alignment.centerLeft),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: "Amount"
                                  .toText(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: containerTextColor)
                                  .center,
                            ),
                            SizedBox(
                              width: 100.w,
                              child: "Item"
                                  .toText(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: containerTextColor)
                                  .center,
                            ),
                          ],
                        ),
                        Container(
                          height: 1.webH(context),
                          color: dividerColor,
                        ).paddingSymmetric(vertical: 20.webT(context)),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: "13-Jan-2023  21:17"
                                        .toText(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: blackPrimary)
                                        .align(Alignment.centerLeft),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: "R86.09"
                                        .toText(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: blackPrimary)
                                        .center,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Container(
                                            width: 60.w,
                                            height: 24.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35.w),
                                                border: Border.all(
                                                    color: greenPrimary)),
                                            child: "App Purchase"
                                                .toText(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: greenPrimary)
                                                .center)
                                        .paddingSymmetric(horizontal: 17.w),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                height: 1.webH(context),
                                color: dividerColor,
                              ).paddingSymmetric(vertical: 20.webT(context));
                            },
                            itemCount: 5),
                        Container(
                          height: 1.webH(context),
                          color: dividerColor,
                        ).paddingSymmetric(vertical: 20.webT(context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            "Lifetime Spend".toText(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: bluePrimary),
                            50.webScaleWidth(context),
                            CustomButton(
                              buttonName: "R1 592.99",
                              onPressed: () {},
                              buttonTextColor: whitePrimary,
                              borderColor: bluePrimary,
                              buttonColor: bluePrimary,
                              width: 110.w,
                              height: 40.h,
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(40.webT(context)),
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  renderingDetailBox(
      BuildContext context,
      String title,
      String titleNumber,
      String titleIcon,
      String arrowIcon,
      String titlePercentage,
      String titleDescription) {
    return SizedBox(
      width: 280.webW(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleNumber.toText(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: blackPrimary),
              Container(
                width: 60.webT(context),
                height: 60.webT(context),
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(16.webT(context)),
                  boxShadow: [
                    BoxShadow(
                      color: blueSecondary.withOpacity(0.2),
                      offset: const Offset(0, 3),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: CustomImage(
                  image: titleIcon,
                  width: 25.webT(context),
                  height: 25.webT(context),
                ).center,
              ),
            ],
          ),
          title.toText(fontSize: 22, color: blackPrimary),
          15.webHeight(context),
          Row(
            children: [
              CustomImage(
                image: arrowIcon,
                width: 25.webT(context),
                height: 25.webT(context),
              ),
              10.webWidth(context),
              titlePercentage.toText(fontSize: 18),
              15.webWidth(context),
              titleDescription.toText(fontSize: 18),
            ],
          )
        ],
      ),
    );
  }

  renderingRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80.w,
          child: title.toText(
              fontSize: 10,
              color: containerTextColor,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 80.w,
          child: value.toText(
              fontSize: 10, color: blackPrimary, fontWeight: FontWeight.w500),
        )
      ],
    ).paddingOnly(left: 5.w, right: 5.w, bottom: 15.h);
  }

  renderingColumn(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: title.toText(
              fontSize: 12, color: blackPrimary, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 80.w,
          child: value.toText(
              fontSize: 12,
              color: containerTextColor,
              fontWeight: FontWeight.w500,
              maxLine: 2),
        )
      ],
    ).paddingOnly(left: 5.w, right: 5.w, bottom: 15.h);
  }
}
